package com.stylefeng.guns.netty.HttpFenJianUtil;

import com.stylefeng.guns.netty.requestEntity.SortInfoRequestEntity;
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
public class HttpFenJianRequestInfoService implements ApplicationContextAware {

    private static final Logger logger = LoggerFactory.getLogger(HttpFenJianRequestInfoService.class);


    private ApplicationContext applicationContext;

    private static HttpFenJianRequestClient httpFenJianRequestClient;


    public static final LinkedBlockingQueue<SortInfoRequestEntity> bestSortingRequestQueue = new LinkedBlockingQueue<SortInfoRequestEntity>();


    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
        this.startService();
    }


    public static void sendDataToBest(SortInfoRequestEntity request) throws InterruptedException {
        try {

            httpFenJianRequestClient.sendSyncImpl(request);

            logger.info("HttpFenJianRequestInfoService sendDataToBest ,request:[{}]"
                    ,request.toString());

        }catch (Exception e){
            //处理未成功,重新放入队列处理,为保证安全,先不放入队列处理
            //yundaRequestQueue.put(tmesDetail);
            logger.error("HttpFenJianRequestInfoService sendDataToBest error:[{}], " +
                            "request:[{}]",
                    e, request.toString());
        }
    }

    private void startService() {
        this.httpFenJianRequestClient = new HttpFenJianRequestClient(this.applicationContext);
        logger.info("HttpFenJianRequestInfoService startService -------------->");
        try {
            this.httpFenJianRequestClient.start();

            Thread thread = new Thread(new Runnable() {
                @Override
                public void run() {
                    try{
                        while(true) {
                            SortInfoRequestEntity request = bestSortingRequestQueue.take();
                            if(request != null) {
                                try {
                                    Thread.sleep(20);
                                    sendDataToBest(request);
                                } catch (InterruptedException e) {
                                    logger.error("send data to BestExpress error2:", e);
                                }
                            }
                        }
                    }catch (Exception e){
                        logger.error("send data to BestExpress error:",e);
                    }
                }
            });

            thread.start();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static String TQ_GetHexStringEx(int iNumber,int iCount){
        String s = Integer.toHexString(iNumber);
        int length = s.length();
        for(int i=0;i<iCount-length;i++) {
            s="0"+s;
        }
        return s;
    }
}
