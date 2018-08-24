package com.stylefeng.guns.netty.requestEntity;

import java.util.List;

/**
 * 需要推送补码结果信息
 */
public class SortComplemenRequestEntity {

    //一次分拣操作唯一ID
    private String sortingId;
    //小车编码
    private String trayCode;
    //运单单号，无码下架为NOREAD
    private String billCode;
    //流水线号
    private String pipeline;
    //若有分拣口信息，则返回分拣口
    private List<String> sortPortCode;
    //货物下架分拣来源，如供包补码，超时为空
    private String sortSource;
    //分拣编码，超时和无码可以为空
    private String sortCode;

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

    public List<String> getSortPortCode() {
        return sortPortCode;
    }

    public void setSortPortCode(List<String> sortPortCode) {
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

    @Override
    public String toString() {
        return "SortComplemenRequestEntity{" +
                "sortingId='" + sortingId + '\'' +
                ", trayCode='" + trayCode + '\'' +
                ", billCode='" + billCode + '\'' +
                ", pipeline='" + pipeline + '\'' +
                ", sortPortCode='" + sortPortCode + '\'' +
                ", sortSource='" + sortSource + '\'' +
                ", sortCode='" + sortCode + '\'' +
                '}';
    }
}
