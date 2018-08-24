package com.stylefeng.guns.modular.business.controller;

import com.alibaba.druid.util.StringUtils;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.core.util.ToolUtil;
import com.stylefeng.guns.modular.system.model.ScanDetail;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.beans.factory.annotation.Autowired;
import com.stylefeng.guns.core.log.LogObjectHolder;
import org.springframework.web.bind.annotation.RequestParam;
import com.stylefeng.guns.modular.system.model.YddSealmail;
import com.stylefeng.guns.modular.business.service.IYddSealmailService;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * 下件信息查询控制器
 *
 * @author fengshuonan
 * @Date 2018-07-22 02:29:39
 */
@Controller
@RequestMapping("/yddSealmail")
public class YddSealmailController extends BaseController {

    private String PREFIX = "/business/yddSealmail/";

    @Autowired
    private IYddSealmailService yddSealmailService;

    /**
     * 跳转到下件信息查询首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "yddSealmail.html";
    }

    /**
     * 跳转到添加下件信息查询
     */
    @RequestMapping("/yddSealmail_add")
    public String yddSealmailAdd() {
        return PREFIX + "yddSealmail_add.html";
    }

     /**
     * 跳转到修改下件信息查询
     */
    @RequestMapping("/yddSealmail_update/{yddSealmailId}")
    public String yddSealmailUpdate(@PathVariable Integer yddSealmailId, Model model) {
        YddSealmail yddSealmail = yddSealmailService.selectById(yddSealmailId);
        model.addAttribute("item",yddSealmail);
        LogObjectHolder.me().set(yddSealmail);
        return PREFIX + "yddSealmail_edit.html";
    }

    /**
     * 获取下件信息查询列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(HttpServletRequest request, @RequestParam(required = false) String barcode,
                       @RequestParam(required = false) String chute,
                       @RequestParam(required = false) String beginTime,
                       @RequestParam(required = false) String endTime) {
        int page_Num = 1;
        int page_Size = 14;
        if(!StringUtils.isEmpty(request.getParameter("pageNumber")))
        {
            page_Num=Integer.parseInt((String)request.getParameter("pageNumber"));
        }
        if(!StringUtils.isEmpty(request.getParameter("pageSize")))
        {
            page_Size=Integer.parseInt((String)request.getParameter("pageSize"));
        }

        Page<ScanDetail> page = new Page<ScanDetail>(page_Num, page_Size);

        EntityWrapper<YddSealmail> wrapper = new EntityWrapper<>();
        if (ToolUtil.isNotEmpty(beginTime)){
            wrapper.ge("sorttime",beginTime);//大于等于
        }
        if (ToolUtil.isNotEmpty(endTime)){
            wrapper.le("sorttime",endTime);//小于等于
        }
        if (ToolUtil.isNotEmpty(barcode)){
            wrapper.eq("barcode",barcode);//等于
        }
        if (ToolUtil.isNotEmpty(chute)){
            wrapper.eq("chute",chute);//等于
        }
        Page<Map<String, Object>> test=  yddSealmailService.selectMapsPage(page,wrapper);
        //bootstrap-table要求服务器返回的json须包含：total，rows
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total", test.getTotal());
        map.put("rows", test.getRecords());
        return map;
    }

    /**
     * 新增下件信息查询
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(YddSealmail yddSealmail) {
        yddSealmailService.insert(yddSealmail);
        return SUCCESS_TIP;
    }

    /**
     * 删除下件信息查询
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer yddSealmailId) {
        yddSealmailService.deleteById(yddSealmailId);
        return SUCCESS_TIP;
    }

    /**
     * 修改下件信息查询
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(YddSealmail yddSealmail) {
        yddSealmailService.updateById(yddSealmail);
        return SUCCESS_TIP;
    }

    /**
     * 下件信息查询详情
     */
    @RequestMapping(value = "/detail/{yddSealmailId}")
    @ResponseBody
    public Object detail(@PathVariable("yddSealmailId") Integer yddSealmailId) {
        return yddSealmailService.selectById(yddSealmailId);
    }
}
