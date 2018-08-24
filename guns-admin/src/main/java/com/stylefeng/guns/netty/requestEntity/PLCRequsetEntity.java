package com.stylefeng.guns.netty.requestEntity;

/**
 * 请求PLC分拣信息
 */
public class PLCRequsetEntity {
    private String sortingId;
    private String billCode;
    private String trayCode;
    private String lchute;
    private String chute;
    private String bussinessType;


    public PLCRequsetEntity(String sortingId,String billCode, String trayCode, String lchute, String chute, String bussinessType) {
        this.sortingId = sortingId;
        this.billCode = billCode;
        this.trayCode = trayCode;
        this.lchute = lchute;
        this.chute = chute;
        this.bussinessType = bussinessType;
    }

    public PLCRequsetEntity(String sortingId,String billCode, String trayCode, String chute) {
        this.sortingId = sortingId;
        this.billCode = billCode;
        this.trayCode = trayCode;
        this.chute = chute;
    }

    public PLCRequsetEntity(){
        super();
    }

    public String getSortingId() {
        return sortingId;
    }

    public void setSortingId(String sortingId) {
        this.sortingId = sortingId;
    }

    public String getBillCode() {
        return billCode;
    }

    public void setBillCode(String billCode) {
        this.billCode = billCode;
    }

    public String getTrayCode() {
        return trayCode;
    }

    public void setTrayCode(String trayCode) {
        this.trayCode = trayCode;
    }

    public String getLchute() {
        return lchute;
    }

    public void setLchute(String lchute) {
        this.lchute = lchute;
    }

    public String getChute() {
        return chute;
    }

    public void setChute(String chute) {
        this.chute = chute;
    }

    public String getBussinessType() {
        return bussinessType;
    }

    public void setBussinessType(String bussinessType) {
        this.bussinessType = bussinessType;
    }

    @Override
    public String toString() {
        return "PLCRequsetEntity{" +
                "sortingId='" + sortingId + '\'' +
                ", trayCode='" + trayCode + '\'' +
                ", lchute='" + lchute + '\'' +
                ", chute='" + chute + '\'' +
                ", bussinessType='" + bussinessType + '\'' +
                '}';
    }
}
