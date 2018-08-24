package com.stylefeng.guns.modular.business.controller;

import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.core.log.LogObjectHolder;
import com.stylefeng.guns.modular.business.service.IPortSyncService;
import com.stylefeng.guns.modular.system.model.PortSync;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 端口同步配置控制器
 *
 * @author fengshuonan
 * @Date 2018-08-02 12:50:53
 */
@Controller
@RequestMapping("/portSync")
public class PortSyncController extends BaseController {

    private String PREFIX = "/business/portSync/";

    @Autowired
    private IPortSyncService portSyncService;

    /**
     * 跳转到端口同步配置首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "portSync.html";
    }

    /**
     * 跳转到添加端口同步配置
     */
    @RequestMapping("/portSync_add")
    public String portSyncAdd() {
        return PREFIX + "portSync_add.html";
    }

    /**
     * 跳转到修改端口同步配置
     */
    @RequestMapping("/portSync_update/{portSyncId}")
    public String portSyncUpdate(@PathVariable Integer portSyncId, Model model) {
        PortSync portSync = portSyncService.selectById(portSyncId);
        model.addAttribute("item",portSync);
        LogObjectHolder.me().set(portSync);
        return PREFIX + "portSync_edit.html";
    }

    /**
     * 获取端口同步配置列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition, HttpServletRequest request) {
        List lists=portSyncService.selectList(null);
        return lists;
    }

    /**
     * 新增端口同步配置
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(PortSync portSync) {
        portSyncService.insert(portSync);
        return SUCCESS_TIP;
    }

    /**
     * 删除端口同步配置
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer portSyncId) {
        portSyncService.deleteById(portSyncId);
        return SUCCESS_TIP;
    }

    /**
     * 修改端口同步配置
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(PortSync portSync) {
        portSyncService.updateById(portSync);
        return SUCCESS_TIP;
    }

    /**
     * 端口同步配置详情
     */
    @RequestMapping(value = "/detail/{portSyncId}")
    @ResponseBody
    public Object detail(@PathVariable("portSyncId") Integer portSyncId) {
        return portSyncService.selectById(portSyncId);
    }
}
