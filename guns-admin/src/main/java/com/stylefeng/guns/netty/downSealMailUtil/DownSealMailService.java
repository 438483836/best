package com.stylefeng.guns.netty.downSealMailUtil;

import com.stylefeng.guns.netty.Supply2ServerConst;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;

/**
 * 主要处理下包和收容格口的通信
 * Created by Belo Lee on 2016/10/2.
 */

@Service
public class DownSealMailService implements ApplicationContextAware {

    private ApplicationContext applicationContext;

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
        this.startService(Supply2ServerConst.downSealMailPort);
    }

    private void startService(int downSealMailPort) {
        DownSealMailServer downSealMailServer = new DownSealMailServer(this.applicationContext, downSealMailPort);
        try {
            Thread thread = new Thread(downSealMailServer);
            thread.start();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
