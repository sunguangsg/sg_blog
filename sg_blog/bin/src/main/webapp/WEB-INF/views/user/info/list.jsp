<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<%@ include file="../../common/header.jsp" %>
<title>玩家列表</title>
<style>
@media ( max-width : 350px) {
	.table {
		min-width: 198%;
	}
}
.search .fr {width:30%;}
   @media (max-width:768px) {
   .search .fr {width: 50%;}
   .search {width:100%;}
   label .btn {float: right;}}
   @media (min-width:769px) and (max-width:992px){
   .search .fr {width: 40%;}
   .search {width:88%;}
   label .btn {float: right;}
   }
   @media (min-width:993px) and (max-width:1200px){
   .search {width: 90%;}
   label .btn {float: right;}
   }
   @media  (min-width:1201px){
   .search .fr {width: 300px;}
   label .btn {float: right;}
   .search {width:1290px;}}
   .search .fr {width: 300px;}
   .input-text {
    width: 200px;
}
</style>
</head>
<body>
	<nav class="breadcrumb">
		<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" >
		    <i class="Hui-iconfont">&#xe68f;</i>
		</a>
	 </nav>
<form  id="stateForm" method="post">
<div class="page-container">
	<div class="mt-20 clearfix">
	   	<label class="search">
	    <c:if test="${appid==0}"><span class="fr">APPID：<input type="text" value="${params.qappid}" name="qappid"  class="input-text" placeholder="APPID"></span></c:if>  
	    <span class="fr">UID：<input type="text" value="${params.guid}" name="guid"  class="input-text" placeholder="UID"></span>
	    <span class="fr">代理UID：<input type="text" value="${params.superGuid}" name="superGuid"  class="input-text" placeholder="代理UID"></span>
	    <span class="fr">昵称：<input type="text" value="${params.nickName}" name="nickName"  class="input-text" placeholder="玩家昵称"></span>
	   <button type="submit" class="btn btn-success radius " id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索</button></label> 
	    <div style="width:100%;overflow:auto;" >
			<table id="treeTable" class="table table-border table-bordered table-hover table-bg table-sort">
			    <thead>
			       <tr class="text-c">
			            <th>APPID</th>
						<th>UID</th>
						<th>玩家昵称</th>
						<th>代理UID</th>
						<th>绑定时间</th>
						<th>注册时间</th>
						<th>申请代理</th>
				</tr>	
				</thead>
				<tbody>
				     <c:forEach var="userinfo" items="${userInfoList}" varStatus="status"> 
                       <tr class="text-c" >
        		        <td>${userinfo.appid}</td>
        		        <td>${userinfo.guid}</td>
        		        <td>${userinfo.nickName}</td>
        		          <td>${userinfo.superGuid}</td>
        		        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${userinfo.bindTime}"/></td>
        		        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${userinfo.regTime}"/></td>
        		        <td class="td-manage">
						<a title="编辑" href="<c:url value='/agent/applyAgent/${userinfo.appid}/${userinfo.guid}'></c:url>"  style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>&nbsp;&nbsp;&nbsp;
						</td>
					   </tr>
                    </c:forEach> 	
				</tbody>
			</table>
		</div>
		<div class="displayVisR">
			<myTag:paging paging="${paging}" url="/userinfo/list" formId="stateForm" />
			</div> 
	</div>
</div>
</form>
<script type="text/javascript">
$(function(){
    $("#search").click(function(){
    	$("#stateForm").action="<c:url value='/userinfo/list'/>";
    	$("#stateForm").submit();
    })
})
function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
</script>
</body>
</html>