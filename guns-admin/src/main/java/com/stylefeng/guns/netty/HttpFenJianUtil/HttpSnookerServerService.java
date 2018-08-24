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
public class HttpSnookerServerService implements ApplicationContextAware {

    private static final Logger logger = LoggerFactory.getLogger(HttpSnookerServerService.class);


    private ApplicationContext applicationContext;

    private static HttpSnoopServer httpSnoopServer;

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
        this.startService();
    }



    private void startService() {
        try {
            httpSnoopServer = new HttpSnoopServer();
            Thread thread = new Thread(new Runnable() {
                @Override
                public void run() {
                    try{
                        httpSnoopServer.start();
                        logger.info("HttpSnookerServerService start -------------->");

                    }catch (Exception e){
                        logger.error("HttpSnookerServerService  start error[{}]",e.getMessage());
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
