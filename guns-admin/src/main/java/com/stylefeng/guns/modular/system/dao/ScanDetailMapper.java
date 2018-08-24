package com.stylefeng.guns.modular.system.dao;

import com.stylefeng.guns.modular.system.model.ScanDetail;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 扫描详情表 Mapper 接口
 * </p>
 *
 * @author stylefeng
 * @since 2018-07-22
 */
public interface ScanDetailMapper extends BaseMapper<ScanDetail> {

    /**
     * 根据单号、开始时间、结束时间查询扫描详情信息列表
     *
     */
    List<ScanDetail> getScanDetails(@Param("barcode") String barcode, @Param("beginTime") String beginTime, @Param("endTime") String endTime);
}
