package com.stylefeng.guns.cache;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.stylefeng.guns.core.util.ToolUtil;
import com.stylefeng.guns.modular.business.service.IPlcConfigService;
import com.stylefeng.guns.modular.system.model.PlcConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PlcConfigCache implements ApplicationContextAware {

    private static ApplicationContext applicationContext;

    private static final Logger logger = LoggerFactory.getLogger(PlcConfigCache.class);

    private static List<PlcConfig> plcConfigList = new ArrayList<>();

    private static PlcConfig plcBuMaConfigEntity = new PlcConfig();

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
        startService();
    }

    private void startService(){
        init();
    }

    public static PlcConfig getSortPlcConfig(){
        for (PlcConfig plcConfig:plcConfigList){
            if (ToolUtil.equals("1",plcConfig.getType())&&ToolUtil.equals("1",plcConfig.getIsUsed())){
                return plcConfig;
            }
        }
        return  null;
    }

    public static PlcConfig getBuMaPlcConfig(){
        for (PlcConfig plcConfig:plcConfigList){
            if (ToolUtil.equals("2",plcConfig.getType())&&ToolUtil.equals("1",plcConfig.getIsUsed())){
                return plcConfig;
            }
        }
        return  null;
    }

    public static void init(){
        IPlcConfigService plcConfigService = applicationContext.getBean(IPlcConfigService.class);
        plcConfigList = plcConfigService.selectList(null);
        if (ToolUtil.isEmpty(plcConfigList)){
            logger.info("init cache success");
        }else {
            logger.info("init cache fail,tbl_plc_config is null");
        }

    }


}
