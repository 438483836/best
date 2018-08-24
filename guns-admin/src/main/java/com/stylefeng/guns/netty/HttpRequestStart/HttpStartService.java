package com.stylefeng.guns.netty.HttpRequestStart;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;

import java.util.concurrent.*;

/**
 * MES单机写入供包台的通信
 * Created by Belo Lee on 2016/10/2.
 */
@Service
public class HttpStartService implements ApplicationContextAware {

    private static final Logger logger = LoggerFactory.getLogger(HttpStartService.class);


    private ApplicationContext applicationContext;

    private static HttpRequestStartClient httpRequestStartClient;


    public static final LinkedBlockingQueue<String> bestRequestQueue = new LinkedBlockingQueue<String>();

    private static ConcurrentHashMap<String , String> tmatrixPlcConfigConcurrentHashMap = new ConcurrentHashMap<>();

    private ScheduledExecutorService scheduledExecutorService = Executors.newSingleThreadScheduledExecutor(new ThreadFactory() {
        @Override
        public Thread newThread(Runnable r) {
            return new Thread(r, "getStartScheduledExecutorService");
        }
    });


    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
        this.startService();
    }


    public static void sendData2ToBest(String str) throws InterruptedException {
        try {

            httpRequestStartClient.sendSyncImpl(str);
            logger.info("sendData2zhongtong success,map:[{}]"
                    +str);

        }catch (Exception e){
            //处理未成功,重新放入队列处理,为保证安全,先不放入队列处理
            //yundaRequestQueue.put(tmesDetail);
            logger.error("sendData2zhongtong error:[{}], " +
                            "map:[{}]",
                    e, str);
        }
    }

    private void startService() {
        this.httpRequestStartClient = new HttpRequestStartClient(this.applicationContext);
        logger.info("HttpStartService startService -------------->");
        try {
            this.httpRequestStartClient.start();

            Thread thread = new Thread(new Runnable() {
                @Override
                public void run() {
                    try{
                        while(true) {
                            String sendToBest = bestRequestQueue.take();
                            if(sendToBest != null) {
                                try {
                                    Thread.sleep(20);
                                    sendData2ToBest(sendToBest);
                                } catch (InterruptedException e) {
                                    logger.error("send zhongtong data to yidatong error2:", e);
                                }
                            }
                        }
                    }catch (Exception e){
                        logger.error("send zhongtong data to yidatong error:",e);
                    }
                }
            });

            thread.start();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
