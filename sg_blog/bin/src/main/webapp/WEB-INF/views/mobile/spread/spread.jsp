<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../common/mHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

<title>我的推广</title>
<style>

.player {
    padding-bottom: 8px;
    background: #EDEDEA;
    padding: 9px 0px 10px 14px;
    margin-bottom:20px;
  }
  .wid {
    word-wrap:break-word ;
  }
</style>
</head>
<body>
<nav class="breadcrumb clearfix">我的推广 </nav>
	<div class="page-container">
		<div class="mt-20 clearfix" >
	       <div style="width:100%;" class="personP" >
	       <div class="person clearfix">
                   <ul class="floatL">
                     <li>今日绑定数 ：<span>${countTodayBind}</span></li>
                     <li>本月绑定数 ：<span>${countMothBind}</span></li>
                     <li>总绑定数 ：<span>${agentInfo.userNum1+agentInfo.userNum2+agentInfo.userNum3}</span></li>
                   </ul>
                   <ul class="floatL">
                     <li></span></li>
                     <li></span></li>
                     <li></span></li>
                   </ul>
		       </div>
             <ul class="ul clearfix">
                <li class="li" style="width:26%;">
                    <ul >&nbsp;
                      <li>一级代理</li>
                      <li>二级代理</li>
                      <li>三级代理</li>
                  </ul>
                </li>
                <li  class="li" style="width:33%;">
                    <ul >今日/总收益
                      <li>${income1/100}元/${agentInfo.income1/100}元</li>
                      <li>${income2/100}元/${agentInfo.income2/100}元</li>
                      <li>${income3/100}元/${agentInfo.income3/100}元</li>
                  </ul>
                </li>
                <li class="li" style="width:38%;">
                  <ul >今日/总用户数
                     <li>${countTodayBind}/${agentInfo.userNum1}</li>
                      <li>${TodayBindLevel2}/${agentInfo.userNum2}</li>
                      <li>${TodayBindLevel3}/${agentInfo.userNum3}</li>
                  </ul>
                </li>
              </ul>

		    </div>
	    </div>
    </div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript">

</script>
</body>
</html>