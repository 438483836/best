package com.stylefeng.guns.modular.business.service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.stylefeng.guns.modular.system.model.YddSealmail;
import com.baomidou.mybatisplus.service.IService;

import java.util.Date;
import java.util.List;

/**
 * <p>
 * 下件信息表 服务类
 * </p>
 *
 * @author stylefeng
 * @since 2018-07-22
 */
public interface IYddSealmailService extends IService<YddSealmail> {

    /**
     * 根据单号、开始时间、结束时间查询下件信息列表
     *
     */
    List<YddSealmail> getYddSealmails(String barcode, String chute,String beginTime, String endTime);


    /**
     * 根据供件台号、开始时间、结束时间查询格口吞吐量
     *
     */
    String getSupplyEfficiency(String inductionid, String beginTime, String endTime);

    /**
     * 根据格口号、开始时间、结束时间查询格口吞吐量
     *
     */
    String getThroughputs(String chute, String beginTime, String endTime);

    /**
     * 根据开始时间、结束时间查询分拣总量
     *
     */
    String getSortCounts(String beginTime, String endTime);

    /**
     * 根据开始时间、结束时间查询自动分拣正常分拣总量
     *
     */
    Integer getAutoNormalSortCounts(String beginTime, String endTime);

    /**
     * 根据开始时间、结束时间查询人工补码正常分拣总量
     *
     */
    Integer getBumaNormalSortCounts(String beginTime, String endTime);

    /**
     * 根据开始时间、结束时间查询异常口分拣总量
     *
     */
    Integer getExceptionSortCounts(String beginTime, String endTime);

    /**
     * 根据开始时间、结束时间查询超时异常口分拣总量
     *
     */
    Integer getTimeoutExceptionSortCounts(String beginTime, String endTime);

    /**
     * 根据开始时间、结束时间查询无条码异常口分拣总量
     *
     */
    Integer getNoBarcodeExceptionSortCounts(String beginTime, String endTime);

    /**
     * 根据开始时间、结束时间查询百世直接推送异常口分拣总量
     *
     */
    Integer getExceptionByBestSortCounts(String beginTime, String endTime);

    /**
     * 根据开始时间、结束时间查询分拣趋势（20分钟一次统计）
     *
     */
    String getSortingEfficiency(String beginTime, String endTime);

}
