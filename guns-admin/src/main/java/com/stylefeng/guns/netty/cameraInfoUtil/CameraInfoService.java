package com.stylefeng.guns.netty.cameraInfoUtil;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.stylefeng.guns.modular.business.service.IParamConfigService;
import com.stylefeng.guns.modular.system.model.ParamConfig;
import com.stylefeng.guns.netty.HttpBillRuleUtil.HttpBillRuleRequestInfoService;
import com.stylefeng.guns.netty.HttpPortInfoSyncUtil.HttpPortInfoSyncRequestInfoService;
import com.stylefeng.guns.netty.HttpSortModeUtil.HttpSortModeService;
import com.stylefeng.guns.netty.Supply2ServerConst;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;

@Service
public class CameraInfoService implements ApplicationContextAware {

    private static final Logger logger = LoggerFactory.getLogger(CameraInfoService.class);
    /**
     * 每个处理的方法的Bean都可以通过applicationContext来获得
     */
    private static ApplicationContext applicationContext;
    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        CameraInfoService.applicationContext = applicationContext;
        this.startService(9195);
    }
    private void startService(int port){
        CameraInfoServer server = new CameraInfoServer(applicationContext, port);
        try {
            Thread thread = new Thread(server);
            thread.start();
            HttpBillRuleRequestInfoService.bestExpressRequestQueue.put(Supply2ServerConst.bestExpressBillRuleURL);
            IParamConfigService paramConfigService = applicationContext.getBean(IParamConfigService.class);
            EntityWrapper<ParamConfig> wrapper = new EntityWrapper<>();
            wrapper.eq("keyy","pipeline");
            ParamConfig paramConfig = paramConfigService.selectOne(wrapper);
            HttpPortInfoSyncRequestInfoService.bestExpressRequestQueue.put(paramConfig.getValue());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
