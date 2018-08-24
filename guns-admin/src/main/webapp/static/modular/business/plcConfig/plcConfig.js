/**
 * PLC信息配置管理初始化
 */
var PlcConfig = {
    id: "PlcConfigTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
PlcConfig.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '序列', field: 'row',formatter: function (value, row, index) {return index+1;}, visible: true, align: 'center', valign: 'middle'},
            {title: '主键', field: 'id', visible: false, align: 'center', valign: 'middle'},
            {title: 'IP', field: 'ip', visible: true, align: 'center', valign: 'middle'},
            {title: '端口', field: 'port', visible: true, align: 'center', valign: 'middle'},
            {title: '名称', field: 'name', visible: true, align: 'center', valign: 'middle'},
            {title: '备注', field: 'remark', visible: true, align: 'center', valign: 'middle'},
            {title: '类型', field: 'type', visible: true, align: 'center', valign: 'middle'},
            {title: '类型名称', field: 'typeName', visible: true, align: 'center', valign: 'middle'},
            {title: '是否启用', field: 'isUsed', visible: true, align: 'center', valign: 'middle'},
            {title: '保存时间', field: 'saveDatetime', visible: true, align: 'center', valign: 'middle'},
            {title: '修改人员', field: 'saveUser', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
PlcConfig.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        PlcConfig.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加PLC信息配置
 */
PlcConfig.openAddPlcConfig = function () {
    var index = layer.open({
        type: 2,
        title: '添加PLC信息配置',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/plcConfig/plcConfig_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看PLC信息配置详情
 */
PlcConfig.openPlcConfigDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: 'PLC信息配置详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/plcConfig/plcConfig_update/' + PlcConfig.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除PLC信息配置
 */
PlcConfig.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/plcConfig/delete", function (data) {
            Feng.success("删除成功!");
            PlcConfig.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("plcConfigId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询PLC信息配置列表
 */
PlcConfig.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    PlcConfig.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = PlcConfig.initColumn();
    var table = new BSTable(PlcConfig.id, "/plcConfig/list", defaultColunms);
    table.setPaginationType("client");
    PlcConfig.table = table.init();
});
