/*
 * Copyright 2012 The Netty Project
 *
 * The Netty Project licenses this file to you under the Apache License,
 * version 2.0 (the "License"); you may not use this file except in compliance
 * with the License. You may obtain a copy of the License at:
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations
 * under the License.
 */
package com.stylefeng.guns.netty.HttpFenJianUtil;
import com.alibaba.fastjson.JSON;
import com.stylefeng.guns.core.util.ToolUtil;
import com.stylefeng.guns.modular.business.service.IScanDetailService;
import com.stylefeng.guns.modular.system.model.ScanDetail;
import com.stylefeng.guns.netty.SupplyPlatUtil.SupplyPlatService;
import com.stylefeng.guns.netty.requestEntity.PLCRequsetEntity;
import com.stylefeng.guns.netty.requestEntity.SortInfoRequestEntity;
import com.stylefeng.guns.netty.task.DelelteOverTimeDataTask;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.handler.codec.http.HttpContent;
import io.netty.handler.codec.http.HttpObject;
import io.netty.handler.codec.http.HttpResponse;
import io.netty.handler.codec.http.LastHttpContent;
import io.netty.handler.timeout.IdleState;
import io.netty.handler.timeout.IdleStateEvent;
import io.netty.util.Attribute;
import io.netty.util.CharsetUtil;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class  HttpFenJianRequestClientHandler extends SimpleChannelInboundHandler<HttpObject> implements ApplicationContextAware {
    private static final Logger logger = LoggerFactory.getLogger(HttpFenJianRequestClientHandler.class);
    private static ApplicationContext applicationContext;

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        HttpFenJianRequestClientHandler.applicationContext = applicationContext;
    }

    @Override
    public void userEventTriggered(ChannelHandlerContext ctx, Object evt) throws Exception {
        if (evt instanceof IdleStateEvent){
            Attribute<SortInfoRequestEntity> attr = ctx.channel().attr(HttpFenJianRequestClient.NETTY_CHANNEL_KEY);
            SortInfoRequestEntity sortInfoRequestEntity=attr.get();
            IdleStateEvent event = (IdleStateEvent) evt;
            if(event.state()== IdleState.READER_IDLE){

                logger.info("already 1 second no recevie Best message...");
                logger.info("RECEVIE BestExpress DATA TIMEOUT,SNEND EXC_DATA TO barcode:{}", sortInfoRequestEntity.getBillCodes().get(0));
                logger.info("close no activity channel");

                ctx.channel().close();
            }
        }else {
            super.userEventTriggered(ctx,evt);
        }
    }



    @Override
    public void channelRead0(ChannelHandlerContext ctx, HttpObject msg) {
        if (msg instanceof HttpResponse) {
            HttpResponse response = (HttpResponse) msg;
            logger.info("STATUS: " + response.getStatus());
        }
        if (msg instanceof HttpContent) {
            HttpContent content = (HttpContent) msg;
            String returnJson=content.content().toString(CharsetUtil.UTF_8);
            if(StringUtils.isEmpty(returnJson))
            {
                if (content instanceof LastHttpContent) {
                    ctx.close();
                }
                return;
            }
            Attribute<SortInfoRequestEntity> attr = ctx.channel().attr(HttpFenJianRequestClient.NETTY_CHANNEL_KEY);
            SortInfoRequestEntity sortInfoRequestEntity=attr.get();
            logger.info("Recevied BestExpress Response:" + returnJson);
            Map<String,Object> getBestDataMap= JSON.parseObject(returnJson, Map.class);

            int status = (int)getBestDataMap.get("status");

            String barcode = sortInfoRequestEntity.getBillCodes().get(0);
            //逻辑格口
            String chute = "";

            if(status==1){
                Map<String,Object> resultMap=(Map)getBestDataMap.get("result");
                String sortingId = (String)resultMap.get("sortingId");
                String trayCode = (String)resultMap.get("trayCode");
                trayCode = trayCode.substring(1);
                for (int i=0;i<3;i++){
                    if(trayCode.indexOf("0")==0)
                    {
                        trayCode=trayCode.substring(1);
                    }
                    else {
                        break;
                    }
                }
                List<String> sortPortCode = (List<String>)resultMap.get("sortPortCode");
                for (String code:sortPortCode){
                    code= code.substring(10);
                    while(code.indexOf("0")==0)
                    {
                        code=code.substring(1);
                    }

                    if(StringUtils.isEmpty(chute))
                    {
                        chute=code;
                    }
                    else {
                        chute=chute+"|"+code;
                    }
                }
                PLCRequsetEntity plcRequsetEntity = new PLCRequsetEntity(sortingId,sortInfoRequestEntity.getBillCodes().get(0),trayCode,"300400",chute,sortInfoRequestEntity.getType());
                try {
                    SupplyPlatService.plcRequestQueue.put(plcRequsetEntity);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                if (!DelelteOverTimeDataTask.cacheBarcode.containsKey(barcode)){
                    logger.error("CameraInfoInHandler.cacheBarcode is empty of barcode[{}] ",barcode);
                    return;
                }
                //更新扫描详情缓存
                ScanDetail scanDetail = DelelteOverTimeDataTask.cacheBarcode.remove(barcode);
                if(ToolUtil.isEmpty(chute)){
                    scanDetail.setConnDetailId("人工补码");
                }else {
                    scanDetail.setConnDetailId("暴力分拣");
                }
                scanDetail.setLchute(chute);
                scanDetail.setSendDatetime(new Date());
                DelelteOverTimeDataTask.cacheBarcode.put(barcode,scanDetail);

                IScanDetailService scanDetailService= applicationContext.getBean(IScanDetailService.class);
                scanDetailService.insert(scanDetail);

            }

            if (content instanceof LastHttpContent) {
                ctx.close();
            }
        }
    }
    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) {
        cause.printStackTrace();
        ctx.close();
    }

    public static void main(String[] args) {
        String str = "{\"sortingId\":\"SdsSim-20160111153404317\",\"trayCode\":2,\"trayStatus\":\"recognized\",\"billCodes\":[\"280026621835\"],\"pipeline\":\"200000-001\",\"turnNumber\":2,\"requestTime\":1452488461, \"sortMode\":\"sorting\"}";
        Map<String,Object> map= JSON.parseObject(str, Map.class);
        List billCodes = (List) map.get("billCodes");
        String trayCode="1001";
        trayCode=trayCode.substring(1);
        for (int i=0;i<3;i++){
            if(trayCode.indexOf("0")==0)
            {
                trayCode=trayCode.substring(1);
            }
            else {
                break;
            }
        }
        System.out.println(trayCode);
    }
}