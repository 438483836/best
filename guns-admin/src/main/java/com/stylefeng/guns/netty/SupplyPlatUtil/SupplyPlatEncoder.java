package com.stylefeng.guns.netty.SupplyPlatUtil;

import com.alibaba.rocketmq.remoting.common.RemotingUtil;
import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.MessageToByteEncoder;

/**
 * Created by Belo Lee on 2016/10/6.
 */
public class SupplyPlatEncoder extends MessageToByteEncoder<String> {
    @Override
    protected void encode(ChannelHandlerContext ctx, String msg, ByteBuf out) throws Exception {
        try {
            out.writeBytes(msg.getBytes());
        }
        catch (Exception e) {
            //log.error("encode exception, " + RemotingHelper.parseChannelRemoteAddr(ctx.channel()), e);
            // 这里关闭后， 会在pipeline中产生事件，通过具体的close事件来清理数据结构
            RemotingUtil.closeChannel(ctx.channel());
        }
    }
}
