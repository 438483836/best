package com.stylefeng.guns.modular.business.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.abel533.echarts.Option;
import com.github.abel533.echarts.axis.CategoryAxis;
import com.github.abel533.echarts.axis.ValueAxis;
import com.github.abel533.echarts.code.*;
import com.github.abel533.echarts.data.PieData;
import com.github.abel533.echarts.data.PointData;
import com.github.abel533.echarts.feature.MagicType;
import com.github.abel533.echarts.series.Bar;
import com.github.abel533.echarts.series.Pie;
import com.google.gson.Gson;
import com.stylefeng.guns.cache.ParamConigCache;
import com.stylefeng.guns.core.util.DateUtil;
import com.stylefeng.guns.core.util.ToolUtil;
import com.stylefeng.guns.modular.business.service.IYddSealmailService;
import com.stylefeng.guns.modular.system.dao.YddSealmailMapper;
import com.stylefeng.guns.modular.system.model.YddSealmail;
import com.stylefeng.guns.netty.Supply2ServerConst;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * 下件信息表 服务实现类
 * </p>
 *
 * @author stylefeng
 * @since 2018-07-22
 */
@Service
public class YddSealmailServiceImpl extends ServiceImpl<YddSealmailMapper, YddSealmail> implements IYddSealmailService {

    @Autowired YddSealmailMapper mapper;
    @Override
    public List<YddSealmail> getYddSealmails(String barcode,String chute, String beginTime, String endTime) {
        if(ToolUtil.isNotEmpty(chute)){
            if (chute.length()<3){
                for (int i=chute.length();i<3;i++){
                    chute = "0"+chute;
                }
            }
        }

        return mapper.getYddSealmails(barcode,chute,beginTime,endTime);
    }

    @Transactional
    @Override
    public String getSupplyEfficiency(String inductionid, String beginTime, String endTime) {
        List<Integer> countList = new ArrayList<>();
        List<String> supplyList = new ArrayList<>();
        int count;
        if (ToolUtil.isEmpty(inductionid)){
            for (int i = 1; i<= Supply2ServerConst.SupplyCount; i++){
                String istr = String.valueOf(i);
                count = mapper.getSupplyEfficiency(istr,beginTime,endTime);

                countList.add(count);
                supplyList.add(istr+"号");
            }
        }else {
            count = mapper.getSupplyEfficiency(inductionid,beginTime,endTime);
            countList.add(count);
            supplyList.add(inductionid+"号");
        }
        Option option = new Option();
        option.title().text("供件台效率统计");
        option.toolbox().show(true).feature(Tool.mark, Tool.dataView, new MagicType(Magic.line, Magic.bar, Magic.pie).show(true), Tool.restore, Tool.saveAsImage,Tool.dataZoom);
        //设置提示框
        option.tooltip().trigger(Trigger.axis);
        //是否设置拖拽计算
        option.calculable(true);
        option.legend();
        //设置x
        option.xAxis(new CategoryAxis().data(supplyList.toArray()));
        option.yAxis(new ValueAxis());
        //设置Bar
        option.setCalculable(false);
        Bar bar = new Bar("分拣量");
        bar.barWidth(10);
        bar.getItemStyle();
        bar.data(countList.toArray());
        option.series(bar);
        bar.markPoint().data(new PointData().type(MarkType.max).name("最大值"), new PointData().type(MarkType.min).name("最小值"));
        //bar.markLine().data(new PointData().type(MarkType.average).name("平均值"));

        Gson gson = new Gson();
        String json = gson.toJson(option);
        return json;
    }

