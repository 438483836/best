package com.stylefeng.guns.netty.downSealMailUtil;

import com.stylefeng.guns.cache.ParamConigCache;
import com.stylefeng.guns.cache.PortSyncCache;
import com.stylefeng.guns.core.util.JsonUtil;
import com.stylefeng.guns.core.util.ToolUtil;
import com.stylefeng.guns.modular.business.service.IYddSealmailService;
import com.stylefeng.guns.modular.system.model.PortSync;
import com.stylefeng.guns.modular.system.model.ScanDetail;
import com.stylefeng.guns.modular.system.model.YddSealmail;
import com.stylefeng.guns.netty.HttpPutResultUtil.HttpPutResultInfoService;
import com.stylefeng.guns.netty.requestEntity.SortResultRequestEntity;
import com.stylefeng.guns.netty.task.DelelteOverTimeDataTask;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;

import java.util.Date;
import java.util.UUID;

/**
 * Created by Belo Lee on 2016/10/3.
 */
public class DownSealMailInHandler extends ChannelInboundHandlerAdapter {

    private static final Logger logger = LoggerFactory.getLogger(DownSealMailInHandler.class);

    private static ApplicationContext applicationContext;

    public DownSealMailInHandler(ApplicationContext applicationContext){
        DownSealMailInHandler.applicationContext = applicationContext;
    }

    @Override
    public boolean isSharable() {
        System.out.println("==============DownSealMailInHandler handler-sharable==============");
        return super.isSharable();
    }

    @Override
    public void channelRegistered(ChannelHandlerContext ctx) throws Exception {
        System.out.println("==============DownSealMailInHandler channel-register==============");
    }

    @Override
    public void channelUnregistered(ChannelHandlerContext ctx) throws Exception {
        System.out.println("==============DownSealMailInHandler channel-unregister==============");
    }

    @Override
    public void channelActive(ChannelHandlerContext ctx) throws Exception {
        System.out.println("==============DownSealMailInHandler channel-active==============");

    }

