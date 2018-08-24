package com.stylefeng.guns.netty.RequestMappingUtil;

import com.stylefeng.guns.netty.Supply2ServerConst;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;

/**
 * 主要处理请求逻辑格口和物理格口对应关系，开机关机等信息
 * Created by Belo Lee on 2016/10/2.
 */

@Service
public class RequestMappingService implements ApplicationContextAware {

    private static final Logger logger = LoggerFactory.getLogger(RequestMappingService.class);

    /**
     * 每个处理的方法的Bean都可以通过applicationContext来获得
     */
    private ApplicationContext applicationContext;

    /**
     * 监听的端口为10001
     */
    private void startService(int port){
        logger.info("RequestMappingService startService -------------->");
        RequestMappingServer server = new RequestMappingServer(applicationContext, port);
        try {
            Thread thread = new Thread(server);
            thread.start();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
        this.startService(Supply2ServerConst.requestMappingPort);
    }
}