    @Transactional
    @Override
    public String getThroughputs(String chute, String beginTime, String endTime) {

        List<Integer> countList = new ArrayList<>();
        List<String> chuteList = new ArrayList<>();
        int count;
        if (ToolUtil.isEmpty(chute)){
            for (int i=0; i<Supply2ServerConst.chuteCount;i++){
                String istr = String.valueOf(i+1);
                if (istr.length()<3){
                    for (int j=istr.length();j<3;j++){
                        istr = "0"+istr;
                    }
                }
                count = mapper.getThroughputs(istr,beginTime,endTime);

                countList.add(count);
                chuteList.add(istr);
            }
        }else {
            if (chute.length()<3){
                for (int i=chute.length();i<3;i++){
                    chute = "0"+chute;
                }
            }
            count = mapper.getThroughputs(chute,beginTime,endTime);
            countList.add(count);
            chuteList.add(chute);
        }

        Option option = new Option();
        option.title().text("格口吞吐量统计");
        option.toolbox().show(true).feature(Tool.mark, Tool.dataView, new MagicType(Magic.line, Magic.bar, Magic.pie).show(true), Tool.restore, Tool.saveAsImage,Tool.dataZoom);
        //设置提示框
        option.tooltip().trigger(Trigger.axis);
        //是否设置拖拽计算
        option.calculable(true);
        option.legend();
        //设置x
        option.xAxis(new CategoryAxis().data(chuteList.toArray()));
        option.yAxis(new ValueAxis());
        //设置Bar
        option.setCalculable(false);
        Bar bar = new Bar("吞吐量");
        bar.barWidth(10);
        bar.getItemStyle();
        bar.data(countList.toArray());
        option.series(bar);
        bar.markPoint().data(new PointData().type(MarkType.max).name("最大值"), new PointData().type(MarkType.min).name("最小值"));
        //bar.markLine().data(new PointData().type(MarkType.average).name("平均值"));

        Gson gson = new Gson();
        String json = gson.toJson(option);
        return json;

    }

    @Transactional
    @Override
    public String getSortCounts(String beginTime, String endTime) {

        EntityWrapper<YddSealmail> wrapper = new EntityWrapper<>();
        if (ToolUtil.isNotEmpty(beginTime)){
            wrapper.ge("sorttime",beginTime);//大于等于
        }
        if (ToolUtil.isNotEmpty(endTime)){
            wrapper.le("sorttime",endTime);//小于等于
        }

        int count_auto_normal = getAutoNormalSortCounts(beginTime,endTime);
        int count_buma_normal = getBumaNormalSortCounts(beginTime,endTime);
        int count_exception_best = getExceptionByBestSortCounts(beginTime,endTime);
        int count_exception_timeout = getTimeoutExceptionSortCounts(beginTime,endTime);
        int count_exception_nobarcode = getNoBarcodeExceptionSortCounts(beginTime,endTime);

        Option option = new Option();
        //时间轴
        //timeline变态的地方在于多个Option
        option.title().text("分拣统计");

        option.legend().data("暴力分拣", "人工补码", "百世推送异常口","分拣超时","无条码").setX("left");
        option.legend().setOrient(Orient.vertical);
        option.legend().setY("45");
        option.toolbox().
                show(true).feature(Tool.saveAsImage);
        option.tooltip().trigger(Trigger.item).formatter("{a} <br/>{b} : {c} ({d}%)");
        Pie pie = new Pie();
        List<PieData> pieDataList = new ArrayList<PieData>();
        pieDataList.add(new PieData("暴力分拣", count_auto_normal));
        pieDataList.add(new PieData("人工补码", count_buma_normal));
        pieDataList.add(new PieData("百世推送异常口", count_exception_best));
        pieDataList.add(new PieData("分拣超时", count_exception_timeout));
        pieDataList.add(new PieData("无条码", count_exception_nobarcode));
        int size=pieDataList.size();
        PieData[] pieArray = pieDataList.toArray(new PieData[size]);
        pie.data(pieArray);
        option.series(pie);
        Gson gson = new Gson();
        String json = gson.toJson(option);
        return json;
    }

    @Override
    public Integer getAutoNormalSortCounts(String beginTime, String endTime) {
        EntityWrapper<YddSealmail> wrapper = new EntityWrapper<>();
        if (ToolUtil.isNotEmpty(beginTime)){
            wrapper.ge("sorttime",beginTime);//大于等于
        }
        if (ToolUtil.isNotEmpty(endTime)){
            wrapper.le("sorttime",endTime);//小于等于
        }
        wrapper.notIn("chute", ParamConigCache.getExceptionChute());
        wrapper.eq("devicecode","1");
        return this.selectCount(wrapper);
    }

    @Override
    public Integer getBumaNormalSortCounts(String beginTime, String endTime) {
        EntityWrapper<YddSealmail> wrapper = new EntityWrapper<>();
        if (ToolUtil.isNotEmpty(beginTime)){
            wrapper.ge("sorttime",beginTime);//大于等于
        }
        if (ToolUtil.isNotEmpty(endTime)){
            wrapper.le("sorttime",endTime);//小于等于
        }
        wrapper.notIn("chute",  ParamConigCache.getExceptionChute());
        wrapper.eq("devicecode","3");
        return this.selectCount(wrapper);
    }

