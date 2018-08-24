package com.stylefeng.guns.modular.system.model;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 端口同步配置表
 * </p>
 *
 * @author stylefeng
 * @since 2018-08-02
 */
@TableName("tbl_port_sync")
public class PortSync extends Model<PortSync> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 所属分拨
     */
    private String belongSiteName;
    /**
     * 流水线号
     */
    private String pipeline;
    /**
     * 目的站点
     */
    private String destSiteName;
    /**
     * 目的站点编码
     */
    private String destSiteCode;
    /**
     * 站点分拣编码
     */
    private String destSortingCode;
    /**
     * 分拣口编号
     */
    private String sortPortCode;
    /**
     * 分拣模式
     */
    private String sortMode;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBelongSiteName() {
        return belongSiteName;
    }

    public void setBelongSiteName(String belongSiteName) {
        this.belongSiteName = belongSiteName;
    }

    public String getPipeline() {
        return pipeline;
    }

    public void setPipeline(String pipeline) {
        this.pipeline = pipeline;
    }

    public String getDestSiteName() {
        return destSiteName;
    }

    public void setDestSiteName(String destSiteName) {
        this.destSiteName = destSiteName;
    }

    public String getDestSiteCode() {
        return destSiteCode;
    }

    public void setDestSiteCode(String destSiteCode) {
        this.destSiteCode = destSiteCode;
    }

    public String getDestSortingCode() {
        return destSortingCode;
    }

    public void setDestSortingCode(String destSortingCode) {
        this.destSortingCode = destSortingCode;
    }

    public String getSortPortCode() {
        return sortPortCode;
    }

    public void setSortPortCode(String sortPortCode) {
        this.sortPortCode = sortPortCode;
    }

    public String getSortMode() {
        return sortMode;
    }

    public void setSortMode(String sortMode) {
        this.sortMode = sortMode;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "PortSync{" +
        "id=" + id +
        ", belongSiteName=" + belongSiteName +
        ", pipeline=" + pipeline +
        ", destSiteName=" + destSiteName +
        ", destSiteCode=" + destSiteCode +
        ", destSortingCode=" + destSortingCode +
        ", sortPortCode=" + sortPortCode +
        ", sortMode=" + sortMode +
        "}";
    }
}
