package com.stylefeng.guns.netty.HttpSortModeUtil;

import com.alibaba.fastjson.JSON;
import com.stylefeng.guns.netty.cameraInfoUtil.CameraInfoInHandler;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.handler.codec.http.HttpContent;
import io.netty.handler.codec.http.HttpObject;
import io.netty.handler.codec.http.HttpResponse;
import io.netty.handler.codec.http.LastHttpContent;
import io.netty.util.CharsetUtil;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Map;

public class HttpSortModeClientHandler extends SimpleChannelInboundHandler<HttpObject> {

    private static final Logger logger = LoggerFactory.getLogger(HttpSortModeClientHandler.class);



    @Override
    public void channelRead0(ChannelHandlerContext ctx, HttpObject msg) throws Exception {
        if (msg instanceof HttpResponse) {
            HttpContent content = (HttpContent) msg;
            String returnJson=content.content().toString(CharsetUtil.UTF_8);
            if(StringUtils.isEmpty(returnJson))
            {
                return ;
            }
            logger.info("Received Sort-Mode Response of BestExpress. msg:[{}]",returnJson);
            Map<String,String> getBestExpressDataMap= JSON.parseObject(returnJson, Map.class);

            if(StringUtils.equals("success",getBestExpressDataMap.get("status")))
            {
                String remark=getBestExpressDataMap.get("remark");
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
}
