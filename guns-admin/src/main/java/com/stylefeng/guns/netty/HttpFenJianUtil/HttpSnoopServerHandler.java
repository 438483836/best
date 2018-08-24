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
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.stylefeng.guns.cache.ParamConigCache;
import com.stylefeng.guns.cache.PortSyncCache;
import com.stylefeng.guns.core.util.JsonUtil;
import com.stylefeng.guns.modular.business.service.IScanDetailService;
import com.stylefeng.guns.modular.system.model.ScanDetail;
import com.stylefeng.guns.netty.lchuteUtil.LchuteService;
import com.stylefeng.guns.netty.requestEntity.PLCRequsetEntity;
import com.stylefeng.guns.netty.task.DelelteOverTimeDataTask;
import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelFutureListener;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.handler.codec.DecoderResult;
import io.netty.handler.codec.http.*;
import io.netty.util.CharsetUtil;
import org.apache.commons.lang.StringUtils;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.*;

import static io.netty.handler.codec.http.HttpHeaders.Names.*;
import static io.netty.handler.codec.http.HttpResponseStatus.*;
import static io.netty.handler.codec.http.HttpVersion.HTTP_1_1;

/**

* @Description:    接收百事补码请求

* @Author:         sipengfei

* @CreateDate:     2018/7/30 9:53

* @UpdateUser:     sipengfei

* @UpdateDate:     2018/7/30 9:53

* @UpdateRemark:   修改内容

* @Version:        1.0

*/
@Service
public class HttpSnoopServerHandler extends SimpleChannelInboundHandler<HttpObject> implements ApplicationContextAware {

    private static final org.slf4j.Logger logger = LoggerFactory.getLogger(HttpSnoopServerHandler.class);

    private static ApplicationContext applicationContext;

    @Autowired
    private LchuteService lchuteService;
    private HttpRequest request;
    /** Buffer that stores the response content */
    private final StringBuilder buf = new StringBuilder();

    private  String requestPath="";
    @Override
    public void channelReadComplete(ChannelHandlerContext ctx) {
        ctx.flush();
    }

