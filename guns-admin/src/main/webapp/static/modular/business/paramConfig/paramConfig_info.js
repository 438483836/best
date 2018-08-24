/**
 * 初始化参数配置详情对话框
 */
var ParamConfigInfoDlg = {
    paramConfigInfoData : {}
};

/**
 * 清除数据
 */
ParamConfigInfoDlg.clearData = function() {
    this.paramConfigInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
ParamConfigInfoDlg.set = function(key, val) {
    this.paramConfigInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
ParamConfigInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
ParamConfigInfoDlg.close = function() {
    parent.layer.close(window.parent.ParamConfig.layerIndex);
}

/**
 * 收集数据
 */
ParamConfigInfoDlg.collectData = function() {
    this
    .set('id')
    .set('keyy')
    .set('value')
    .set('name');
}

/**
 * 提交添加
 */
ParamConfigInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/paramConfig/add", function(data){
        Feng.success("添加成功!");
        window.parent.ParamConfig.table.refresh();
        ParamConfigInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.paramConfigInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
ParamConfigInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/paramConfig/update", function(data){
        Feng.success("修改成功!");
        window.parent.ParamConfig.table.refresh();
        ParamConfigInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.paramConfigInfoData);
    ajax.start();
}

$(function() {

});
