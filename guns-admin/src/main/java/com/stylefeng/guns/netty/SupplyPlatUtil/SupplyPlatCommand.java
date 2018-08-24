package com.stylefeng.guns.netty.SupplyPlatUtil;

import java.nio.ByteBuffer;

/**
 * Created by Belo Lee on 2016/10/3.
 */
public class SupplyPlatCommand {

    private short length = 32;

    private short supplyNo;

    private int lchute;

    private byte ycbz;

    private byte ljgksjly;

    private byte scanno;

    private String barcodeS = "          " + "          " +"  ";

    private byte end = '\r';

    @Override
    public String toString() {
        return "Length:" + this.getLength() +
                ",supplyNo:" + this.getSupplyNo() +
                ",lchute:" + this.getLchute() +
                ",ycbz:" + this.getYcbz() +
                ",ljgksjly:" + this.getLjgksjly() +
                ",scanno:" + this.getScanno() +
                ",barcodeS:" + this.getBarcodeS()+
                ",End:" + this.getEnd();
    }

    public static Object decode(ByteBuffer byteBuffer) {
        return null;
    }

    public short getLength() {
        return length;
    }

    public void setLength(short length) {
        this.length = length;
    }

    public short getSupplyNo() {
        return supplyNo;
    }

    public void setSupplyNo(short supplyNo) {
        this.supplyNo = supplyNo;
    }

    public int getLchute() {
        return lchute;
    }

    public void setLchute(int lchute) {
        this.lchute = lchute;
    }

    public byte getYcbz() {
        return ycbz;
    }

    public void setYcbz(byte ycbz) {
        this.ycbz = ycbz;
    }

    public byte getLjgksjly() {
        return ljgksjly;
    }

    public void setLjgksjly(byte ljgksjly) {
        this.ljgksjly = ljgksjly;
    }

    public byte getScanno() {
        return scanno;
    }

    public void setScanno(byte scanno) {
        this.scanno = scanno;
    }

    public String getBarcodeS() {
        return barcodeS;
    }

    public void setBarcodeS(String barcodeS) {
        this.barcodeS = barcodeS;
    }

    public byte getEnd() {
        return end;
    }

    public void setEnd(byte end) {
        this.end = end;
    }

    public ByteBuffer encode() {
        ByteBuffer result = ByteBuffer.allocate(34);

        result.putShort(this.getLength());
        result.putShort(this.getSupplyNo());
        result.putInt(this.getLchute());
        result.put(this.getYcbz());

        result.put(this.getLjgksjly());
        result.put(this.getScanno());
        result.put(this.getBarcodeS().getBytes());
        result.put(this.getEnd());

        result.flip();

        return result;
    }
}
