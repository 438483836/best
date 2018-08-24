package com.stylefeng.guns.modular.system.model;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 分拣口信息表
 * </p>
 *
 * @author stylefeng
 * @since 2018-07-20
 */
@TableName("tbl_bill_code_definition")
public class BillCodeDefinition extends Model<BillCodeDefinition> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 面单种类编码
     */
    private String code;
    /**
     * 面单种类名称
     */
    private String name;
    /**
     * 是否有明细
     */
    private String isList;
    /**
     * 单位数目
     */
    private String unitNumber;
    /**
     * 开始字符
     */
    private String startChars;
    /**
     * 开始字符之后的字长度
     */
    private Double afterLength;
    /**
     * 面单字符总长度
     */
    private Double totalLength;
    /**
     * 面单类型 id
     */
    private String billTypeId;
    /**
     * 版本号
     */
    private String syncVersion;
    /**
     * 面单类型名称
     */
    private String billTypeName;
    /**
     * 是否是电子面单
     */
    private String isEBill;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getIsList() {
        return isList;
    }

    public void setIsList(String isList) {
        this.isList = isList;
    }

    public String getUnitNumber() {
        return unitNumber;
    }

    public void setUnitNumber(String unitNumber) {
        this.unitNumber = unitNumber;
    }

    public String getStartChars() {
        return startChars;
    }

    public void setStartChars(String startChars) {
        this.startChars = startChars;
    }

    public Double getAfterLength() {
        return afterLength;
    }

    public void setAfterLength(Double afterLength) {
        this.afterLength = afterLength;
    }

    public Double getTotalLength() {
        return totalLength;
    }

    public void setTotalLength(Double totalLength) {
        this.totalLength = totalLength;
    }

    public String getBillTypeId() {
        return billTypeId;
    }

    public void setBillTypeId(String billTypeId) {
        this.billTypeId = billTypeId;
    }

    public String getSyncVersion() {
        return syncVersion;
    }

    public void setSyncVersion(String syncVersion) {
        this.syncVersion = syncVersion;
    }

    public String getBillTypeName() {
        return billTypeName;
    }

    public void setBillTypeName(String billTypeName) {
        this.billTypeName = billTypeName;
    }

    public String getIsEBill() {
        return isEBill;
    }

    public void setIsEBill(String isEBill) {
        this.isEBill = isEBill;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "BillCodeDefinition{" +
        "id=" + id +
        ", code=" + code +
        ", name=" + name +
        ", isList=" + isList +
        ", unitNumber=" + unitNumber +
        ", startChars=" + startChars +
        ", afterLength=" + afterLength +
        ", totalLength=" + totalLength +
        ", billTypeId=" + billTypeId +
        ", syncVersion=" + syncVersion +
        ", billTypeName=" + billTypeName +
        ", isEBill=" + isEBill +
        "}";
    }
}
