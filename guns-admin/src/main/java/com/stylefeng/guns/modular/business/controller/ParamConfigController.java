package com.stylefeng.guns.modular.business.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.core.util.ToolUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.beans.factory.annotation.Autowired;
import com.stylefeng.guns.core.log.LogObjectHolder;
import org.springframework.web.bind.annotation.RequestParam;
import com.stylefeng.guns.modular.system.model.ParamConfig;
import com.stylefeng.guns.modular.business.service.IParamConfigService;

/**
 * 参数配置控制器
 *
 * @author fengshuonan
 * @Date 2018-07-20 19:52:12
 */
@Controller
@RequestMapping("/paramConfig")
public class ParamConfigController extends BaseController {

    private String PREFIX = "/business/paramConfig/";

    @Autowired
    private IParamConfigService paramConfigService;

    /**
     * 跳转到参数配置首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "paramConfig.html";
    }

    /**
     * 跳转到添加参数配置
     */
    @RequestMapping("/paramConfig_add")
    public String paramConfigAdd() {
        return PREFIX + "paramConfig_add.html";
    }

    /**
     * 跳转到修改参数配置
     */
    @RequestMapping("/paramConfig_update/{paramConfigId}")
    public String paramConfigUpdate(@PathVariable Integer paramConfigId, Model model) {
        ParamConfig paramConfig = paramConfigService.selectById(paramConfigId);
        model.addAttribute("item",paramConfig);
        LogObjectHolder.me().set(paramConfig);
        return PREFIX + "paramConfig_edit.html";
    }

    /**
     * 获取参数配置列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        if (ToolUtil.isEmpty(condition)){
            return paramConfigService.selectList(null);
        }else {
            EntityWrapper<ParamConfig> wrapper = new EntityWrapper<>();
            wrapper.like("keyy","%"+condition+"%");
            return paramConfigService.selectList(wrapper);
        }

    }

    /**
     * 新增参数配置
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(ParamConfig paramConfig) {
        paramConfigService.insert(paramConfig);
        return SUCCESS_TIP;
    }

    /**
     * 删除参数配置
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer paramConfigId) {
        paramConfigService.deleteById(paramConfigId);
        return SUCCESS_TIP;
    }

    /**
     * 修改参数配置
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(ParamConfig paramConfig) {
        paramConfigService.updateById(paramConfig);
        return SUCCESS_TIP;
    }

    /**
     * 参数配置详情
     */
    @RequestMapping(value = "/detail/{paramConfigId}")
    @ResponseBody
    public Object detail(@PathVariable("paramConfigId") Integer paramConfigId) {
        return paramConfigService.selectById(paramConfigId);
    }
}
