/**
 * 下件信息查询管理初始化
 */
var YddSealmail = {
    id: "YddSealmailTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
YddSealmail.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '自动ID<seq>', field: 'id', visible: true, align: 'center', valign: 'middle'},
            {title: '清单ID', field: 'bagid', visible: true, align: 'center', valign: 'middle'},
            {title: '快件号码', field: 'barcode', visible: true, align: 'center', valign: 'middle'},
            {title: '快件ID', field: 'mailid', visible: true, align: 'center', valign: 'middle'},
            {title: '逻辑格口代码', field: 'lchute', visible: true, align: 'center', valign: 'middle'},
            {title: '物理格口代码', field: 'chute', visible: true, align: 'center', valign: 'middle'},
            {title: '落格时间', field: 'sorttime', visible: true, align: 'center', valign: 'middle'},
            {title: '供件台号', field: 'inductionid', visible: true, align: 'center', valign: 'middle'},
            {title: '称重重量', field: 'weight', visible: true, align: 'center', valign: 'middle'},
            {title: '长度', field: 'length', visible: true, align: 'center', valign: 'middle'},
            {title: '宽度', field: 'width', visible: true, align: 'center', valign: 'middle'},
            {title: '高度', field: 'height', visible: true, align: 'center', valign: 'middle'},
            {title: '体积', field: 'volume', visible: true, align: 'center', valign: 'middle'},
            {title: '落格标志', field: 'dropflag', visible: true, align: 'center', valign: 'middle'},
            {title: '留盘检测确认标志', field: 'checkflag', visible: true, align: 'center', valign: 'middle'},
            {title: '分拣成功与否标志', field: 'succesydlag', visible: true, align: 'center', valign: 'middle'},
            {title: '异常原因代码', field: 'overflowid', visible: true, align: 'center', valign: 'middle'},
            {title: '设备编码', field: 'devicecode', visible: true, align: 'center', valign: 'middle'},
            {title: '打印标志', field: 'printflag', visible: true, align: 'center', valign: 'middle'},
            {title: '请封时间', field: 'printtime', visible: true, align: 'center', valign: 'middle'},
            {title: '供件时间', field: 'indtime', visible: true, align: 'center', valign: 'middle'},
            {title: '供件模式', field: 'indmode', visible: true, align: 'center', valign: 'middle'},
            {title: 'OBR编号', field: 'obrid', visible: true, align: 'center', valign: 'middle'},
            {title: '扫描时间', field: 'scantime', visible: true, align: 'center', valign: 'middle'},
            {title: '托盘号', field: 'trayid', visible: true, align: 'center', valign: 'middle'},
            {title: '删除标志', field: 'delflag', visible: true, align: 'center', valign: 'middle'},
            {title: 'ADM处理标志', field: 'ocrflag', visible: true, align: 'center', valign: 'middle'},
            {title: 'OBR拒识标志', field: 'rejectflag', visible: true, align: 'center', valign: 'middle'},
            {title: '发送标志', field: 'sendflag', visible: true, align: 'center', valign: 'middle'},
            {title: '数据上传时间', field: 'sendtime', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
YddSealmail.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        YddSealmail.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加下件信息查询
 */
YddSealmail.openAddYddSealmail = function () {
    var index = layer.open({
        type: 2,
        title: '添加下件信息查询',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/yddSealmail/yddSealmail_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看下件信息查询详情
 */
YddSealmail.openYddSealmailDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '下件信息查询详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/yddSealmail/yddSealmail_update/' + YddSealmail.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除下件信息查询
 */
YddSealmail.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/yddSealmail/delete", function (data) {
            Feng.success("删除成功!");
            YddSealmail.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("yddSealmailId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询下件信息查询列表
 */
YddSealmail.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    YddSealmail.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = YddSealmail.initColumn();
    var table = new BSTable(YddSealmail.id, "/yddSealmail/list", defaultColunms);
    table.setPaginationType("client");
    YddSealmail.table = table.init();
});
