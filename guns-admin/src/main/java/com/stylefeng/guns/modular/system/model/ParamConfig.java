package com.stylefeng.guns.modular.system.model;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 参数配置表
 * </p>
 *
 * @author stylefeng
 * @since 2018-07-20
 */
@TableName("tbl_param_config")
public class ParamConfig extends Model<ParamConfig> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键<seq>
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 关键字
     */
    private String keyy;
    /**
     * 值
     */
    private String value;
    /**
     * 名称
     */
    private String name;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getKeyy() {
        return keyy;
    }

    public void setKeyy(String keyy) {
        this.keyy = keyy;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "ParamConfig{" +
        "id=" + id +
        ", keyy=" + keyy +
        ", value=" + value +
        ", name=" + name +
        "}";
    }
}