    @Override
    public void channelInactive(ChannelHandlerContext ctx) throws Exception {
        System.out.println("==============DownSealMailInHandler channel-inactive==============");
    }

    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
        logger.error(cause.getMessage());
        ctx.close();
    }

    @Override
    public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
        System.out.println("==============DownSealMailInHandler channelRead==============");

        DownSealMailCommand downSealMailCommand = (DownSealMailCommand) msg;

        try {

            int supplyNo=(int)downSealMailCommand.getSupplyNo();

            String sortId = "";
            String barcode = "";
            String chute = "";
            String sendflag = "";

            if(downSealMailCommand!=null)
            {
                barcode = downSealMailCommand.getBarcodeS().trim();
                chute = String.valueOf(downSealMailCommand.getChute());

                if (StringUtils.isBlank(chute)) {
                    logger.info("chute is Empty!");
                    return;
                }
                if (ToolUtil.equals("0",chute)) {
                    System.out.println("received downSealMailCommand is HeartBeat ");
                    return;
                }
            }
            logger.info("Receive DownSealMailInHandler Data:{}", downSealMailCommand);

            for (int i=chute.length();i<3;i++){
                chute = "0"+chute;
            }

            //小车编号
            int trayCode = downSealMailCommand.getXcbh();
            if(ToolUtil.isEmpty(barcode)||!DelelteOverTimeDataTask.cacheBarcode.containsKey(barcode)){
                logger.info("cacheBarcode of CameraGetInfoInHandler not mach by barcode[{}]",barcode);
                sortId = sortId();
            }else {
                ScanDetail scanDetail = DelelteOverTimeDataTask.cacheBarcode.remove(barcode);
                logger.info("CameraInfoInHandler.cacheBarcode is [{}]",scanDetail.toString());
                sortId = scanDetail.getSortId();
                sendflag = scanDetail.getLchute();
            }


            //新增下件记录
            IYddSealmailService yddSealmailService = applicationContext.getBean(IYddSealmailService.class);
            YddSealmail yddSealmail = new YddSealmail();
            yddSealmail.setBagid(sortId);
            yddSealmail.setBarcode(barcode);
            //循环圈数
            yddSealmail.setLchute(String.valueOf(downSealMailCommand.getLchute()));
            //物理格口代码
            yddSealmail.setChute(chute);
            //落格时间
            yddSealmail.setSorttime(new Date());
            //供件台号
            yddSealmail.setInductionid(supplyNo);
            yddSealmail.setWeight(0f);
            yddSealmail.setVolume(0f);
            yddSealmail.setLength(0f);
            yddSealmail.setWidth(0f);
            yddSealmail.setHeight(0f);
            //落格标志
            yddSealmail.setDropflag(Byte.toString(downSealMailCommand.getLgbz()));
            //留盘检测确认标志
            yddSealmail.setCheckflag(Byte.toString(downSealMailCommand.getLpbz()));
            //分拣成功与否标志
            yddSealmail.setSuccesydlag(Byte.toString(downSealMailCommand.getFjcgbz()));
            //异常原因代码
            yddSealmail.setOverflowid(Byte.toString(downSealMailCommand.getFjycyy()));
            //设备编码
            yddSealmail.setDevicecode(Byte.toString(downSealMailCommand.getFjsjlybm()));
            //打印标志
            yddSealmail.setPrintflag("0");
            //请封时间
            yddSealmail.setPrinttime(new Date());
            //供件时间
            yddSealmail.setIndtime(new Date());
            //供件模式
            yddSealmail.setIndmode(Byte.toString(downSealMailCommand.getGjms()));
            yddSealmail.setTrayid(trayCode);
            //删除标志
            yddSealmail.setDelflag("0");
            //ADM处理标志
            yddSealmail.setOcrflag(0);
            //OBR拒识标志
            yddSealmail.setRejectflag(Byte.toString(downSealMailCommand.getObrjsbz()));
            //发送标志
            yddSealmail.setSendflag(sendflag);
            //数据上传时间
            yddSealmail.setSendtime(new Date());

            yddSealmailService.insert(yddSealmail);

            if (ToolUtil.isEmpty(barcode)){
                logger.info("No barcode was scanned by downSealMail");
                return;
            }
            String devicecode = yddSealmail.getDevicecode();
            String sortSource = "";
            if (ToolUtil.equals("1",devicecode)){
                sortSource = "暴力分拣";
            }
            if (ToolUtil.equals("3",devicecode)){
                sortSource = "人工补码";
            }

            String sortPortCode = ParamConigCache.getPipeline()+chute;
            String pipeline = ParamConigCache.getPipeline();
            String sortMode = PortSyncCache.getSortMode();

            PortSync portSync = new PortSync();
            portSync.setSortPortCode(sortPortCode);
            portSync.setPipeline(pipeline);
            portSync.setSortMode(sortMode);
            String sortCode = PortSyncCache.matchPortSync(portSync);

            SortResultRequestEntity sortResultRequestEntity = new SortResultRequestEntity();
            sortResultRequestEntity.setSortingId(sortId);
            sortResultRequestEntity.setTrayCode(String.valueOf(trayCode));
            sortResultRequestEntity.setBillCode(barcode);
            sortResultRequestEntity.setPipeline(ParamConigCache.getPipeline());
            sortResultRequestEntity.setSortTime(String.valueOf(System.currentTimeMillis()));
            sortResultRequestEntity.setTurnNumber(downSealMailCommand.getLchute());
            sortResultRequestEntity.setSortPortCode(sortPortCode);
            sortResultRequestEntity.setSortSource(sortSource);
            sortResultRequestEntity.setSortMode(sortMode);
            sortResultRequestEntity.setSortCode(sortCode);

            String bestRequest = JsonUtil.toJsonByObj(sortResultRequestEntity);

            HttpPutResultInfoService.bestExpressResultQueue.put(bestRequest);



        }catch (Exception e){
            logger.error("DownSealMailInHandler Error : {}", e.getMessage());
        }

       // ctx.writeAndFlush("hahaha1234");
    }
    public static String sortId() {
        int machineId = 1;//最大支持1-9个集群机器部署
        int hashCodeV = UUID.randomUUID().toString().hashCode();
        if(hashCodeV < 0) {//有可能是负数
            hashCodeV = - hashCodeV;
        }
        // 0 代表前面补充0
        // 4 代表长度为4
        // d 代表参数为正数型
        return machineId + String.format("%015d", hashCodeV);
    }

    @Override
    public void channelReadComplete(ChannelHandlerContext ctx) throws Exception {
        System.out.println("==============DownSealMailInHandler channel-read-complete==============");
        ctx.flush();
    }

}
