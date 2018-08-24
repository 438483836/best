package com.stylefeng.guns.netty.lchuteUtil;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import org.springframework.context.ApplicationContext;

/**
 * Created by Belo Lee on 2016/10/3.
 */
public class LchuteInHandler extends ChannelInboundHandlerAdapter {

    private ApplicationContext applicationContext;

    public LchuteInHandler(ApplicationContext applicationContext){
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
    public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
        LchuteCommand downSealMailCommand = (LchuteCommand) msg;

        System.out.println(downSealMailCommand);

        // 处理打包事宜

        ctx.writeAndFlush("hahaha1234");
    }

    @Override
    public void channelReadComplete(ChannelHandlerContext ctx) throws Exception {
        System.out.println("==============channel-read-complete==============");
        ctx.flush();
    }

}
