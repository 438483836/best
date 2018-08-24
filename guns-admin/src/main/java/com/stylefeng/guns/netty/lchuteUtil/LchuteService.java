package com.stylefeng.guns.netty.lchuteUtil;

import com.stylefeng.guns.cache.PlcConfigCache;
import com.stylefeng.guns.core.util.ToolUtil;
import com.stylefeng.guns.modular.system.model.PlcConfig;
import com.stylefeng.guns.netty.Server2PlcConst;
import com.stylefeng.guns.netty.requestEntity.PLCRequsetEntity;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.concurrent.LinkedBlockingQueue;

/**
 * 逻辑格口信息发送至PLC
 * Created by Belo Lee on 2016/10/2.
 */

@Service
public class LchuteService implements ApplicationContextAware {

    private static final Logger logger = LoggerFactory.getLogger(LchuteService.class);

    private ApplicationContext applicationContext;

    private static LchuteClient lchuteClient;

    public static final LinkedBlockingQueue<PLCRequsetEntity> bumaRequestQueue = new LinkedBlockingQueue<>();


    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
        this.startService();
    }

    private void startService() {

        lchuteClient = new LchuteClient(this.applicationContext);
        try {
            lchuteClient.start();
        } catch (Exception e) {
            e.printStackTrace();
        }

        Thread thread = new Thread(() -> {
            try{
                while(true) {
                    PLCRequsetEntity plcRequsetEntity =bumaRequestQueue.take();
                    if(plcRequsetEntity != null) {
                        sendBuMaDataToPlc(plcRequsetEntity);
                        Thread.sleep(20);
                    }

                }
            }catch (Exception e){
                logger.error("send buma data  error:",e.getMessage());
            }
        });

        thread.start();
    }

    public static void sendBuMaDataToPlc(PLCRequsetEntity plcRequsetEntity) throws InterruptedException {
        PlcConfig plcConfig = PlcConfigCache.getBuMaPlcConfig();
        if (ToolUtil.isEmpty(plcConfig)){
            logger.error("BUMA INFO OF T_PLC_CONFIG IS NULL");
        }
        try {
            StringBuffer data = new StringBuffer();
            data.append("WRS DM14030.H ");

            int length = 12;

            String chute = plcRequsetEntity.getChute();

            String chutes[];
            if(StringUtils.isBlank(plcRequsetEntity.getChute()) || plcRequsetEntity.getChute().equals("null")){
                chutes = null;
            }else {
                chutes = chute.split("\\|");
            }

            if(chutes != null){
                length += chutes.length;
            }

            data.append(length);

            String barcode = Server2PlcConst.fillBlank(plcRequsetEntity.getBillCode());

            //data.append(Server2PlcConst.getAllDataForyunda(gjtNo, chute, barcode, tmesDetail.getLchute(), tmesDetail.getBussinessType()));

            data.append(Server2PlcConst.getAllDataForBuMa(chutes, barcode));

            data.append("\r");

            lchuteClient.sendSyncImpl(plcConfig.getIp(), plcConfig.getPort(), data.toString() );

            logger.info("SupplyPlatService sendData2MesPlc success,sortingId:[{}],barcode[{}],trayCode:[{}], " +
                            "chute:[{}]",
                    plcRequsetEntity.getSortingId(), plcRequsetEntity.getBillCode(), plcRequsetEntity.getTrayCode(),
                    plcRequsetEntity.getChute());

        }catch (Exception e){
            //处理未成功,重新放入队列处理,为保证安全,先不放入队列处理
            logger.error("SupplyPlatService sendData2MesPlc success,sortingId:[{}],barcode[{}],trayCode:[{}], " +
                            "chute:[{},Exception[{}]]",
                    plcRequsetEntity.getSortingId(), plcRequsetEntity.getBillCode(), plcRequsetEntity.getTrayCode(),
                    plcRequsetEntity.getChute(),e.getMessage());
        }
    }
}
