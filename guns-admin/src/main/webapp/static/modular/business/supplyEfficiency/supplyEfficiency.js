
/**
 * 查询下工件台效率统计图
 */
$('#btn_submit').click(function(){
    var inductionid = $("#inductionid").val();
    var beginTime = $("#beginTime").val();
    var endTime = $("#endTime").val();

    var myChart = echarts.init(document.getElementById('psLine'));
    myChart.clear();
    myChart.showLoading({text: '请稍等，正在加载...'});

    $.ajax({
        //提交数据的类型 POST GET
        type:"POST",
        //提交的网址
        url:"/supplyEfficiency/view",
        //提交的数据
        data:{inductionid:inductionid,beginTime:beginTime,endTime:endTime},
        //返回数据的格式
        datatype: "json",
        //在请求之前调用的函数
        beforeSend:function(){},
        //成功返回之后调用的函数
        success:function(data){
            console.log(myChart);
            console.log(data);
            var option = $.parseJSON(data);
            myChart.setOption(option, true);

        }   ,
        //调用执行后调用的函数
        complete: function(XMLHttpRequest, textStatus){
            myChart.hideLoading();
        },
        //调用出错执行的函数
        error: function(){
            myChart.hideLoading();
        }
    });
});

$(function () {
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


    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('psLine'));
    var beginTime = $("#beginTime").val();
    var endTime = $("#endTime").val();
    myChart.clear();
    myChart.showLoading({text: '请稍等，正在加载...'});
    $.ajax({
        //提交数据的类型 POST GET
        type:"POST",
        //提交的网址
        url:"/supplyEfficiency/view",
        //提交的数据
        data:{beginTime:beginTime,endTime:endTime},
        //返回数据的格式
        datatype: "json",
        //在请求之前调用的函数
        beforeSend:function(){},
        //成功返回之后调用的函数
        success:function(data){
            console.log(myChart);
            console.log(data);
            var option = $.parseJSON(data);
            myChart.setOption(option, true);

        }   ,
        //调用执行后调用的函数
        complete: function(XMLHttpRequest, textStatus){
            myChart.hideLoading();
        },
        //调用出错执行的函数
        error: function(){
            myChart.hideLoading();
        }
    });

    // var option={
    //     "calculable":false,
    //     "title":{
    //         "text":"格口吞吐量统计"
    //     },
    //     "toolbox":{
    //         "feature":{
    //             "mark":{
    //                 "show":true,
    //                 "title":{
    //                     "markUndo":"删除辅助线",
    //                     "markClear":"清空辅助线",
    //                     "mark":"辅助线开关"
    //                 },
    //                 "lineStyle":{
    //                     "color":"#1e90ff",
    //                     "type":"dashed",
    //                     "width":2
    //                 }
    //             },
    //             "dataView":{
    //                 "show":true,
    //                 "title":"数据视图",
    //                 "readOnly":false,
    //                 "lang":["数据视图",
    //                     "关闭",
    //                     "刷新"
    //                 ]
    //             },
    //             "magicType":{
    //                 "show":true,
    //                 "title":{
    //                     "bar":"柱形图切换",
    //                     "stack":"堆积",
    //                     "tiled":"平铺",
    //                     "line":"折线图切换"
    //                 },
    //                 "type":[
    //                     "line",
    //                     "bar",
    //                     "pie"
    //                 ]
    //             },
    //             "restore":{
    //                 "show":true,
    //                 "title":"还原"
    //             },
    //             "saveAsImage":{
    //                 "show":true,
    //                 "title":"保存为图片",
    //                 "type":"png",
    //                 "lang":["点击保存"]
    //             },
    //             "dataZoom":{
    //                 "show":true,
    //                 "title":{
    //                     "dataZoom":"区域缩放",
    //                     "dataZoomReset":"区域缩放后退"
    //                 }
    //             }
    //         },
    //         "show":true
    //     },
    //     "tooltip":{
    //         "trigger":"axis"
    //     },
    //     "legend":{},
    //     "xAxis":[
    //         {
    //             "type":"category",
    //             "data":["1号格口","2号格口"]
    //         }
    //     ],
    //     "yAxis":[{"type":"value"}],
    //     "series":[
    //         {
    //             "barWidth":10,
    //             "name":"吞吐量",
    //             "type":"bar",
    //             "markPoint":{
    //                 "data":[
    //                     {
    //                         "name":"最大值",
    //                         "type":"max"
    //                     },
    //                     {
    //                         "name":"最小值",
    //                         "type":"min"}
    //                 ]
    //             },
    //             "data":[300,400]
    //         }
    //     ]
    // }
    //
    // myChart.setOption(option, true);





});
window.onresize=function(){
    var myChart = echarts.init(document.getElementById('psLine'));
    setTimeout(function(){
        myChart.resize();
    }, 50)
};

