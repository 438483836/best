package com.stylefeng.guns.netty.RequestMappingUtil;

import java.nio.ByteBuffer;

/**
 * Created by Belo Lee on 2016/10/3.
 */
public class RequestMappingCommand {

    private byte length;

    //1开机2关机
    private byte command;

    private byte end;


    public byte getLength() {
        return length;
    }

    public void setLength(byte length) {
        this.length = length;
    }

    public byte getCommand() {
        return command;
    }

    public void setCommand(byte command) {
        this.command = command;
    }

    public byte getEnd() {
        return end;
    }

    public void setEnd(byte end) {
        this.end = end;
    }

    @Override
    public String toString() {
        return "length:" + this.getLength() + ",command:" + this.getCommand() + ",end:" + this.getEnd();
    }

    public static Object decode(ByteBuffer byteBuffer) {
        RequestMappingCommand requestMappingCommand = new RequestMappingCommand();
        int length = byteBuffer.limit();

        requestMappingCommand.setLength(byteBuffer.get(0));
        requestMappingCommand.setCommand(byteBuffer.get(1));
        requestMappingCommand.setEnd(byteBuffer.get(2));

        return requestMappingCommand;
    }
}
