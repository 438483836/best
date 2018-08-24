/**
 * 初始化端口同步配置详情对话框
 */
var PortSyncInfoDlg = {
    portSyncInfoData : {}
};

/**
 * 清除数据
 */
PortSyncInfoDlg.clearData = function() {
    this.portSyncInfoData = {};
};

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
PortSyncInfoDlg.set = function(key, val) {
    this.portSyncInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
};

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
PortSyncInfoDlg.get = function(key) {
    return $("#" + key).val();
};

/**
 * 关闭此对话框
 */
PortSyncInfoDlg.close = function() {
    parent.layer.close(window.parent.PortSync.layerIndex);
};

/**
 * 收集数据
 */
PortSyncInfoDlg.collectData = function() {
    this
    .set('id')
    .set('belongSiteName')
    .set('pipeline')
    .set('destSiteName')
    .set('destSiteCode')
    .set('destSortingCode')
    .set('sortPortCode')
    .set('sortMode');
};

/**
 * 提交添加
 */
PortSyncInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/portSync/add", function(data){
        Feng.success("添加成功!");
        window.parent.PortSync.table.refresh();
        PortSyncInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.portSyncInfoData);
    ajax.start();
};

/**
 * 提交修改
 */
PortSyncInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/portSync/update", function(data){
        Feng.success("修改成功!");
        window.parent.PortSync.table.refresh();
        PortSyncInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.portSyncInfoData);
    ajax.start();
};

$(function() {

});
