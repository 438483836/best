package com.stylefeng.guns.modular.business.controller;


import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.modular.business.service.IYddSealmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 供件台效率控制器
 *
 * @author fengshuonan
 * @Date 2018-07-22 02:11:16
 */
@Controller
@RequestMapping("/supplyEfficiency")
public class SupplyEfficiencyContorller extends BaseController {

    private String PREFIX = "/business/supplyEfficiency/";

    @Autowired
    private IYddSealmailService yddSealmailService;

    /**
     * 供件台效率首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "supplyEfficiency.html";
    }


    /**
     * 供件台效率统计
     */
    @RequestMapping(value = "/view")
    @ResponseBody
    public Object list(@RequestParam(required = false) String inductionid, @RequestParam(required = false) String beginTime, @RequestParam(required = false) String endTime) {
        return yddSealmailService.getSupplyEfficiency(inductionid,beginTime,endTime);
    }

}
