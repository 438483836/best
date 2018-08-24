package com.stylefeng.guns.netty.cameraInfoUtil;

import com.stylefeng.guns.cache.BillRuleCache;
import com.stylefeng.guns.cache.ParamConigCache;
import com.stylefeng.guns.cache.PortSyncCache;
import com.stylefeng.guns.core.util.DateUtil;
import com.stylefeng.guns.core.util.ToolUtil;
import com.stylefeng.guns.modular.system.model.ScanDetail;
import com.stylefeng.guns.netty.HttpFenJianUtil.HttpFenJianRequestInfoService;
import com.stylefeng.guns.netty.SupplyPlatUtil.SupplyPlatService;
import com.stylefeng.guns.netty.requestEntity.PLCRequsetEntity;
import com.stylefeng.guns.netty.requestEntity.SortInfoRequestEntity;
import com.stylefeng.guns.netty.task.DelelteOverTimeDataTask;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;

import java.net.InetSocketAddress;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

@Service
public class CameraInfoInHandler extends ChannelInboundHandlerAdapter implements ApplicationContextAware{

    private static final Logger logger = LoggerFactory.getLogger(CameraInfoServer.class);


    private static ApplicationContext applicationContext;

    public static AtomicInteger ai=new AtomicInteger(-1);

    @Override
    public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
        String geSickData = (String) msg;
        if(ToolUtil.isEmpty(geSickData))
        {
            System.out.println("get geSickData data is null");
            return ;
        }
        InetSocketAddress socketAddress=(InetSocketAddress)ctx.channel().remoteAddress();
        String remoteIp=socketAddress.getAddress().getHostAddress();


        String[] contents=geSickData.split("\\+");
        if(contents.length!=2)
        {
            System.out.println("Receive SICK data is ："+geSickData+". by"+remoteIp);
            return ;
        }

        //运单编号
        String barcodes[] = getInt(contents[1]);
        Set<String> billCodes = new HashSet<>();

        for (String str:barcodes){
            billCodes.add(str);
        }

        if(ToolUtil.isEmpty(billCodes))
        {
            System.out.println("billCode is empty");
            return;
        }

        //检查一下单号
        billCodes = BillRuleCache.matchBarCode(billCodes);

        List<String> listCodes= new ArrayList<>(billCodes);

        logger.info("Receive geSickData Data:{},remoteIp:{}", geSickData,remoteIp);

        //分拣线编码
        String pipeline = ParamConigCache.getPipeline();
        //线号
        String lineNo = ParamConigCache.getLineNo();

        //分拣唯一ID
        String sortId = newSortId();

        String[] arr = getInt(contents[0]);
        String trayCode="";
        for (int i=0;i<arr.length;i++){
            trayCode +=arr[i];
        }

        if(trayCode.length()>=3)
        {
            trayCode = trayCode.substring(trayCode.length()-3,trayCode.length());

        }
        else {
            for (int i=trayCode.length();i<3;i++){
                trayCode = "0"+trayCode;
            }
        }


        //如果有多个条码。直接下异常口，不做分拣请求（可能一个小车上有多件货,避免错分）
        List<String> excChutelist = ParamConigCache.getExceptionChute();
        String excChutes = "";
        for (String code:excChutelist){
            if(ToolUtil.isEmpty(excChutes)){
                excChutes = code;
            }else {
                excChutes = excChutes+"|"+code;
            }
        }
        if (listCodes.size()>1){
            PLCRequsetEntity plcRequsetEntity = new PLCRequsetEntity(sortId,listCodes.get(0),trayCode,"300400",excChutes,"1");
            SupplyPlatService.plcRequestQueue.put(plcRequsetEntity);
            logger.error("There are multiple barcodes[{}]",listCodes.toString());
            return;
        }


        SortInfoRequestEntity entity = new SortInfoRequestEntity();
        entity.setSortingId(sortId);
        entity.setTrayCode(lineNo.concat(trayCode));
        entity.setTrayStatus("recognized");

        entity.setBillCodes(listCodes);
        entity.setPipeline(pipeline);

        entity.setRequestTime(System.currentTimeMillis());
        entity.setSortMode(PortSyncCache.getSortMode());

        //1为顶扫、2为PDA扫描
        entity.setType("1");

        //保存扫描详情
        String barcode = listCodes.get(0);

        ScanDetail scanDetail = new ScanDetail();
        scanDetail.setSortId(entity.getSortingId());
        scanDetail.setBarcode(barcode);
        scanDetail.setScanDatetime(new Date());
        scanDetail.setTrayCode(trayCode);
        scanDetail.setScanNo(remoteIp);

        int trunNum = 1;
        //如果此单号已有缓存，先移除此缓存，循环圈数在已有基础上+1
        if(DelelteOverTimeDataTask.cacheBarcode.containsKey(barcode))
        {
            ScanDetail mode = DelelteOverTimeDataTask.cacheBarcode.remove(barcode);
            trunNum = Integer.valueOf(mode.getScanName())+1;
        }

        entity.setTurnNumber(trunNum);
        scanDetail.setScanName(String.valueOf(trunNum));//此处为循环圈数
        DelelteOverTimeDataTask.cacheBarcode.put(barcode,scanDetail);
        logger.info("cacheBarcode put key[{},value[{}]]",barcode,scanDetail.toString());

        //发送分拣请求
        HttpFenJianRequestInfoService.bestSortingRequestQueue.put(entity);
    }

    @Override
    public boolean isSharable() {
        System.out.println("==============CameraGetInfoInHandler handler-sharable==============");
        return super.isSharable();
    }

    @Override
    public void channelRegistered(ChannelHandlerContext ctx) throws Exception {
        System.out.println("==============CameraGetInfoInHandler channel-register==============");
    }

    @Override
    public void channelUnregistered(ChannelHandlerContext ctx) throws Exception {
        System.out.println("==============CameraGetInfoInHandler channel-unregister==============");
    }
    //新客户端接入
    @Override
    public void channelActive(ChannelHandlerContext ctx) throws Exception {
        System.out.println("==============CameraGetInfoInHandler channel-Active==============");
    }
    //客户端断开
    @Override
    public void channelInactive(ChannelHandlerContext ctx) throws Exception {
        logger.info("==============CameraGetInfoInHandler channel-inactive==============");
    }

    @Override
    public void channelReadComplete(ChannelHandlerContext ctx) throws Exception {
        System.out.println("==============channel-read-complete==============");
        ctx.flush();
    }

    //异常
    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
        //打印异常
        logger.error(cause.getMessage());
        //关闭通道
        ctx.close();
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        CameraInfoInHandler.applicationContext =applicationContext;
    }

    public static String newSortId() {
        int machineId = 1;//最大支持1-9个集群机器部署

        return machineId + DateUtil.getAllTime()+ incrementAndGet();
    }

    public static int incrementAndGet() {
        int current;
        int next;
        do {
            current = ai.get();
            next = current >= 9?0:current + 1;
        } while(!ai.compareAndSet(current, next));

        return next;
    }

    public static String[] getInt(String str){
        String[] arr = str.split("[^0-9]");
        for(int i=0;i<arr.length;i++){
            logger.info("content ".concat(arr[i]));
        }
        return arr;
    }

    public static void main(String[] args) {
        for (int i=0;i<100;i++){
            System.out.println(newSortId());
        }

    }
}
