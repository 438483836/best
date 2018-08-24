/**
 * 端口同步配置管理初始化
 */
var PortSync = {
    id: "PortSyncTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
PortSync.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '', field: 'id', visible: true, align: 'center', valign: 'middle'},
            {title: '所属分拨', field: 'belongSiteName', visible: true, align: 'center', valign: 'middle'},
            {title: '流水线号', field: 'pipeline', visible: true, align: 'center', valign: 'middle'},
            {title: '目的站点', field: 'destSiteName', visible: true, align: 'center', valign: 'middle'},
            {title: '目的站点编码', field: 'destSiteCode', visible: true, align: 'center', valign: 'middle'},
            {title: '站点分拣编码', field: 'destSortingCode', visible: true, align: 'center', valign: 'middle'},
            {title: '分拣口编号', field: 'sortPortCode', visible: true, align: 'center', valign: 'middle'},
            {title: '分拣模式', field: 'sortMode', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
PortSync.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        PortSync.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加端口同步配置
 */
PortSync.openAddPortSync = function () {
    var index = layer.open({
        type: 2,
        title: '添加端口同步配置',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/portSync/portSync_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看端口同步配置详情
 */
PortSync.openPortSyncDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '端口同步配置详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/portSync/portSync_update/' + PortSync.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除端口同步配置
 */
PortSync.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/portSync/delete", function (data) {
            Feng.success("删除成功!");
            PortSync.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("portSyncId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询端口同步配置列表
 */
PortSync.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    PortSync.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = PortSync.initColumn();
    var table = new BSTable(PortSync.id, "/portSync/list", defaultColunms);
    table.setPaginationType("clinet");
    PortSync.table = table.init();
});
