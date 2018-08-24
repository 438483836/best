package com.stylefeng.guns.netty.HttpSortModeUtil;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;

import java.util.concurrent.LinkedBlockingQueue;

/**
 * 分拣模式获取
 */
@Service
public class HttpSortModeService implements ApplicationContextAware {

    private static final Logger logger = LoggerFactory.getLogger(HttpSortModeService.class);

    private ApplicationContext applicationContext;

    private static HttpSortModelClient httpSortModelClient;

    public static final LinkedBlockingQueue<String> bestSortModeRequestQueue = new LinkedBlockingQueue<String>();

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
        this.startService();
    }

    private void startService() {
        this.httpSortModelClient = new HttpSortModelClient(this.applicationContext);
        logger.info("HttpSortModelService startService -------------->");
        try {
            this.httpSortModelClient.start();


            Thread thread = new Thread(new Runnable() {
                @Override
                public void run() {
                    try{
                        while(true) {
                            String msg = bestSortModeRequestQueue.take();
                            if(StringUtils.isNotEmpty(msg)) {
                                try {
                                    Thread.sleep(20);
                                    sendDataToBest(msg);
                                } catch (InterruptedException e) {
                                    logger.error("Send Sort-Mode Data To BestExpress error2:[{}]", e);
                                }
                            }
                        }
                    }catch (Exception e){
                        logger.error("Send Sort-Mode Data To BestExpress error:[{}]",e);
                    }
                }
            });

            thread.start();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void sendDataToBest(String msg) {
        try {
            httpSortModelClient.sendSyncImpl(msg);
            logger.info("Send Sort-Mode Data To BestExpress FINISH. msg:[{}]",msg);
        } catch (InterruptedException e) {
            logger.error("Send Sort-Mode Data To BestExpress Failed. msg:[{}],err-info[{}]",msg,e);
        }
    }
}
