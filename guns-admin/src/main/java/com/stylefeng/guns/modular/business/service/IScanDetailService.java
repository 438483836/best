package com.stylefeng.guns.modular.business.service;

import com.stylefeng.guns.modular.system.model.ScanDetail;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * <p>
 * 扫描详情表 服务类
 * </p>
 *
 * @author stylefeng
 * @since 2018-07-22
 */
public interface IScanDetailService extends IService<ScanDetail> {

    /**
     * 根据单号、开始时间、结束时间查询扫描详情信息列表
     *
     */
    List<ScanDetail> getScanDetails(String barcode, String beginTime, String endTime);


}
