package com.stylefeng.guns.modular.business.service.impl;

import com.stylefeng.guns.modular.system.model.ScanDetail;
import com.stylefeng.guns.modular.system.dao.ScanDetailMapper;
import com.stylefeng.guns.modular.business.service.IScanDetailService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 扫描详情表 服务实现类
 * </p>
 *
 * @author stylefeng
 * @since 2018-07-22
 */
@Service
public class ScanDetailServiceImpl extends ServiceImpl<ScanDetailMapper, ScanDetail> implements IScanDetailService {


    @Autowired
    ScanDetailMapper mapper;
    @Override
    public List<ScanDetail> getScanDetails(String barcode, String beginTime, String endTime) {
        return mapper.getScanDetails(barcode,beginTime,endTime);
    }
}
