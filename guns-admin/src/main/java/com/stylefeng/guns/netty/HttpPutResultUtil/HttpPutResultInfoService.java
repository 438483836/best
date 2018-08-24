package com.stylefeng.guns.netty.HttpPutResultUtil;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;

import java.util.concurrent.LinkedBlockingQueue;

/**
 * 发送请求参数给中通
 */
@Service
public class HttpPutResultInfoService implements ApplicationContextAware {

    private static final Logger logger = LoggerFactory.getLogger(HttpPutResultInfoService.class);


    private ApplicationContext applicationContext;

    private static HttpPutResultRequestClient httpPutResultRequestClient;


    public static final LinkedBlockingQueue<String> bestExpressResultQueue = new LinkedBlockingQueue<String>();


    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
        this.startService();
    }


    public static void sendData2BestExpress(String msg) throws InterruptedException {
        try {

            httpPutResultRequestClient.sendSyncImpl(msg);

            logger.info("HttpPutResultInfoService finish,msg:[{}]"
                    +msg);

        }catch (Exception e){
            //处理未成功,重新放入队列处理,为保证安全,先不放入队列处理
            //yundaRequestQueue.put(tmesDetail);
            logger.error("HttpPutResultInfoService error:[{}], " +
                            "msg:[{}]",
                    e, msg);
        }
    }

    private void startService() {
        this.httpPutResultRequestClient = new HttpPutResultRequestClient(this.applicationContext);
        logger.info("HttpPutResultInfoService startService -------------->");
        try {
            this.httpPutResultRequestClient.start();

            Thread thread = new Thread(new Runnable() {
                @Override
                public void run() {
                    try{
                        while(true) {
                            String msg = bestExpressResultQueue.take();
                            if(StringUtils.isNotEmpty(msg)) {
                                try {
                                    Thread.sleep(20);
                                    sendData2BestExpress(msg);
                                } catch (InterruptedException e) {
                                    logger.error("send BestExpress error2:", e);
                                }
                            }
                        }
                    }catch (Exception e){
                        logger.error("send yBestExpress error:",e);
                    }
                }
            });

            thread.start();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static void main(String[] args) {

    }

}
