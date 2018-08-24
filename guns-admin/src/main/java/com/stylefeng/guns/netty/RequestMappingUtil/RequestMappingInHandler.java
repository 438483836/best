package com.stylefeng.guns.netty.RequestMappingUtil;

import com.stylefeng.guns.cache.ParamConigCache;
import com.stylefeng.guns.cache.PortSyncCache;
import com.stylefeng.guns.core.util.JsonUtil;
import com.stylefeng.guns.netty.HttpBillRuleUtil.HttpBillRuleRequestInfoService;
import com.stylefeng.guns.netty.HttpPortInfoSyncUtil.HttpPortInfoSyncRequestInfoService;
import com.stylefeng.guns.netty.HttpRequestStart.HttpStartService;
import com.stylefeng.guns.netty.HttpSortModeUtil.HttpSortModeService;
import com.stylefeng.guns.netty.Supply2ServerConst;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Belo Lee on 2016/10/3.
 */
public class RequestMappingInHandler extends ChannelInboundHandlerAdapter {

    private ApplicationContext applicationContext;



    private static final Logger logger = LoggerFactory.getLogger(RequestMappingInHandler.class);

    public RequestMappingInHandler(ApplicationContext applicationContext){
        this.applicationContext = applicationContext;
    }

    @Override
    public boolean isSharable() {
        System.out.println("==============handler-sharable==============");
        return super.isSharable();
    }

    @Override
    public void channelRegistered(ChannelHandlerContext ctx) throws Exception {
        System.out.println("==============channel-register==============");
    }

    @Override
    public void channelUnregistered(ChannelHandlerContext ctx) throws Exception {
        System.out.println("==============channel-unregister==============");
    }

    @Override
    public void channelActive(ChannelHandlerContext ctx) throws Exception {
        System.out.println("==============channel-active==============");

    }

    @Override
    public void channelInactive(ChannelHandlerContext ctx) throws Exception {
        System.out.println("==============channel-inactive==============");
    }

    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
        logger.error(cause.getMessage());
        ctx.close();
    }

    @Override
    public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
        RequestMappingCommand requestMappingCommand = (RequestMappingCommand) msg;
        logger.info("Receive requestMappingInHandler Data:{}", requestMappingCommand);
        String sortMode= PortSyncCache.getSortMode();
        //"1":开机。"2":关机
        if(requestMappingCommand.getCommand() == 1){
            // 表示开机状态
            Map<String,Object> requestMap=new HashMap<>();
            requestMap.put("pipeline", ParamConigCache.getPipeline());
            requestMap.put("switchTime",String.valueOf(System.currentTimeMillis()));
            requestMap.put("sortMode",sortMode);
            requestMap.put("status","start");


            HttpStartService.bestRequestQueue.put(JsonUtil.toJsonByObj(requestMap));
            HttpBillRuleRequestInfoService.bestExpressRequestQueue.put(Supply2ServerConst.bestExpressBillRuleURL);
            HttpPortInfoSyncRequestInfoService.bestExpressRequestQueue.put(ParamConigCache.getPipeline());


        } else if(requestMappingCommand.getCommand() == 2){
            //表示关机状态
            Map<String,Object> requestMap=new HashMap<>();
            requestMap.put("pipeline",ParamConigCache.getPipeline());
            requestMap.put("switchTime",String.valueOf(System.currentTimeMillis()));
            requestMap.put("sortMode",sortMode);
            requestMap.put("status","stop");

            HttpStartService.bestRequestQueue.put(JsonUtil.toJsonByObj(requestMap));

        } else {
            logger.info("Nothing");
        }


        //ctx.writeAndFlush(2000);
    }

    @Override
    public void channelReadComplete(ChannelHandlerContext ctx) throws Exception {
        System.out.println("==============channel-read-complete==============");
        ctx.flush();
    }

}
