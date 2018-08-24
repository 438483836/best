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
 * PLC信息配置表
 * </p>
 *
 * @author stylefeng
 * @since 2018-07-20
 */
@TableName("tbl_plc_config")
public class PlcConfig extends Model<PlcConfig> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键<seq>
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * IP
     */
    private String ip;
    /**
     * 端口
     */
    private Integer port;
    /**
     * 名称
     */
    private String name;
    /**
     * 备注
     */
    private String remark;
    /**
     * 类型
     */
    private String type;
    /**
     * 类型名称
     */
    @TableField("type_name")
    private String typeName;
    /**
     * 是否启用
     */
    @TableField("is_used")
    private String isUsed;
    /**
     * 保存时间
     */
    @TableField("save_datetime")
    private Date saveDatetime;
    /**
     * 修改人员
     */
    @TableField("save_user")
    private String saveUser;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public Integer getPort() {
        return port;
    }

    public void setPort(Integer port) {
        this.port = port;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getIsUsed() {
        return isUsed;
    }

    public void setIsUsed(String isUsed) {
        this.isUsed = isUsed;
    }

    public Date getSaveDatetime() {
        return saveDatetime;
    }

    public void setSaveDatetime(Date saveDatetime) {
        this.saveDatetime = saveDatetime;
    }

    public String getSaveUser() {
        return saveUser;
    }

    public void setSaveUser(String saveUser) {
        this.saveUser = saveUser;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "PlcConfig{" +
        "id=" + id +
        ", ip=" + ip +
        ", port=" + port +
        ", name=" + name +
        ", remark=" + remark +
        ", type=" + type +
        ", typeName=" + typeName +
        ", isUsed=" + isUsed +
        ", saveDatetime=" + saveDatetime +
        ", saveUser=" + saveUser +
        "}";
    }
}
