
/**
 * 查询下件信息查询列表
 */
$('#btn_submit').click(function(){
    var beginTime = $("#beginTime").val();
    var endTime = $("#endTime").val();

    var myChart = echarts.init(document.getElementById('psLine'));
    myChart.clear();
    myChart.showLoading({text: '请稍等，正在加载...'});

    $.ajax({
        //提交数据的类型 POST GET
        type:"POST",
        //提交的网址
        url:"/sortCounts/view",
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
    // $.getJSON('/throughput/view',queryData, function (data) {
    //     console.log(myChart);
    //     console.log(data);
    //     var option = $.parseJSON(data);
    //     myChart.setOption(option, true);
    //     myChart.hideLoading();
    // });
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
        url:"/sortCounts/view",
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



});
window.onresize=function(){
    var myChart = echarts.init(document.getElementById('psLine'));
    setTimeout(function(){
        myChart.resize();
    }, 50)
};
