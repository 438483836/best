package com.stylefeng.guns.netty.downSealMailUtil;

import java.nio.ByteBuffer;

/**
 * Created by Belo Lee on 2016/10/3.
 */
public class DownSealMailCommand {

    private short length;

    private int lchute;

    private short chute;

    private byte supplyNo;

    private byte lgbz;

    private byte lpbz;

    private byte fjcgbz;

    private byte fjycyy;

    private byte fjsjlybm;

    private byte gjms;

    private byte obrsmybm;

    private short xcbh;

    private byte obrjsbz;

    private byte[] barcode;

    private String barcodeS;

    private short busType;

    private int lchute2;

    private byte end;

    @Override
    public String toString() {
        return "Length:" + this.getLength() +
                ",Lchute:" + this.getLchute() +
                ",Chute:" + this.getChute() +
                ",SupplyNo:" + this.getSupplyNo() +
                ",Lgbz:" + this.getLgbz() +
                ",Lpbz:" + this.getLpbz() +
                ",Fjcgbz:" + this.getFjcgbz() +
                ",Fjycyy:" + this.getFjycyy() +
                ",Fjsjlybm:" + this.getFjsjlybm() +
                ",Gjms:" + this.getGjms() +
                ",Obrsmybm:" + this.getObrsmybm() +
                ",Xcbh:" + this.getXcbh() +
                ",Obrjsbz:" + this.getObrjsbz() +
                ",Barcode:" + this.getBarcode() +
                ",BarcodeS:" + this.getBarcodeS() +
                ",End:" + this.getEnd();
    }

    public static Object decode(ByteBuffer byteBuffer) {
        DownSealMailCommand downSealMailCommand = new DownSealMailCommand();
        int length = byteBuffer.limit();

        downSealMailCommand.setLength(byteBuffer.getShort());
        downSealMailCommand.setLchute(byteBuffer.getInt());
        downSealMailCommand.setChute(byteBuffer.getShort());
        downSealMailCommand.setSupplyNo(byteBuffer.get());
        downSealMailCommand.setLgbz(byteBuffer.get());
        downSealMailCommand.setLpbz(byteBuffer.get());
        downSealMailCommand.setFjcgbz(byteBuffer.get());
        downSealMailCommand.setFjycyy(byteBuffer.get());
        downSealMailCommand.setFjsjlybm(byteBuffer.get());
        downSealMailCommand.setGjms(byteBuffer.get());
        downSealMailCommand.setObrsmybm(byteBuffer.get());
        downSealMailCommand.setXcbh(byteBuffer.getShort());
        downSealMailCommand.setObrjsbz(byteBuffer.get());

        byte[] barcode = new byte[22];
        byteBuffer.get(barcode);

        downSealMailCommand.setBarcode(barcode);
        downSealMailCommand.setBarcodeS(new String(barcode));

        try {
            downSealMailCommand.setBusType(byteBuffer.getShort());
            downSealMailCommand.setLchute2(byteBuffer.getInt());
        }catch (Exception e){
            e.printStackTrace();
        }

        downSealMailCommand.setEnd(byteBuffer.get());

        return downSealMailCommand;
    }

    public short getLength() {
        return length;
    }

    public void setLength(short length) {
        this.length = length;
    }

    public int getLchute() {
        return lchute;
    }

    public void setLchute(int lchute) {
        this.lchute = lchute;
    }

    public short getChute() {
        return chute;
    }

    public void setChute(short chute) {
        this.chute = chute;
    }

    public byte getSupplyNo() {
        return supplyNo;
    }

    public void setSupplyNo(byte supplyNo) {
        this.supplyNo = supplyNo;
    }

    public byte getLgbz() {
        return lgbz;
    }

    public void setLgbz(byte lgbz) {
        this.lgbz = lgbz;
    }

    public byte getLpbz() {
        return lpbz;
    }

    public void setLpbz(byte lpbz) {
        this.lpbz = lpbz;
    }

    public byte getFjcgbz() {
        return fjcgbz;
    }

    public void setFjcgbz(byte fjcgbz) {
        this.fjcgbz = fjcgbz;
    }

    public byte getFjycyy() {
        return fjycyy;
    }

    public void setFjycyy(byte fjycyy) {
        this.fjycyy = fjycyy;
    }

    public byte getFjsjlybm() {
        return fjsjlybm;
    }

    public void setFjsjlybm(byte fjsjlybm) {
        this.fjsjlybm = fjsjlybm;
    }

    public byte getGjms() {
        return gjms;
    }

    public void setGjms(byte gjms) {
        this.gjms = gjms;
    }

    public byte getObrsmybm() {
        return obrsmybm;
    }

    public void setObrsmybm(byte obrsmybm) {
        this.obrsmybm = obrsmybm;
    }

    public short getXcbh() {
        return xcbh;
    }

    public void setXcbh(short xcbh) {
        this.xcbh = xcbh;
    }

    public byte getObrjsbz() {
        return obrjsbz;
    }

    public void setObrjsbz(byte obrjsbz) {
        this.obrjsbz = obrjsbz;
    }

    public byte[] getBarcode() {
        return barcode;
    }

    public void setBarcode(byte[] barcode) {
        this.barcode = barcode;
    }

    public byte getEnd() {
        return end;
    }

    public void setEnd(byte end) {
        this.end = end;
    }

    public String getBarcodeS() {
        return barcodeS;
    }

    public void setBarcodeS(String barcodeS) {
        this.barcodeS = barcodeS;
    }

    public short getBusType() {
        return busType;
    }

    public void setBusType(short busType) {
        this.busType = busType;
    }

    public int getLchute2() {
        return lchute2;
    }

    public void setLchute2(int lchute2) {
        this.lchute2 = lchute2;
    }
}
