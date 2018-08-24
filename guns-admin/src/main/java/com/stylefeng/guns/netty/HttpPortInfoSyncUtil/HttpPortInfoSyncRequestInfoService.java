package com.stylefeng.guns.netty.HttpPortInfoSyncUtil;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.mapper.SqlRunner;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.stylefeng.guns.cache.ParamConigCache;
import com.stylefeng.guns.cache.PortSyncCache;
import com.stylefeng.guns.modular.business.service.IPortSyncService;
import com.stylefeng.guns.modular.system.model.PortSync;
import com.stylefeng.guns.netty.Supply2ServerConst;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.LinkedBlockingQueue;

/**
 * 发送请求参数给百世
 */
@Service
public class HttpPortInfoSyncRequestInfoService implements ApplicationContextAware {

    private static final Logger logger = LoggerFactory.getLogger(HttpPortInfoSyncRequestInfoService.class);


    private static ApplicationContext applicationContext;



    public static final LinkedBlockingQueue<String> bestExpressRequestQueue = new LinkedBlockingQueue<String>();


    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        HttpPortInfoSyncRequestInfoService.applicationContext = applicationContext;
        this.startService();
    }



    private void startService() {
        logger.info("Starting Service-------------->");

        Thread thread = new Thread(() -> {
            try{
                while(true) {
                    String sendToBestExpress = bestExpressRequestQueue.take();
                    if(sendToBestExpress != null) {
                        try {
                            Thread.sleep(20);
                            connect(Supply2ServerConst.bestExpressPortURL+"?pipeline="+ ParamConigCache.getPipeline());
                        } catch (InterruptedException e) {
                            logger.error("send data to BestExpress error2:", e);
                        }
                    }
                }
            }catch (Exception e){
                logger.error("send data to BestExpress error:",e);
            }
        });

        thread.start();

    }

    private static void connect(String requestUrl) throws IOException {
        String res;
        JsonObject object = null;
        StringBuffer buffer = new StringBuffer();
        try{
            URL url = new URL(requestUrl);
            HttpURLConnection urlCon= (HttpURLConnection)url.openConnection();
            if(200==urlCon.getResponseCode()){
                InputStream is = urlCon.getInputStream();
                InputStreamReader isr = new InputStreamReader(is,"utf-8");
                BufferedReader br = new BufferedReader(isr);
                String str = null;
                while((str = br.readLine())!=null){
                    buffer.append(str);
                }
                br.close();
                isr.close();
                is.close();
                res = buffer.toString();
                JsonParser parse =new JsonParser();
                object = (JsonObject) parse.parse(res);
            }
        }catch(IOException e){
            e.printStackTrace();
        }
        if (object!=null){
            String  jsonString = object.toString();
            Map<String,Object> getBestExpressDataMap= JSON.parseObject(jsonString, Map.class);
            Integer status=(Integer) getBestExpressDataMap.get("status");
            if (status==0){
                logger.error("returnJson:".concat(jsonString));
                return;
            }

            logger.info("returnJson:".concat(jsonString));

            List<Map> resultString = (List<Map>)getBestExpressDataMap.get("listResult");

            IPortSyncService iPortSyncService = applicationContext.getBean(IPortSyncService.class);

            List<PortSync> portSyncList = new ArrayList<>();

            for(Map<String,String> stringContent:resultString)
            {
                logger.info(stringContent.toString());
                //流水线号
                String pipeline=stringContent.get("pipeline");
                //分拣口编号
                String sortPortCode=stringContent.get("sortPortCode");
                //目的站点编码
                String destSiteCode=stringContent.get("destSiteCode");
                //目的站点
                String destSiteName=stringContent.get("destSiteName");
                //分拣模式
                String sortMode=stringContent.get("sortMode");
                //站点分拣编码
                String destSortingCode=stringContent.get("destSortingCode");
                String belongSiteName=stringContent.get("belongSiteName");

                PortSync portSync = new PortSync();
                portSync.setBelongSiteName(belongSiteName);
                portSync.setPipeline(pipeline);
                portSync.setDestSiteName(destSiteName);
                portSync.setDestSiteCode(destSiteCode);
                portSync.setDestSortingCode(destSortingCode);
                portSync.setSortPortCode(sortPortCode);
                portSync.setSortMode(sortMode);
                portSyncList.add(portSync);

            }
            SqlRunner.db().delete("truncate table  tbl_port_sync");
            iPortSyncService.insertBatch(portSyncList);

            PortSyncCache.initCache();

        }
    }
}
