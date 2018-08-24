package com.stylefeng.guns.netty.requestEntity;

import java.util.List;

/**
 * 请求的分拣系信息
 */
public class SortInfoRequestEntity {
    private String sortingId;   //一次分拣操作唯一ID
    private String trayCode;    //小车编码
    private String trayStatus;  //recognized: 有货并识别单号 unrecognized：有货但无法识别单号 empty：无货
    private List<String> billCodes; //当能够识别单号则为单号，否则为字符串NOREAD
    private String pipeline;    //流水线号
    //2PDA:1顶扫
    private String type;    //流水线号
    private Integer turnNumber; //货物已转圈数
    private long requestTime;   //拍照扫码时间
    private String sortMode;    //sorting | transferring

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

    public String getTrayStatus() {
        return trayStatus;
    }

    public void setTrayStatus(String trayStatus) {
        this.trayStatus = trayStatus;
    }

    public List<String> getBillCodes() {
        return billCodes;
    }

    public void setBillCodes(List<String> billCodes) {
        this.billCodes = billCodes;
    }

    public String getPipeline() {
        return pipeline;
    }

    public void setPipeline(String pipeline) {
        this.pipeline = pipeline;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getTurnNumber() {
        return turnNumber;
    }

    public void setTurnNumber(Integer turnNumber) {
        this.turnNumber = turnNumber;
    }

    public long getRequestTime() {
        return requestTime;
    }

    public void setRequestTime(long requestTime) {
        this.requestTime = requestTime;
    }

    public String getSortMode() {
        return sortMode;
    }

    public void setSortMode(String sortMode) {
        this.sortMode = sortMode;
    }
}
