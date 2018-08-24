package com.stylefeng.guns.netty.requestEntity;

/**
 * 分拣结果
 */
public class SortResultRequestEntity {
    //一次分拣操作唯一ID
    private String sortingId;
    //小车编码
    private String trayCode;
    //运单单号，无码下架为NOREAD
    private String billCode;
    //流水线号
    private String pipeline;
    //分拣下架时间
    private String sortTime;
    //下架时轮转圈数
    private Integer turnNumber;
    //若有分拣口信息，则返回分拣口
    private String sortPortCode;
    //货物下架分拣来源，如供包补码，超时为空
    private String sortSource;
    //分拣编码，超时和无码可以为空
    private String sortCode;
    //sorting | transferring
    private String sortMode;

    public String getSortingId() {
        return sortingId;
    }

    public void setSortingId(String sortingId) {
        this.sortingId = sortingId;
    }

    public String getTrayCode() {
        return trayCode;
    }

    public void setTrayCode(String trayCode) {
        this.trayCode = trayCode;
    }

    public String getBillCode() {
        return billCode;
    }

    public void setBillCode(String billCode) {
        this.billCode = billCode;
    }

    public String getPipeline() {
        return pipeline;
    }

    public void setPipeline(String pipeline) {
        this.pipeline = pipeline;
    }

    public String getSortTime() {
        return sortTime;
    }

    public void setSortTime(String sortTime) {
        this.sortTime = sortTime;
    }

    public Integer getTurnNumber() {
        return turnNumber;
    }

    public void setTurnNumber(Integer turnNumber) {
        this.turnNumber = turnNumber;
    }

    public String getSortPortCode() {
        return sortPortCode;
    }

    public void setSortPortCode(String sortPortCode) {
        this.sortPortCode = sortPortCode;
    }

    public String getSortSource() {
        return sortSource;
    }

    public void setSortSource(String sortSource) {
        this.sortSource = sortSource;
    }

    public String getSortCode() {
        return sortCode;
    }

    public void setSortCode(String sortCode) {
        this.sortCode = sortCode;
    }

    public String getSortMode() {
        return sortMode;
    }

    public void setSortMode(String sortMode) {
        this.sortMode = sortMode;
    }

    @Override
    public String toString() {
        return "SortResultRequestEntity{" +
                "sortingId='" + sortingId + '\'' +
                ", trayCode='" + trayCode + '\'' +
                ", billCode='" + billCode + '\'' +
                ", pipeline='" + pipeline + '\'' +
                ", sortTime='" + sortTime + '\'' +
                ", turnNumber=" + turnNumber +
                ", sortPortCode='" + sortPortCode + '\'' +
                ", sortSource='" + sortSource + '\'' +
                ", sortCode='" + sortCode + '\'' +
                ", sortMode='" + sortMode + '\'' +
                '}';
    }
}
