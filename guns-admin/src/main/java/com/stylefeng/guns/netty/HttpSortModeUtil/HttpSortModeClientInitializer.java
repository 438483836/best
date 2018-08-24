package com.stylefeng.guns.netty.HttpSortModeUtil;

import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelPipeline;
import io.netty.channel.socket.SocketChannel;
import io.netty.handler.codec.http.HttpClientCodec;
import io.netty.handler.codec.http.HttpContentDecompressor;
import io.netty.handler.codec.http.HttpObjectAggregator;
import io.netty.handler.ssl.SslContext;

public class HttpSortModeClientInitializer extends ChannelInitializer<SocketChannel> {

    private final SslContext sslCtx;

    public HttpSortModeClientInitializer(SslContext sslCtx) {
        this.sslCtx = sslCtx;
    }

    @Override
    protected void initChannel(SocketChannel socketChannel) throws Exception {

        ChannelPipeline p = socketChannel.pipeline();

        if (sslCtx != null) {
            p.addLast(sslCtx.newHandler(socketChannel.alloc()));
        }

        p.addLast(new HttpClientCodec());

        p.addLast(new HttpContentDecompressor());

        // 如果不想处理HttpContents，请取消以下行
        p.addLast(new HttpObjectAggregator(1048576));

        p.addLast(new HttpSortModeClientHandler());
    }
}
