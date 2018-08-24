package com.stylefeng.guns.cache;

import com.stylefeng.guns.modular.business.service.IBillCodeDefinitionService;
import com.stylefeng.guns.modular.system.model.BillCodeDefinition;
import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/** 缓存面单规则
 * Created by asus on 2017/8/10.
 */
@Service
public class BillRuleCache implements ApplicationContextAware {

    private static final Logger logger = LoggerFactory.getLogger(BillRuleCache.class);

    private static ApplicationContext applicationContext;

    private static List<BillCodeDefinition> billRuleCacheList=new ArrayList<BillCodeDefinition>();
    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        BillRuleCache.applicationContext = applicationContext;
        startService();
    }

    private void startService() {
        initCache();
    }

    public static void initCache()
    {
        billRuleCacheList.clear();
        IBillCodeDefinitionService iBillCodeDefinitionService = applicationContext.getBean(IBillCodeDefinitionService.class);
        List<BillCodeDefinition> portSyncList = iBillCodeDefinitionService.selectList(null);
        billRuleCacheList.addAll(portSyncList);
        logger.info("Start init success");
    }



    public static Set<String> matchBarCode(Set<String> codeLists)
    {
        Set<String> matchBarcode=new HashSet<>();
        if(CollectionUtils.isEmpty(codeLists))
        {
            logger.info("codeList is empty");
            return matchBarcode;
        }
        for(String code:codeLists)
        {
            for(BillCodeDefinition tbillCodeDefinition:billRuleCacheList)
            {
                if(tbillCodeDefinition.getTotalLength()==code.length())
                    if(code.indexOf(tbillCodeDefinition.getStartChars())>=0)
                    {
                        matchBarcode.add(code);
                    }
            }
        }
        return matchBarcode;
    }


}
