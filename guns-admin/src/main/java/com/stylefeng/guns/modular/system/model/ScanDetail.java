package com.stylefeng.guns.modular.system.model;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 扫描详情表
 * </p>
 *
 * @author stylefeng
 * @since 2018-07-22
 */
@TableName("tbl_scan_detail")
public class ScanDetail extends Model<ScanDetail> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键<seq>
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 唯一分拣id
     */
    @TableField("sort_id")
    private String sortId;
    /**
     * 小车编号
     */
    @TableField("tray_code")
    private String trayCode;
    /**
     * 扫描时间
     */
    @TableField("scan_datetime")
    private Date scanDatetime;
    /**
     * 图片ID
     */
    @TableField("img_id")
    private String imgId;
    /**
     * 条码
     */
    private String barcode;
    /**
     * 发送时间
     */
    @TableField("send_datetime")
    private Date sendDatetime;
    /**
     * 扫描仪编号
     */
    @TableField("scan_no")
    private String scanNo;
    /**
     * 扫描仪名称
     */
    @TableField("scan_name")
    private String scanName;
    /**
     * 通讯详情ID
     */
    @TableField("conn_detail_id")
    private String connDetailId;
    /**
     * 逻辑格口
     */
    private String lchute;
    /**
     * 重量
     */
    private String weight;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSortId() {
        return sortId;
    }

    public void setSortId(String sortId) {
        this.sortId = sortId;
    }

    public String getTrayCode() {
        return trayCode;
    }

    public void setTrayCode(String trayCode) {
        this.trayCode = trayCode;
    }

    public Date getScanDatetime() {
        return scanDatetime;
    }

    public void setScanDatetime(Date scanDatetime) {
        this.scanDatetime = scanDatetime;
    }

    public String getImgId() {
        return imgId;
    }

    public void setImgId(String imgId) {
        this.imgId = imgId;
    }

    public String getBarcode() {
        return barcode;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode;
    }

    public Date getSendDatetime() {
        return sendDatetime;
    }

    public void setSendDatetime(Date sendDatetime) {
        this.sendDatetime = sendDatetime;
    }

    public String getScanNo() {
        return scanNo;
    }

    public void setScanNo(String scanNo) {
        this.scanNo = scanNo;
    }

    public String getScanName() {
        return scanName;
    }

    public void setScanName(String scanName) {
        this.scanName = scanName;
    }

    public String getConnDetailId() {
        return connDetailId;
    }

    public void setConnDetailId(String connDetailId) {
        this.connDetailId = connDetailId;
    }

    public String getLchute() {
        return lchute;
    }

    public void setLchute(String lchute) {
        this.lchute = lchute;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "ScanDetail{" +
        "id=" + id +
        ", sortId=" + sortId +
        ", trayCode=" + trayCode +
        ", scanDatetime=" + scanDatetime +
        ", imgId=" + imgId +
        ", barcode=" + barcode +
        ", sendDatetime=" + sendDatetime +
        ", scanNo=" + scanNo +
        ", scanName=" + scanName +
        ", connDetailId=" + connDetailId +
        ", lchute=" + lchute +
        ", weight=" + weight +
        "}";
    }
}
