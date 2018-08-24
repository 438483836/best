/**
 * 初始化格口配置信息详情对话框
 */
var BillCodeDefinitionInfoDlg = {
    billCodeDefinitionInfoData : {}
};

/**
 * 清除数据
 */
BillCodeDefinitionInfoDlg.clearData = function() {
    this.billCodeDefinitionInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
BillCodeDefinitionInfoDlg.set = function(key, val) {
    this.billCodeDefinitionInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
BillCodeDefinitionInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
BillCodeDefinitionInfoDlg.close = function() {
    parent.layer.close(window.parent.BillCodeDefinition.layerIndex);
}

/**
 * 收集数据
 */
BillCodeDefinitionInfoDlg.collectData = function() {
    this
    .set('id')
    .set('code')
    .set('name')
    .set('isList')
    .set('unitNumber')
    .set('startChars')
    .set('afterLength')
    .set('totalLength')
    .set('billTypeId')
    .set('syncVersion')
    .set('billTypeName')
    .set('isEBill');
}

/**
 * 提交添加
 */
BillCodeDefinitionInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/billCodeDefinition/add", function(data){
        Feng.success("添加成功!");
        window.parent.BillCodeDefinition.table.refresh();
        BillCodeDefinitionInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.billCodeDefinitionInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
BillCodeDefinitionInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/billCodeDefinition/update", function(data){
        Feng.success("修改成功!");
        window.parent.BillCodeDefinition.table.refresh();
        BillCodeDefinitionInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.billCodeDefinitionInfoData);
    ajax.start();
}

$(function() {

});
