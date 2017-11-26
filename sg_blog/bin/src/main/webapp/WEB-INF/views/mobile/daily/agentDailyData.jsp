<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<%@ include file="../../common/mHeader.jsp" %>
<script type="text/javascript" src='<c:url value='/static/My97DatePicker/WdatePicker.js'/>'></script>
<title>每日数据</title>
<style>
.dataTime .floatL {
    width: 100%;
  }
  .floatL li {
    width: 22%;}
    
.floatL .wid {
  width:27%;
}
.floatL input {
  width: 33%;
  height: 23px;
}
.btn {
  height: 25px;
  padding: 1px 6px;
  margin-left:4px;
}

   #inputdata {font-size：14px;}
</style>
</head>
<body class="overflowA">
<nav class="breadcrumb ">每日数据</nav>
    <div class="page-container">
        <div class="mt-20 " >
           <div style="width:100%;" class="personP" >
               <div class="dataTime">
                   <div class="person clearfix">
                       <ul class="floatL">
                           <li>时间 ：<input id="inputdate"  class="Wdate" type="text" onfocus="WdatePicker({skin:'default',maxDate: '%y-%M-%d' })"/> 
                           <button onclick="getPageData()" type="button" class="btn blue borderR" id="btnFadeout"><i class="icon-ok "></i>确定</button>
                           <button onclick="selectDay(0)" type="button" class="btn blue borderR" id="btnFadeout"><i class="icon-ok "></i>今天</button>
                           <button onclick="selectDay(-1)" type="button" class="btn blue borderR" id="btnFadeout"><i class="icon-ok "></i>前一天</button></li>
                           <li>组局数 : <span id="CountTable">0</span></li>
                           <li>消耗 ：<span id="usedDiamond">0</span></li>
                       </ul>
                       </div>
                   <div class="dataT clearfix">
                        <ul class="ul floatL ">
                            <li class="wid">代理级别</li>
                            <li>一级</li>
                            <li>二级</li>
                            <li>三级</li>
                        </ul>
                   </div>
                   <div class="clearfix" id="liData">
                       <ul class="ul floatL">
                            <li class="wid">绑定人数</li>
                            <li>0</li>
                            <li>0</li>
                            <li>0</li>
                        </ul>
                        <ul class="ul floatL">
                            <li class="wid">收益(元)</li>
                            <li>0</li>
                            <li>0</li>
                            <li>0</li>
                        </ul>
                   </div>
                 </div>
            </div>
        </div>
    </div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript">
var DayStr;
$(function(){
	getPageData();
})
function getPageData(){
   var queryDay=$("#inputdate").val();
	    $.ajax({
	        type: 'GET',
	        url: "<c:url value='/analysis/agent/mlist'/>",
	        data:{'queryDay':queryDay},
	        dataType: 'json',
	        success: function(data){
	         if(data.retCode==1){
	        	DayStr=data.queryDay;
	        	$("#inputdate").val(data.queryDay);
	        	$("#CountTable").html(data.todayCountTable); 
	        	$("#usedDiamond").html(data.todayUsedDiamond+"钻"); 
	            var htmlStr="<ul class=\"ul floatL\"><li class=\"wid\">绑定人数(人)</li><li>"+data.countTodayBind+"</li><li>"+data.TodayBindLevel2+"</li><li>"+data.TodayBindLevel3+"</li></ul><ul class=\"ul floatL\"><li class=\"wid\">收益(元)</li><li>"+(data.income1/100).toFixed(2)+"</li><li>"+(data.income2/100).toFixed(2)+"</li><li>"+(data.income3/100).toFixed(2)+"</li></ul>"
	        	$("#liData").html(htmlStr);
	          }
	        }
	    });
	
}

function selectDay(off){
	DayStr=	GetDateStr(off);
	$("#inputdate").val(DayStr);
	getPageData();
}

Date.prototype.Format = function (fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

function GetDateStr(off) { 
	if(off==0){
		var dd = new Date(); 
		return dd.Format("yyyy-MM-dd");//获取AddDayCount天后的日期 

	}else{
		datestr = DayStr.replace(/-/g,"/");
		  var dd = new Date(datestr);
		    dd.setDate(dd.getDate()+off);//
		return dd.Format("yyyy-MM-dd");//获取AddDayCount天后的日期 
	}
} 
</script>
</body>
</html>