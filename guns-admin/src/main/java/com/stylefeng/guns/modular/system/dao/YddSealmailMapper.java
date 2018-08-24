package com.stylefeng.guns.modular.system.dao;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.stylefeng.guns.modular.system.model.YddSealmail;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * <p>
 * 下件信息表 Mapper 接口
 * </p>
 *
 * @author stylefeng
 * @since 2018-07-22
 */
public interface YddSealmailMapper extends BaseMapper<YddSealmail> {

    /**
     * 根据单号、开始时间、结束时间查询下件信息列表
     *
     */
    List<YddSealmail> getYddSealmails(@Param("barcode") String barcode,
                                      @Param("chute") String chute,
                                      @Param("beginTime") String beginTime,
                                      @Param("endTime") String endTime);

    /**
     * 根据开始时间、结束时间查询有单号下异常口数量
     *
     */
    Integer getTimeoutExceptionSortCounts(
                                      @Param("beginTime") String beginTime,
                                      @Param("endTime") String endTime);

    /**
     * 根据格口号、开始时间、结束时间查询格口吞吐量
     *
     */
    Integer getThroughputs(@Param("chute")String chute, @Param("beginTime")String beginTime, @Param("endTime")String endTime);


    Integer getSupplyEfficiency(@Param("inductionid")String inductionid,  @Param("beginTime")String beginTime, @Param("endTime")String endTime);
}
