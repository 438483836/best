package com.stylefeng.guns.netty.SupplyPlatUtil;

import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelFutureListener;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.LengthFieldBasedFrameDecoder;

import java.nio.ByteBuffer;

/**
 * Created by Belo Lee on 2016/10/3.
 */
public class SupplyPlatDecoder extends LengthFieldBasedFrameDecoder {

    private static final int FRAME_MAX_LENGTH = 8388608;

    public SupplyPlatDecoder(){
        super(FRAME_MAX_LENGTH, 0, 2, 0, 0);
    }

    @Override
    public Object decode(ChannelHandlerContext ctx, ByteBuf in) throws Exception {
        ByteBuf frame = null;
        try {
            frame = (ByteBuf) super.decode(ctx, in);
            if (null == frame) {
                return null;
            }

            ByteBuffer byteBuffer = frame.nioBuffer();

//            return DownSealMailCommand.decode(byteBuffer);
        }
        catch (Exception e) {
            // 这里关闭后， 会在pipeline中产生事件，通过具体的close事件来清理数据结构
            ctx.channel().close().addListener(new ChannelFutureListener() {
                @Override
                public void operationComplete(ChannelFuture future) throws Exception {
                    System.out.println("Close!");
                }
            });
        }
        finally {
            if (null != frame) {
                frame.release();
            }
        }

        return null;
    }
}
