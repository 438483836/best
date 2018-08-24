package com.stylefeng.guns.netty.requestEntity;

/**
 * 缓存的面单规则
 */
public class BillCodeDefinitionVOEntity {
    private String code;   //面单种类编码
    private String name;    //面单种类名称
    private Boolean isList;  //是否有明细
    private Integer unitNumber; //单位数目
    private String startChars;    //开始字符
    private Integer afterLength; //开始字符之后的字长度
    private Integer totalLength; //面单字符总长度
    private Integer billTypeId;//面单类型 id
    private long syncVersion;   //版本号
    private String billTypeName;    //面单类型名称
    private Boolean isEBill; //是否是电子面单

    public Boolean getIsList() {
        return isList;
    }

    public void setIsList(Boolean list) {
        isList = list;
    }

    @Override
    public String toString() {
        return "BillCodeDefinitionVOEntity{" +
                "code='" + code + '\'' +
                ", name='" + name + '\'' +
                ", isList=" + isList +
                ", unitNumber=" + unitNumber +
                ", startChars='" + startChars + '\'' +
                ", afterLength=" + afterLength +
                ", totalLength=" + totalLength +
                ", billTypeId=" + billTypeId +
                ", syncVersion=" + syncVersion +
                ", billTypeName='" + billTypeName + '\'' +
                ", isEBill=" + isEBill +
                '}';
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getUnitNumber() {
        return unitNumber;
    }

    public void setUnitNumber(Integer unitNumber) {
        this.unitNumber = unitNumber;
    }

    public String getStartChars() {
        return startChars;
    }

    public void setStartChars(String startChars) {
        this.startChars = startChars;
    }

    public Integer getAfterLength() {
        return afterLength;
    }

    public void setAfterLength(Integer afterLength) {
        this.afterLength = afterLength;
    }

    public Integer getTotalLength() {
        return totalLength;
    }

    public void setTotalLength(Integer totalLength) {
        this.totalLength = totalLength;
    }

    public Integer getBillTypeId() {
        return billTypeId;
    }

    public void setBillTypeId(Integer billTypeId) {
        this.billTypeId = billTypeId;
    }

    public long getSyncVersion() {
        return syncVersion;
    }

    public void setSyncVersion(long syncVersion) {
        this.syncVersion = syncVersion;
    }

    public String getBillTypeName() {
        return billTypeName;
    }

    public void setBillTypeName(String billTypeName) {
        this.billTypeName = billTypeName;
    }

    public Boolean getIsEBill() {
        return isEBill;
    }

    public void setIsEBill(Boolean EBill) {
        isEBill = EBill;
    }


}
