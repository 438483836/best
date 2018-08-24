/**
 * 参数配置管理初始化
 */
var ParamConfig = {
    id: "ParamConfigTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
ParamConfig.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '序列', field: 'row',formatter: function (value, row, index) {return index+1;}, visible: true, align: 'center', valign: 'middle'},
            {title: '主键<seq>', field: 'id', visible: false, align: 'center', valign: 'middle'},
            {title: '关键字', field: 'keyy', visible: true, align: 'center', valign: 'middle'},
            {title: '值', field: 'value', visible: true, align: 'center', valign: 'middle'},
            {title: '名称', field: 'name', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
ParamConfig.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        ParamConfig.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加参数配置
 */
ParamConfig.openAddParamConfig = function () {
    var index = layer.open({
        type: 2,
        title: '添加参数配置',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/paramConfig/paramConfig_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看参数配置详情
 */
ParamConfig.openParamConfigDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '参数配置详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/paramConfig/paramConfig_update/' + ParamConfig.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除参数配置
 */
ParamConfig.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/paramConfig/delete", function (data) {
            Feng.success("删除成功!");
            ParamConfig.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("paramConfigId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询参数配置列表
 */
ParamConfig.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    ParamConfig.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = ParamConfig.initColumn();
    var table = new BSTable(ParamConfig.id, "/paramConfig/list", defaultColunms);
    table.setPaginationType("client");
    ParamConfig.table = table.init();
});
