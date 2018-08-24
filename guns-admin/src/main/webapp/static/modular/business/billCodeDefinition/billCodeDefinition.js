/**
 * 格口配置信息管理初始化
 */
var BillCodeDefinition = {
    id: "BillCodeDefinitionTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
BillCodeDefinition.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '序列', field: 'row',formatter: function (value, row, index) {return index+1;}, visible: true, align: 'center', valign: 'middle'},
            {title: '主键', field: 'id', visible: false, align: 'center', valign: 'middle'},
            {title: '面单种类编码', field: 'code', visible: true, align: 'center', valign: 'middle'},
            {title: '面单种类名称', field: 'name', visible: true, align: 'center', valign: 'middle'},
            {title: '是否有明细', field: 'isList', visible: true, align: 'center', valign: 'middle'},
            {title: '单位数目', field: 'unitNumber', visible: true, align: 'center', valign: 'middle'},
            {title: '开始字符', field: 'startChars', visible: true, align: 'center', valign: 'middle'},
            {title: '开始字符之后的字长度', field: 'afterLength', visible: true, align: 'center', valign: 'middle'},
            {title: '面单字符总长度', field: 'totalLength', visible: true, align: 'center', valign: 'middle'},
            {title: '面单类型 id', field: 'billTypeId', visible: true, align: 'center', valign: 'middle'},
            {title: '版本号', field: 'syncVersion', visible: true, align: 'center', valign: 'middle'},
            {title: '面单类型名称', field: 'billTypeName', visible: true, align: 'center', valign: 'middle'},
            {title: '是否是电子面单', field: 'isEBill', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
BillCodeDefinition.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        BillCodeDefinition.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加格口配置信息
 */
BillCodeDefinition.openAddBillCodeDefinition = function () {
    var index = layer.open({
        type: 2,
        title: '添加格口配置信息',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/billCodeDefinition/billCodeDefinition_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看格口配置信息详情
 */
BillCodeDefinition.openBillCodeDefinitionDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '格口配置信息详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/billCodeDefinition/billCodeDefinition_update/' + BillCodeDefinition.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除格口配置信息
 */
BillCodeDefinition.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/billCodeDefinition/delete", function (data) {
            Feng.success("删除成功!");
            BillCodeDefinition.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("billCodeDefinitionId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询格口配置信息列表
 */
BillCodeDefinition.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    BillCodeDefinition.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = BillCodeDefinition.initColumn();
    var table = new BSTable(BillCodeDefinition.id, "/billCodeDefinition/list", defaultColunms);
    table.setPaginationType("client");
    BillCodeDefinition.table = table.init();
});
