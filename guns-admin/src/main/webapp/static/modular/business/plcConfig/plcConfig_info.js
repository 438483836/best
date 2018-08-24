/**
 * 初始化PLC信息配置详情对话框
 */
var PlcConfigInfoDlg = {
    plcConfigInfoData : {}
};

/**
 * 清除数据
 */
PlcConfigInfoDlg.clearData = function() {
    this.plcConfigInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
PlcConfigInfoDlg.set = function(key, val) {
    this.plcConfigInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
PlcConfigInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
PlcConfigInfoDlg.close = function() {
    parent.layer.close(window.parent.PlcConfig.layerIndex);
}

/**
 * 收集数据
 */
PlcConfigInfoDlg.collectData = function() {
    this
    .set('id')
    .set('ip')
    .set('port')
    .set('name')
    .set('remark')
    .set('type')
    .set('typeName')
    .set('isUsed')
    .set('saveDatetime')
    .set('saveUser');
}

/**
 * 提交添加
 */
PlcConfigInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/plcConfig/add", function(data){
        Feng.success("添加成功!");
        window.parent.PlcConfig.table.refresh();
        PlcConfigInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.plcConfigInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
PlcConfigInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/plcConfig/update", function(data){
        Feng.success("修改成功!");
        window.parent.PlcConfig.table.refresh();
        PlcConfigInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.plcConfigInfoData);
    ajax.start();
}

$(function() {

});
