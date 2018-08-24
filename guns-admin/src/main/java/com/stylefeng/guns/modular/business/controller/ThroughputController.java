package com.stylefeng.guns.modular.business.controller;


import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.modular.business.service.IYddSealmailService;
import com.stylefeng.guns.modular.system.model.YddSealmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * 格口吞吐量控制器
 *
 * @author fengshuonan
 * @Date 2018-07-22 02:11:16
 */
@Controller
@RequestMapping("/throughput")
public class ThroughputController extends BaseController {

    private String PREFIX = "/business/throughput/";

    @Autowired
    private IYddSealmailService yddSealmailService;

    /**
     * 跳转到格口吞吐量首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "throughput.html";
    }


    /**
     * 获取格口吞吐量列表
     */
    @RequestMapping(value = "/view")
    @ResponseBody
    public Object list(@RequestParam(required = false) String chute, @RequestParam(required = false) String beginTime, @RequestParam(required = false) String endTime) {
        return yddSealmailService.getThroughputs(chute,beginTime,endTime);
    }

}