    @Override
    protected void channelRead0(ChannelHandlerContext ctx, HttpObject msg) throws URISyntaxException {
        if (msg instanceof HttpRequest) {
            HttpRequest request = (HttpRequest) msg;
            URI uri = new URI(request.getUri());
            requestPath = uri.getPath();
        }

        if (msg instanceof HttpContent) {


            HttpContent httpContent = (HttpContent) msg;

            Map resultMap=new HashMap();
            resultMap.put("status","success");
            resultMap.put("statusCode","200");
            resultMap.put("statusInfo","成功");

            if (StringUtils.equals("/pipeline/v2/sort_mode",requestPath)){//分拣模式请求

                resultMap.put("remark", PortSyncCache.getSortMode());
                logger.info("response sort-mode[{}] data to best", PortSyncCache.getSortMode());
                writeResponse(msg,ctx,resultMap);
            }

            if (StringUtils.equals("/task/v2/complement_info",requestPath)){//补码请求

                String requestJson=httpContent.content().toString(CharsetUtil.UTF_8);
                if(StringUtils.isEmpty(requestJson))
                {
                    logger.info("request Json is empty");
                    return;
                }
                logger.info("Recevied BestBuMaExpress Request:" + requestJson);
                Map<String,Object> requestMap= JSON.parseObject(requestJson, Map.class);
                //分拣 ID
                String sortingId=(String)requestMap.get("sortingId");

                //运单号
                String billCode=(String)requestMap.get("billCode");
                //小车号
                String trayCode=(String)requestMap.get("trayCode");
                //流水线号
                String pipeline=(String)requestMap.get("pipeline");
                //分拣口编号
                List<String> sortPortCode=(List)requestMap.get("sortPortCode");
                //分拣来源
                String sortSource=(String)requestMap.get("sortSource");
                //分拣编码
                String sortCode=(String)requestMap.get("sortCode");

                //逻辑格口
                String chute = "";
                for (String code:sortPortCode){
                    code= code.substring(10);
                    while(code.indexOf("0")==0)
                    {
                        code=code.substring(1);
                    }

                    if(org.apache.commons.lang3.StringUtils.isEmpty(chute))
                    {
                        chute=code;
                    }
                    else {
                        chute=chute+"|"+code;
                    }
                }
                if(!DelelteOverTimeDataTask.cacheBarcode.containsKey(billCode))
                {
                    resultMap.put("remark","补码超时下架");
                    writeResponse(msg,ctx,resultMap);
                    logger.info("barcode of complement-info:[{}] has down,", billCode);
                }else {
                    //更新扫描详情
                    ScanDetail scanDetail = DelelteOverTimeDataTask.cacheBarcode.remove(billCode);
                    scanDetail.setLchute(chute);
                    scanDetail.setSendDatetime(new Date());

                    DelelteOverTimeDataTask.cacheBarcode.put(billCode,scanDetail);

                    IScanDetailService scanDetailService= applicationContext.getBean(IScanDetailService.class);
                    EntityWrapper<ScanDetail> wrapper = new EntityWrapper<>();
                    wrapper.eq("sort_id",sortingId);
                    scanDetailService.update(scanDetail,wrapper);

                    PLCRequsetEntity plcRequsetEntity = new PLCRequsetEntity(sortingId,billCode,trayCode,chute);
                    //3.调用PLC 接口
                    LchuteService.bumaRequestQueue.add(plcRequsetEntity);
                    resultMap.put("remark","补码成功");
                    writeResponse(msg,ctx,resultMap);
                    logger.info("response complement-info[{}] data to best", resultMap.toString());
                }

            }

            //如果不是补码请求或者分拣模式请求，终止
            if(!StringUtils.equals("/task/v2/complement_info",requestPath)&&!StringUtils.equals("/pipeline/v2/sort_mode",requestPath))
            {
                logger.info("request path is not correst:{}",requestPath);
                return;
            }

            if (msg instanceof LastHttpContent) {
                LastHttpContent trailer = (LastHttpContent) msg;
                if (!writeResponse(trailer, ctx, resultMap)) {
                    // If keep-alive is off, close the connection once the content is fully written.
                    ctx.writeAndFlush(Unpooled.EMPTY_BUFFER).addListener(ChannelFutureListener.CLOSE);
                }
            }


        }
    }

    private static void appendDecoderResult(StringBuilder buf, HttpObject o) {
        DecoderResult result = o.getDecoderResult();
        if (result.isSuccess()) {
            return;
        }
        buf.append(".. WITH DECODER FAILURE: ");
        buf.append(result.cause());
        buf.append("\r\n");
    }

    private boolean writeResponse(HttpObject currentObj, ChannelHandlerContext ctx,Map map) {
        // Decide whether to close the connection or not.
//        boolean keepAlive = HttpHeaders.isKeepAlive(request);

        // Build the response object.
        FullHttpResponse response = new DefaultFullHttpResponse(
                HTTP_1_1, currentObj.getDecoderResult().isSuccess()? OK : BAD_REQUEST,
                Unpooled.copiedBuffer(JsonUtil.toJsonByObj(map), CharsetUtil.UTF_8));

        response.headers().set(CONTENT_TYPE, "text/plain; charset=UTF-8");

            // Add 'Content-Length' header only for a keep-alive connection.
            response.headers().set(CONTENT_LENGTH, response.content().readableBytes());
            // Add keep alive header as per:
            // - http://www.w3.org/Protocols/HTTP/1.1/draft-ietf-http-v11-spec-01.html#Connection
            response.headers().set(CONNECTION, HttpHeaders.Values.KEEP_ALIVE);

        // Write the response.
        ctx.write(response);

        return true;
    }


    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) {
        cause.printStackTrace();
        ctx.close();
    }


    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        HttpSnoopServerHandler.applicationContext = applicationContext;
    }
}
