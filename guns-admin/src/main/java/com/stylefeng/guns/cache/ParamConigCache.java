package com.stylefeng.guns.cache;

import com.stylefeng.guns.core.util.ToolUtil;
import com.stylefeng.guns.modular.business.service.IParamConfigService;
import com.stylefeng.guns.modular.system.model.ParamConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ParamConigCache implements ApplicationContextAware {

    private static ApplicationContext applicationContext;

    private static final Logger logger = LoggerFactory.getLogger(ParamConigCache.class);

    private static List<ParamConfig> paramConfigList = new ArrayList<>();

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        ParamConigCache.applicationContext = applicationContext;
        startService();
    }

    private void startService(){
        init();
    }

    public static String getPipeline(){
        for (ParamConfig mode:paramConfigList){
            if (ToolUtil.equals("pipeline",mode.getKeyy())){
                return mode.getValue();
            }
        }
        return  "";
    }

    public static List<String> getExceptionChute(){
        List<String> exceptionChutes = new ArrayList<>();
        for (ParamConfig mode:paramConfigList){
            if (ToolUtil.equals("exceptionChute",mode.getKeyy())){
                String chutes[] = mode.getValue().split(",");
                for (String chute:chutes){
                    exceptionChutes.add(chute);
                }
                return exceptionChutes;

            }
        }
        return null;
    }

    public static String getLineNo(){
        for (ParamConfig mode:paramConfigList){
            if (ToolUtil.equals("lineno",mode.getKeyy())){
                return mode.getValue();
            }
        }
        return  "";
    }

    public static void init(){
        IParamConfigService paramConfigService = applicationContext.getBean(IParamConfigService.class);
        paramConfigList = paramConfigService.selectList(null);
        if (paramConfigList.isEmpty()){
            logger.info("init cache fail,paramConfigList is empty");

        }else {
            logger.info("init cache success.[{}]",paramConfigList.toString());
        }
    }


}
