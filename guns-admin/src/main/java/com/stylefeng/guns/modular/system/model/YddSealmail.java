package com.stylefeng.guns.modular.system.model;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 下件信息表
 * </p>
 *
 * @author stylefeng
 * @since 2018-07-22
 */
@TableName("tbl_ydd_sealmail")
public class YddSealmail extends Model<YddSealmail> {

    private static final long serialVersionUID = 1L;

    /**
     * 自动ID<seq>
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 清单ID
     */
    private String bagid;
    /**
     * 快件号码
     */
    private String barcode;
    /**
     * 快件ID
     */
    private Integer mailid;
    /**
     * 逻辑格口代码
     */
    private String lchute;
    /**
     * 物理格口代码
     */
    private String chute;
    /**
     * 落格时间
     */
    private Date sorttime;
    /**
     * 供件台号
     */
    private Integer inductionid;
    /**
     * 称重重量
     */
    private Float weight;
    /**
     * 长度
     */
    private Float length;
    /**
     * 宽度
     */
    private Float width;
    /**
     * 高度
     */
    private Float height;
    /**
     * 体积
     */
    private Float volume;
    /**
     * 落格标志
     */
    private String dropflag;
    /**
     * 留盘检测确认标志
     */
    private String checkflag;
    /**
     * 分拣成功与否标志
     */
    private String succesydlag;
    /**
     * 异常原因代码
     */
    private String overflowid;
    /**
     * 设备编码
     */
    private String devicecode;
    /**
     * 打印标志
     */
    private String printflag;
    /**
     * 请封时间
     */
    private Date printtime;
    /**
     * 供件时间
     */
    private Date indtime;
    /**
     * 供件模式
     */
    private String indmode;
    /**
     * OBR编号
     */
    private String obrid;
    /**
     * 扫描时间
     */
    private Date scantime;
    /**
     * 托盘号
     */
    private Integer trayid;
    /**
     * 删除标志
     */
    private String delflag;
    /**
     * ADM处理标志
     */
    private Integer ocrflag;
    /**
     * OBR拒识标志
     */
    private String rejectflag;
    /**
     * 发送标志
     */
    private String sendflag;
    /**
     * 数据上传时间'
     */
    private Date sendtime;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBagid() {
        return bagid;
    }

    public void setBagid(String bagid) {
        this.bagid = bagid;
    }

    public String getBarcode() {
        return barcode;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode;
    }

    public Integer getMailid() {
        return mailid;
    }

    public void setMailid(Integer mailid) {
        this.mailid = mailid;
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

    public Date getSorttime() {
        return sorttime;
    }

    public void setSorttime(Date sorttime) {
        this.sorttime = sorttime;
    }

    public Integer getInductionid() {
        return inductionid;
    }

    public void setInductionid(Integer inductionid) {
        this.inductionid = inductionid;
    }

    public Float getWeight() {
        return weight;
    }

    public void setWeight(Float weight) {
        this.weight = weight;
    }

    public Float getLength() {
        return length;
    }

    public void setLength(Float length) {
        this.length = length;
    }

    public Float getWidth() {
        return width;
    }

    public void setWidth(Float width) {
        this.width = width;
    }

    public Float getHeight() {
        return height;
    }

    public void setHeight(Float height) {
        this.height = height;
    }

    public Float getVolume() {
        return volume;
    }

    public void setVolume(Float volume) {
        this.volume = volume;
    }

    public String getDropflag() {
        return dropflag;
    }

    public void setDropflag(String dropflag) {
        this.dropflag = dropflag;
    }

    public String getCheckflag() {
        return checkflag;
    }

    public void setCheckflag(String checkflag) {
        this.checkflag = checkflag;
    }

    public String getSuccesydlag() {
        return succesydlag;
    }

    public void setSuccesydlag(String succesydlag) {
        this.succesydlag = succesydlag;
    }

    public String getOverflowid() {
        return overflowid;
    }

    public void setOverflowid(String overflowid) {
        this.overflowid = overflowid;
    }

    public String getDevicecode() {
        return devicecode;
    }

    public void setDevicecode(String devicecode) {
        this.devicecode = devicecode;
    }

    public String getPrintflag() {
        return printflag;
    }

    public void setPrintflag(String printflag) {
        this.printflag = printflag;
    }

    public Date getPrinttime() {
        return printtime;
    }

    public void setPrinttime(Date printtime) {
        this.printtime = printtime;
    }

    public Date getIndtime() {
        return indtime;
    }

    public void setIndtime(Date indtime) {
        this.indtime = indtime;
    }

    public String getIndmode() {
        return indmode;
    }

    public void setIndmode(String indmode) {
        this.indmode = indmode;
    }

    public String getObrid() {
        return obrid;
    }

    public void setObrid(String obrid) {
        this.obrid = obrid;
    }

    public Date getScantime() {
        return scantime;
    }

    public void setScantime(Date scantime) {
        this.scantime = scantime;
    }

    public Integer getTrayid() {
        return trayid;
    }

    public void setTrayid(Integer trayid) {
        this.trayid = trayid;
    }

    public String getDelflag() {
        return delflag;
    }

    public void setDelflag(String delflag) {
        this.delflag = delflag;
    }

    public Integer getOcrflag() {
        return ocrflag;
    }

    public void setOcrflag(Integer ocrflag) {
        this.ocrflag = ocrflag;
    }

    public String getRejectflag() {
        return rejectflag;
    }

    public void setRejectflag(String rejectflag) {
        this.rejectflag = rejectflag;
    }

    public String getSendflag() {
        return sendflag;
    }

    public void setSendflag(String sendflag) {
        this.sendflag = sendflag;
    }

    public Date getSendtime() {
        return sendtime;
    }

    public void setSendtime(Date sendtime) {
        this.sendtime = sendtime;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "YddSealmail{" +
        "id=" + id +
        ", bagid=" + bagid +
        ", barcode=" + barcode +
        ", mailid=" + mailid +
        ", lchute=" + lchute +
        ", chute=" + chute +
        ", sorttime=" + sorttime +
        ", inductionid=" + inductionid +
        ", weight=" + weight +
        ", length=" + length +
        ", width=" + width +
        ", height=" + height +
        ", volume=" + volume +
        ", dropflag=" + dropflag +
        ", checkflag=" + checkflag +
        ", succesydlag=" + succesydlag +
        ", overflowid=" + overflowid +
        ", devicecode=" + devicecode +
        ", printflag=" + printflag +
        ", printtime=" + printtime +
        ", indtime=" + indtime +
        ", indmode=" + indmode +
        ", obrid=" + obrid +
        ", scantime=" + scantime +
        ", trayid=" + trayid +
        ", delflag=" + delflag +
        ", ocrflag=" + ocrflag +
        ", rejectflag=" + rejectflag +
        ", sendflag=" + sendflag +
        ", sendtime=" + sendtime +
        "}";
    }
}
