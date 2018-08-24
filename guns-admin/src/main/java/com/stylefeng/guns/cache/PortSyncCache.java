package com.stylefeng.guns.cache;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.mapper.SqlRunner;
import com.stylefeng.guns.core.util.ToolUtil;
import com.stylefeng.guns.modular.business.service.IPortSyncService;
import com.stylefeng.guns.modular.system.model.BillCodeDefinition;
import com.stylefeng.guns.modular.system.model.PortSync;
import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;

import java.util.*;

/** 缓存面单规则
 * Created by asus on 2017/8/10.
 */
@Service
public class PortSyncCache implements ApplicationContextAware {

    private static final Logger logger = LoggerFactory.getLogger(PortSyncCache.class);

    private static  ApplicationContext applicationContext;


    private static List<PortSync> currentportSyncList = new ArrayList<>();

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        PortSyncCache.applicationContext = applicationContext;
        startService();
    }

    private void startService() {
        initCache();
    }

    public static void initCache()
    {
        currentportSyncList.clear();
        IPortSyncService iPortSyncService = applicationContext.getBean(IPortSyncService.class);
        List<PortSync> portSyncList = iPortSyncService.selectList(null);
        currentportSyncList.addAll(portSyncList);
        logger.info("Start init success");
    }

    public static String getSortMode(){
        return currentportSyncList.get(0).getSortMode();
    }


    public static String matchPortSync(PortSync mode)
    {
        for(PortSync portSync:currentportSyncList)
        {
            //如果流水线号、分拣模式、格口一致，返回相应的站点分拣编码
            if(ToolUtil.equals(portSync.getSortPortCode(),mode.getSortPortCode())
                &&ToolUtil.equals(portSync.getSortMode(),mode.getSortMode())
                    &&ToolUtil.equals(portSync.getPipeline(),mode.getPipeline()))
                return portSync.getDestSortingCode();
        }
        logger.error("There is no matching destination code");
        return "";
    }


}
