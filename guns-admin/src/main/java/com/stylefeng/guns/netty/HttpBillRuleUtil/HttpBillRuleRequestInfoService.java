package com.stylefeng.guns.netty.HttpBillRuleUtil;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.mapper.SqlRunner;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.stylefeng.guns.cache.BillRuleCache;
import com.stylefeng.guns.modular.business.service.IBillCodeDefinitionService;
import com.stylefeng.guns.modular.system.model.BillCodeDefinition;
import org.apache.commons.beanutils.BeanUtils;
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
import java.lang.reflect.InvocationTargetException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.*;
import java.util.concurrent.LinkedBlockingQueue;

/**
 * 发送面单规则请求参数给百世
 */
@Service
public class HttpBillRuleRequestInfoService implements ApplicationContextAware {

    private static final Logger logger = LoggerFactory.getLogger(HttpBillRuleRequestInfoService.class);


    private static ApplicationContext applicationContext;


    public static final LinkedBlockingQueue<String> bestExpressRequestQueue = new LinkedBlockingQueue<String>();


    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        HttpBillRuleRequestInfoService.applicationContext = applicationContext;
        this.startService();
    }



    private void startService() {
        logger.info("Starting Service------------->");
        try {
            Thread thread = new Thread(() -> {
                try{
                    while(true) {
                        String url = bestExpressRequestQueue.take();
                        if(url != null) {
                            try {
                                Thread.sleep(20);
                                connect(url);
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

        } catch (Exception e) {
            e.printStackTrace();
        }
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

            IBillCodeDefinitionService billCodeDefinitionService = applicationContext.getBean(IBillCodeDefinitionService.class);
            SqlRunner.db().delete("truncate table  tbl_bill_code_definition");
            Set<String> billCodeSet = new HashSet<>();
            List<BillCodeDefinition> lists=new ArrayList<>();
            for (Map<String, Object> stringContent : resultString) {
                logger.info(stringContent.toString());
                String code = (String) stringContent.get("code");
                BillCodeDefinition billCodeDefinitionVOEntity = new BillCodeDefinition();
                try {
                    BeanUtils.populate(billCodeDefinitionVOEntity, stringContent);
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                } catch (InvocationTargetException e) {
                    e.printStackTrace();
                }

                if (billCodeSet.contains(code)) {
                    continue;
                } else {
                    billCodeSet.add(code);
                }
                lists.add(billCodeDefinitionVOEntity);
                logger.info("insert billCodeDefinition data:" + billCodeDefinitionVOEntity.toString());
                //异步保存
            }
            billCodeDefinitionService.insertBatch(lists);
            BillRuleCache.initCache();

        }
    }
}
