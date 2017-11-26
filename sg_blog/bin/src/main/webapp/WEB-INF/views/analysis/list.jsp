<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<%@ include file="../common/header.jsp" %>

<title>每日数据列表</title>
<style>
@media ( max-width : 350px) {
	.table {
		min-width: 198%;
	}
}
  .search .fr {width:80%;}
 label .btn {float: right;}
 @media (max-width:768px) {
 .fr {width: 100%;}
 .search {width:80%;}}
 @media (min-width:769px) and (max-width:992px){
  .fr {width: 100%;}
 .search {width:55%;}}
 @media (min-width:993px) and (max-width:1200px){
  .search {width: 44%;}
 }
 @media  (min-width:1201px){
 .fr {width: 76%;}
 .search {width:35%;}
 }

</style>
</head>
<body>
	<nav class="breadcrumb">
		<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" >
		    <i class="Hui-iconfont">&#xe68f;</i>
		</a>
	 </nav>
<form id="stateForm" method="post">
<div class="page-container">

	<div class="mt-20 clearfix">
<!-- 	    <label class="search">AppID： -->
<!-- 	    <input id="appid" type="text"  name="appid"  class="input-text" style="width:55%;" placeholder="AppID"><button id="search" type="button" class="btn btn-success radius"><i class="Hui-iconfont">&#xe665;</i> 搜索</button> -->
<!-- 	    </label> -->
	    <label class="search">
	    <c:if test="${appid==0}"> <span class="fr">APPID：<input type="text" value="${params.qappid}" name="qappid"  class="input-text" placeholder="APPID"></span>
	   <button type="submit" class="btn btn-success radius " id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索</button></c:if>
	   </label> 
	    <div style="width:100%;overflow:auto;" >
			<table id="treeTable" class="table table-border table-bordered table-hover table-bg table-sort">
			    <thead>
			       <tr class="text-c">
			            <th>APPID</th>
						<th>日期</th>
						<th>注册量</th>
						<th>日活跃数</th>
						<th>开桌总数</th>
						<th>回合总数</th>
						<th>钻石消耗量</th>
						<th>充值金额</th>
						<th>在线峰值</th>
						<th>峰值时间点</th>
				</tr>	
				</thead>
				<tbody>
				     <c:forEach var="item" items="${dailyAnalysisList}" varStatus="status"> 
                       <tr class="text-c" >
        		        <td>${item.appid}</td>
        		        <td>${item.day}</td>
        		        <td>${item.regNum}</td>
        		        <td>${item.dau}</td>
        		        <td>${item.tableNum}</td>
        		        <td>${item.roundNum}</td>
        		        <td>${item.useDiamond}</td>
        		         <td>${item.totalFee/100}元</td>
        		        <td>${item.online}</td>
        		        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.onlineTime}"/></td>
					   </tr>
                    </c:forEach> 	
				</tbody>
			</table>
		</div>
			<div class="displayVisR">
				<myTag:paging paging="${paging}" url="/order/list" formId="stateForm" />
			</div>
		</div>
</div>
</form>
<script type="text/javascript">
$(function(){
    $("#search").click(function(){
    	$("#stateForm").action="<c:url value='/analysis/dailyInfoList'/>";
    	$("#stateForm").submit();
    })
})
</script>
</body>
</html>