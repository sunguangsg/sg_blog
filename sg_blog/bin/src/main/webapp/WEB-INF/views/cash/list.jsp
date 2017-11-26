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
<title>提现申请列表</title>
<style>
@media ( max-width : 350px) {
	.table {
		min-width: 198%;
	}
}

  .search .fr {width:30%;}
   label .btn {float: right;}
   @media (max-width:768px) {
   .search .fr {width: 50%;}
   .search {width:100%;}
   label .btn {float: right;}}
   @media (min-width:769px) and (max-width:992px){
   .search .fr {width: 40%;}
   .search {width:88%;}

   }
   @media (min-width:993px) and (max-width:1200px){
   .search {width: 90%;}
   }
   @media  (min-width:1201px){
   .search .fr {width: 30%;}
   .search {width:75%;}}

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
	        <label class="search">
	    <span class="fr">AppID：<input type="text" value="" name="appid"  class="input-text" placeholder="AppID"></span>
	    <span class="fr">UID：<input type="text" value="${params.guid}" name="guid"  class="input-text" placeholder="UID"></span>
	    <span class="fr">订单ID：<input type="text" value="${params.orderId}" name="orderId"  class="input-text" placeholder="订单ID"></span>
	   <button type="submit" class="btn btn-success radius " id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索</button></label> 
	    <div style="width:100%;overflow:auto;" >
			<table id="treeTable" class="table table-border table-bordered table-hover table-bg table-sort">
			    <thead>
			       <tr class="text-c">
			            <th>订单ID</th>
						<th>AppID</th>
						<th>UID</th>
						<th>提现金额</th>
						<th>订单状态</th>
						<th>申请时间</th>
						<th>备注</th>
						<th>审核时间</th>
						<th>操作</th>
				</tr>	
				</thead>
				<tbody>
				     <c:forEach var="item" items="${cashApplyList}" varStatus="status"> 
                       <tr class="text-c" >
        		        <td>${item.orderId}</td>
        		        <td>${item.appid}</td>
        		        <td>${item.guid}</td>
        		        <td>${item.totalFee/100}元</td>
        		        <c:if test="${item.state==0}">
        		         <td>提交申请</td>
        		        </c:if>
        		        <c:if test="${item.state==1}">
        		         <td>通过</td>
        		        </c:if>
        		        <c:if test="${item.state==2}">
        		         <td>驳回</td>
        		        </c:if>
        		         <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.applyTime}"/></td>
        		        <td>${item.remark}</td>
        		        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.updateTime}"/></td>
        		         <td class="td-manage">
        		        <c:if test="${item.state==0}">
						<a title="审核"  onclick="member_edit('审核','<c:url value='/cash/edit/${item.orderId}'></c:url>','4','','510')" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>&nbsp;&nbsp;&nbsp;
        		       </c:if>
        		        </td>
					   </tr>
                    </c:forEach> 	
				</tbody>
			</table>
		</div>
			<div class="displayVisR">
				<myTag:paging paging="${paging}" url="/cash/list" formId="stateForm" />
			</div>
		</div>
</div>
</form>
<script type="text/javascript">
$(function(){
    $("#search").click(function(){
    	$("#stateForm").action="<c:url value='/cash/list'/>";
    	$("#stateForm").submit();
    })
})


function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}

</script>
</body>
</html>