/**
 * 初始化扫描详情查询详情对话框
 */
var ScanDetailInfoDlg = {
    scanDetailInfoData : {}
};

/**
 * 清除数据
 */
ScanDetailInfoDlg.clearData = function() {
    this.scanDetailInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
ScanDetailInfoDlg.set = function(key, val) {
    this.scanDetailInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
ScanDetailInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
ScanDetailInfoDlg.close = function() {
    parent.layer.close(window.parent.ScanDetail.layerIndex);
}

/**
 * 收集数据
 */
ScanDetailInfoDlg.collectData = function() {
    this
    .set('id')
    .set('sortId')
    .set('trayCode')
    .set('scanDatetime')
    .set('imgId')
    .set('barcode')
    .set('sendDatetime')
    .set('scanNo')
    .set('scanName')
    .set('connDetailId')
    .set('lchute')
    .set('weight');
}

/**
 * 提交添加
 */
ScanDetailInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/scanDetail/add", function(data){
        Feng.success("添加成功!");
        window.parent.ScanDetail.table.refresh();
        ScanDetailInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.scanDetailInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
ScanDetailInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/scanDetail/update", function(data){
        Feng.success("修改成功!");
        window.parent.ScanDetail.table.refresh();
        ScanDetailInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.scanDetailInfoData);
    ajax.start();
}

$(function() {

});
