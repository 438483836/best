package com.stylefeng.guns.netty.task;

import com.stylefeng.guns.modular.system.model.ScanDetail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/**
 * Created by yangmin on 2016/10/6.
 */
@Service
public class DelelteOverTimeDataTask implements ApplicationContextAware {

    private static final Logger logger = LoggerFactory.getLogger(DelelteOverTimeDataTask.class);

    private static ApplicationContext applicationContextp;

    public static Map<String,ScanDetail> cacheBarcode=new ConcurrentHashMap<>();

    private ScheduledExecutorService scheduledExecutorService = Executors.newSingleThreadScheduledExecutor(r -> new Thread(r, "getDelelteOverTimeDataTaskScheduledExecutorService"));

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        applicationContextp = applicationContext;
        StartService();
    }

    private void StartService() {
        logger.info("DelelteOverTimeDataTask start");
        cacheBarcode.clear();
        this.scheduledExecutorService.scheduleAtFixedRate(() -> {
            try {
                logger.info("DelelteOverTimeDataTask begin");
                int count = 0;
                Iterator<Map.Entry<String, ScanDetail>> it = cacheBarcode.entrySet().iterator();
                while(it.hasNext()){
                    Map.Entry<String, ScanDetail> entry = it.next();
                    ScanDetail barCodeSingle=entry.getValue();
                    Date getScanDatetime=barCodeSingle.getScanDatetime();
                    Calendar singleOneDate = Calendar.getInstance();
                    singleOneDate.setTime(getScanDatetime);
                    singleOneDate.add(Calendar.MINUTE, 30);
                    Date dataBaseDate=singleOneDate.getTime();

                    if(dataBaseDate.compareTo(new Date())<0)
                    {
                        it.remove();
                        count++;
                    }
                }
                logger.info("remove time-out data of CameraInfoInHandler.cacheBarcode sucess, count[{}]",count);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }, 10, 1000 * 90, TimeUnit.MILLISECONDS);
    }

}
