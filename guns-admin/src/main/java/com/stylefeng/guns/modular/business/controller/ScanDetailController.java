package com.stylefeng.guns.modular.business.controller;

import com.alibaba.druid.util.StringUtils;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.core.log.LogObjectHolder;
import com.stylefeng.guns.core.util.ToolUtil;
import com.stylefeng.guns.modular.business.service.IScanDetailService;
import com.stylefeng.guns.modular.system.model.ScanDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * 扫描详情查询控制器
 *
 * @author fengshuonan
 * @Date 2018-07-22 02:11:16
 */
@Controller
@RequestMapping("/scanDetail")
public class ScanDetailController extends BaseController {

    private String PREFIX = "/business/scanDetail/";

    @Autowired
    private IScanDetailService scanDetailService;

    /**
     * 跳转到扫描详情查询首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "scanDetail.html";
    }

    /**
     * 跳转到添加扫描详情查询
     */
    @RequestMapping("/scanDetail_add")
    public String scanDetailAdd() {
        return PREFIX + "scanDetail_add.html";
    }

    /**
     * 跳转到修改扫描详情查询
     */
    @RequestMapping("/scanDetail_update/{scanDetailId}")
    public String scanDetailUpdate(@PathVariable Integer scanDetailId, Model model) {
        ScanDetail scanDetail = scanDetailService.selectById(scanDetailId);
        model.addAttribute("item",scanDetail);
        LogObjectHolder.me().set(scanDetail);
        return PREFIX + "scanDetail_edit.html";
    }

    /**
     * 获取扫描详情查询列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list( HttpServletRequest request,@RequestParam(required = false) String barcode, @RequestParam(required = false) String beginTime, @RequestParam(required = false) String endTime) {

        int page_Num = 1;
        int page_Size = 14;
        if(!StringUtils.isEmpty(request.getParameter("pageNumber")))
        {
            page_Num=Integer.parseInt((String)request.getParameter("pageNumber"));
        }
        if(!StringUtils.isEmpty(request.getParameter("page_Size")))
        {
            page_Size=Integer.parseInt((String)request.getParameter("pageSize"));
        }

        Page<ScanDetail> page = new Page<ScanDetail>(page_Num, page_Size);

        EntityWrapper<ScanDetail> wrapper = new EntityWrapper<>();
        if (ToolUtil.isNotEmpty(beginTime)){
            wrapper.ge("scan_datetime",beginTime);//大于等于
        }
        if (ToolUtil.isNotEmpty(endTime)){
            wrapper.le("scan_datetime",endTime);//小于等于
        }
        if (ToolUtil.isNotEmpty(barcode)){
            wrapper.eq("barcode",barcode);//小于等于
        }


        Page<Map<String, Object>> test=  scanDetailService.selectMapsPage(page,wrapper);

        //bootstrap-table要求服务器返回的json须包含：total，rows
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total", test.getTotal());
        map.put("rows", test.getRecords());
        return map;
    }

    /**
     * 新增扫描详情查询
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(ScanDetail scanDetail) {
        scanDetailService.insert(scanDetail);
        return SUCCESS_TIP;
    }

    /**
     * 删除扫描详情查询
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer scanDetailId) {
        scanDetailService.deleteById(scanDetailId);
        return SUCCESS_TIP;
    }

    /**
     * 修改扫描详情查询
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(ScanDetail scanDetail) {
        scanDetailService.updateById(scanDetail);
        return SUCCESS_TIP;
    }

    /**
     * 扫描详情查询详情
     */
    @RequestMapping(value = "/detail/{scanDetailId}")
    @ResponseBody
    public Object detail(@PathVariable("scanDetailId") Integer scanDetailId) {
        return scanDetailService.selectById(scanDetailId);
    }
}
