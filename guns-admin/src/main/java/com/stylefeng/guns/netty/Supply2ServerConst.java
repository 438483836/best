package com.stylefeng.guns.netty;

/**
 * created by hangyunjia
 */
public class Supply2ServerConst {

    //大华绑定端口
    public static final int CameraGetInfoPort = 9195;

    //PDA手持绑定端口
    public static final int PDAGetInfoPort = 9194;

    //每个显示器提示端口
    public static final int promptMessagePort = 9196;

    //每个显示器提示关闭端口
    public static final int promptMessageDisposePort = 9193;

    //刷新缓存端口
    public static final int refreshCachePort = 9199;

    //开关机
    public static final int requestMappingPort = 10004;

    //集包
    public static final int packagePort = 10002;

    //下件
    public static final int downSealMailPort = 10003;

    //供件台数量
    public static final int SupplyCount = 12;

    //托盘数量
    public static final int trayCount = 260;

    //格口数量

    public static final int chuteCount = 260;


    /**
     * 太原
     */
    public static final String bestExpressBillRuleURL = "http://192.168.17.18/GetBillCodeDefinition";

    public static final String bestExpressStartURL = "http://192.168.17.18/pipeline/v2/start_stop";

    public static final String bestExpressFenJianURL = "http://192.168.17.18/wcs/v2/sorting_info";

    public static final String bestExpressSortModeURL = "http://192.168.17.18/pipeline/v2/sort_mode";

    public static final String bestExpressPortURL = "http://192.168.17.18/wcs/v2/port_conf";




    public static final String bestExpressPutResultURL = "http://192.168.17.18/wcs/v2/sorting_result";


    public static final String bestExpressIp = "192.168.17.18";

    public static final int bestExpressPort = 80;

    public static long timeDiff;

}
