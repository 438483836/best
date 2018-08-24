/**
 * 初始化下件信息查询详情对话框
 */
var YddSealmailInfoDlg = {
    yddSealmailInfoData : {}
};

/**
 * 清除数据
 */
YddSealmailInfoDlg.clearData = function() {
    this.yddSealmailInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
YddSealmailInfoDlg.set = function(key, val) {
    this.yddSealmailInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
YddSealmailInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
YddSealmailInfoDlg.close = function() {
    parent.layer.close(window.parent.YddSealmail.layerIndex);
}

/**
 * 收集数据
 */
YddSealmailInfoDlg.collectData = function() {
    this
    .set('id')
    .set('bagid')
    .set('barcode')
    .set('mailid')
    .set('lchute')
    .set('chute')
    .set('sorttime')
    .set('inductionid')
    .set('weight')
    .set('length')
    .set('width')
    .set('height')
    .set('volume')
    .set('dropflag')
    .set('checkflag')
    .set('succesydlag')
    .set('overflowid')
    .set('devicecode')
    .set('printflag')
    .set('printtime')
    .set('indtime')
    .set('indmode')
    .set('obrid')
    .set('scantime')
    .set('trayid')
    .set('delflag')
    .set('ocrflag')
    .set('rejectflag')
    .set('sendflag')
    .set('sendtime');
}

/**
 * 提交添加
 */
YddSealmailInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/yddSealmail/add", function(data){
        Feng.success("添加成功!");
        window.parent.YddSealmail.table.refresh();
        YddSealmailInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.yddSealmailInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
YddSealmailInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/yddSealmail/update", function(data){
        Feng.success("修改成功!");
        window.parent.YddSealmail.table.refresh();
        YddSealmailInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.yddSealmailInfoData);
    ajax.start();
}

$(function() {

});
