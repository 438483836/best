package com.stylefeng.guns.netty.SupplyPlatUtil;

import com.stylefeng.guns.cache.PlcConfigCache;
import com.stylefeng.guns.netty.Server2PlcConst;
import com.stylefeng.guns.netty.requestEntity.PLCRequsetEntity;
import org.apache.commons.lang.StringUtils;
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
public class SupplyPlatService implements ApplicationContextAware {

    private static final Logger logger = LoggerFactory.getLogger(SupplyPlatService.class);


    private ApplicationContext applicationContext;

    private static SupplyPlatClient supplyPlatClient;

    public static final LinkedBlockingQueue<PLCRequsetEntity> plcRequestQueue = new LinkedBlockingQueue<PLCRequsetEntity>();


    public static void sendData2Plc(String ip, int port, PLCRequsetEntity plcRequsetEntity) throws InterruptedException {
        try {
            StringBuffer data = new StringBuffer();
            data.append("WRS DM14000.H ");

            int length = 13;

            if(plcRequsetEntity.getLchute() != null){
                length += 3;
            }


            String chute[] = null;
            if(StringUtils.isBlank(plcRequsetEntity.getChute()) || plcRequsetEntity.getChute().equals("null")){
                chute = null;
            }else {
                chute = plcRequsetEntity.getChute().split("\\|");
            }

            if(chute != null){
                length += chute.length;
            }

            data.append(length);

            String billCode = Server2PlcConst.fillBlank(plcRequsetEntity.getBillCode());

            data.append(Server2PlcConst.getAllDataForSort(plcRequsetEntity.getTrayCode(), chute, billCode, plcRequsetEntity.getLchute(), plcRequsetEntity.getBussinessType()));

            data.append("\r");

            supplyPlatClient.sendSyncImpl(ip, port, data.toString());

            logger.info("SupplyPlatService sendData2MesPlc success,sortingId:[{}],barcode[{}],trayCode:[{}], " +
                            "chute:[{}], lchute:[{}], businessType:[{}]",
                    plcRequsetEntity.getSortingId(), plcRequsetEntity.getBillCode(), plcRequsetEntity.getTrayCode(),
                    plcRequsetEntity.getChute(),plcRequsetEntity.getLchute(),plcRequsetEntity.getBussinessType());

        }catch (Exception e){
            //处理未成功,重新放入队列处理,为保证安全,先不放入队列处理
            //yundaRequestQueue.put(tmesDetail);
            logger.error("SupplyPlatService sendData2MesPlc failed,sortingId:[{}],barcode[{}],trayCode:[{}], " +
                            "chute:[{}], lchute:[{}], businessType:[{}]",
                    plcRequsetEntity.getSortingId(), plcRequsetEntity.getBillCode(), plcRequsetEntity.getTrayCode(),
                    plcRequsetEntity.getChute(),plcRequsetEntity.getLchute(),plcRequsetEntity.getBussinessType());
        }
    }


    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
        this.startService();
    }

    private void startService() {
        this.supplyPlatClient = new SupplyPlatClient(this.applicationContext);

        try {
            this.supplyPlatClient.start();

            Thread thread = new Thread(() -> {
                try{
                    while(true) {
                        PLCRequsetEntity plcRequsetEntity = plcRequestQueue.take();
                        if(plcRequsetEntity != null) {
                                    try {
                                        Thread.sleep(20);
                                        sendData2Plc(PlcConfigCache.getSortPlcConfig().getIp(), PlcConfigCache.getSortPlcConfig().getPort(), plcRequsetEntity);
                                    } catch (InterruptedException e) {
                                        logger.error("send sorting data to plc error2:", e);
                                    }
                        }
                    }
                }catch (Exception e){
                    logger.error("send sorting data to plc error:",e);
                }
            });

            thread.start();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
