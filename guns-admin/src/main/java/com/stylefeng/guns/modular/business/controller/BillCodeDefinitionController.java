package com.stylefeng.guns.modular.business.controller;

import com.stylefeng.guns.core.base.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.beans.factory.annotation.Autowired;
import com.stylefeng.guns.core.log.LogObjectHolder;
import org.springframework.web.bind.annotation.RequestParam;
import com.stylefeng.guns.modular.system.model.BillCodeDefinition;
import com.stylefeng.guns.modular.business.service.IBillCodeDefinitionService;

/**
 * 格口配置信息控制器
 *
 * @author fengshuonan
 * @Date 2018-07-20 17:37:26
 */
@Controller
@RequestMapping("/billCodeDefinition")
public class BillCodeDefinitionController extends BaseController {

    private String PREFIX = "/business/billCodeDefinition/";

    @Autowired
    private IBillCodeDefinitionService billCodeDefinitionService;

    /**
     * 跳转到格口配置信息首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "billCodeDefinition.html";
    }

    /**
     * 跳转到添加格口配置信息
     */
    @RequestMapping("/billCodeDefinition_add")
    public String billCodeDefinitionAdd() {
        return PREFIX + "billCodeDefinition_add.html";
    }

    /**
     * 跳转到修改格口配置信息
     */
    @RequestMapping("/billCodeDefinition_update/{billCodeDefinitionId}")
    public String billCodeDefinitionUpdate(@PathVariable Integer billCodeDefinitionId, Model model) {
        BillCodeDefinition billCodeDefinition = billCodeDefinitionService.selectById(billCodeDefinitionId);
        model.addAttribute("item",billCodeDefinition);
        LogObjectHolder.me().set(billCodeDefinition);
        return PREFIX + "billCodeDefinition_edit.html";
    }

    /**
     * 获取格口配置信息列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return billCodeDefinitionService.selectList(null);
    }

    /**
     * 新增格口配置信息
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(BillCodeDefinition billCodeDefinition) {
        billCodeDefinitionService.insert(billCodeDefinition);
        return SUCCESS_TIP;
    }

    /**
     * 删除格口配置信息
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer billCodeDefinitionId) {
        billCodeDefinitionService.deleteById(billCodeDefinitionId);
        return SUCCESS_TIP;
    }

    /**
     * 修改格口配置信息
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(BillCodeDefinition billCodeDefinition) {
        billCodeDefinitionService.updateById(billCodeDefinition);
        return SUCCESS_TIP;
    }

    /**
     * 格口配置信息详情
     */
    @RequestMapping(value = "/detail/{billCodeDefinitionId}")
    @ResponseBody
    public Object detail(@PathVariable("billCodeDefinitionId") Integer billCodeDefinitionId) {
        return billCodeDefinitionService.selectById(billCodeDefinitionId);
    }
}
