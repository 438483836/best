/**
 * 扫描详情查询管理初始化
 */
var ScanDetail = {
    id: "ScanDetailTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
ScanDetail.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '序列', field: 'row',formatter: function (value, row, index) {return index+1;}, visible: true, align: 'center', valign: 'middle'},
            {title: '主键', field: 'id', visible: false, align: 'center', valign: 'middle'},
            {title: '唯一分拣id', field: 'sortId', visible: false, align: 'center', valign: 'middle'},
            {title: '小车编号', field: 'trayCode', visible: true, align: 'center', valign: 'middle'},
            {title: '扫描时间', field: 'scanDatetime', visible: true, align: 'center', valign: 'middle'},
            {title: '条码', field: 'barcode', visible: true, align: 'center', valign: 'middle'},
            {title: '发送时间', field: 'sendDatetime', visible: false, align: 'center', valign: 'middle'},
            {title: '扫描仪编号', field: 'scanNo', visible: false, align: 'center', valign: 'middle'},
            {title: '百世推送格口', field: 'lchute', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
ScanDetail.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        ScanDetail.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加扫描详情查询
 */
ScanDetail.openAddScanDetail = function () {
    var index = layer.open({
        type: 2,
        title: '添加扫描详情查询',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/scanDetail/scanDetail_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看扫描详情查询详情
 */
ScanDetail.openScanDetailDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '扫描详情查询详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/scanDetail/scanDetail_update/' + ScanDetail.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除扫描详情查询
 */
ScanDetail.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/scanDetail/delete", function (data) {
            Feng.success("删除成功!");
            ScanDetail.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("scanDetailId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询扫描详情查询列表
 */
ScanDetail.search = function () {
    var queryData = {};
    queryData['barcode'] = $("#barcode").val();
    queryData['beginTime'] = $("#beginTime").val();
    queryData['endTime'] = $("#endTime").val();
    ScanDetail.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = ScanDetail.initColumn();
    var table = new BSTable(ScanDetail.id, "/scanDetail/list", defaultColunms);
    table.setPaginationType("server");
    laydate.render({
      elem: '#beginTime'
       ,value:new Date(new Date().getTime() - 1 * 60 * 60 * 1000*24)
      ,type: 'datetime'
    });
     laydate.render({
                elem: '#endTime'
                ,value: new Date()
                ,type: 'datetime'
    });
    table.setQueryParams({barcode: $("#barcode").val(), beginTime: $("#beginTime").val(), endTime: $("#endTime").val()});

    ScanDetail.table = table.init();

});