    @Override
    public Integer getTimeoutExceptionSortCounts(String beginTime, String endTime) {

        return mapper.getTimeoutExceptionSortCounts(beginTime,endTime);
    }

    @Override
    public Integer getExceptionSortCounts(String beginTime, String endTime) {
        EntityWrapper<YddSealmail> wrapper = new EntityWrapper<>();
        if (ToolUtil.isNotEmpty(beginTime)){
            wrapper.ge("sorttime",beginTime);//大于等于
        }
        if (ToolUtil.isNotEmpty(endTime)){
            wrapper.le("sorttime",endTime);//小于等于
        }
        wrapper.in("chute", ParamConigCache.getExceptionChute());
        return this.selectCount(wrapper);
    }

    @Override
    public Integer getNoBarcodeExceptionSortCounts(String beginTime, String endTime) {
        EntityWrapper<YddSealmail> wrapper = new EntityWrapper<>();
        if (ToolUtil.isNotEmpty(beginTime)){
            wrapper.ge("sorttime",beginTime);//大于等于
        }
        if (ToolUtil.isNotEmpty(endTime)) {
            wrapper.le("sorttime", endTime);//小于等于
        }
        wrapper.eq("barcode","");
        wrapper.le("lchute","3");
        return this.selectCount(wrapper);
    }

    @Override
    public Integer getExceptionByBestSortCounts(String beginTime, String endTime) {
        EntityWrapper<YddSealmail> wrapper = new EntityWrapper<>();
        if (ToolUtil.isNotEmpty(beginTime)){
            wrapper.ge("sorttime",beginTime);//大于等于
        }
        if (ToolUtil.isNotEmpty(endTime)) {
            wrapper.le("sorttime", endTime);//小于等于
        }
        List<String> excChutelist = ParamConigCache.getExceptionChute();
        String excChutes = "";
        for (String code:excChutelist){
            if(ToolUtil.isEmpty(excChutes)){
                excChutes = code;
            }else {
                excChutes = excChutes+"|"+code;
            }
        }
        wrapper.eq("sendflag",excChutes);
        return this.selectCount(wrapper);
    }

    @Override
    public String getSortingEfficiency(String beginTime, String endTime) {

        if (ToolUtil.isEmpty(beginTime)){
            beginTime = DateUtil.getAfterDayDate("-1");
        }
        if (ToolUtil.isEmpty(endTime)){
            endTime = DateUtil.getTime(new Date());
        }
        List<Integer> countList = new ArrayList<>();
        List<String> dateTimeList = new ArrayList<>();

        Date beginDate = DateUtil.parseTime(beginTime);
        Date endDate = DateUtil.parseTime(endTime);
        do {
            Date tempDate = beginDate;
            Calendar singleOneDate = Calendar.getInstance();
            singleOneDate.setTime(beginDate);
            singleOneDate.add(Calendar.MINUTE, 20);
            beginDate = singleOneDate.getTime();

            EntityWrapper<YddSealmail> wrapper = new EntityWrapper<>();
            wrapper.ge("sorttime",DateUtil.getTime(tempDate));//大于等于
            wrapper.le("sorttime", DateUtil.getTime(beginDate));//小于等于
            int count = mapper.selectCount(wrapper)*3;
            dateTimeList.add(DateUtil.getTime(beginDate));
            countList.add(count);
        }while (beginDate.compareTo(endDate)<0);

        Option option = new Option();
        option.title().text("分拣效率趋势图");
        option.toolbox().show(true).feature(Tool.mark, Tool.dataView, new MagicType(Magic.line, Magic.bar, Magic.pie).show(true), Tool.restore, Tool.saveAsImage,Tool.dataZoom);
        //设置提示框
        option.tooltip().trigger(Trigger.axis);
        //是否设置拖拽计算
        option.calculable(true);
        option.legend();
        //设置x
        option.xAxis(new CategoryAxis().data(dateTimeList.toArray()));
        option.yAxis(new ValueAxis());
        //设置Bar
        option.setCalculable(false);
        Bar bar = new Bar("分拣量");
        bar.barWidth(10);
        bar.getItemStyle();
        bar.data(countList.toArray());
        option.series(bar);
        bar.markPoint().data(new PointData().type(MarkType.max).name("最大值"), new PointData().type(MarkType.min).name("最小值"));
        //bar.markLine().data(new PointData().type(MarkType.average).name("平均值"));

        Gson gson = new Gson();
        String json = gson.toJson(option);
        return json;
    }


}
