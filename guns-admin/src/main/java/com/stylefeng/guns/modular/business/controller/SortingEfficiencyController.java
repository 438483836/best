package com.stylefeng.guns.modular.business.controller;


import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.modular.business.service.IYddSealmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 分拣趋势图控制器
 *
 * @author fengshuonan
 * @Date 2018-07-22 02:11:16
 */
@Controller
@RequestMapping("/sortingEfficiency")
public class SortingEfficiencyController extends BaseController {

    private String PREFIX = "/business/sortingEfficiency/";

    @Autowired
    private IYddSealmailService yddSealmailService;

    /**
     * 跳转到分拣趋势图首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "sortingEfficiency.html";
    }


    /**
     * 获取分拣趋势图
     */
    @RequestMapping(value = "/view")
    @ResponseBody
    public Object list(@RequestParam(required = false) String beginTime, @RequestParam(required = false) String endTime) {
        return yddSealmailService.getSortingEfficiency(beginTime,endTime);
    }

}
