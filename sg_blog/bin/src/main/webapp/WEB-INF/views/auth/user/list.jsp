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
<link rel="stylesheet" type="text/css" href="<c:url value='/static/treeTable/jquery.treetable.theme.default.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/static/treeTable/jquery.treetable.css'/>" />
<script type="text/javascript" src="<c:url value='/static/treeTable/jquery.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/treeTable/jquery.treetable.js'/>"></script>

<title>用户列表</title>
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
<form  id="stateForm" method="post">
<div class="page-container">
	<div class="mt-20 clearfix">
	<div class="add">
	 <a onclick="member_edit('添加','<c:url value='/auth/user/add'/>','4','','510')" style="text-decoration:none">新增</a>
	 </div>
	  	<label class="search">
	     <c:if test="${appid==0}"> <span class="fr">APPID：<input type="text" value="${params.qappid}" name="qappid"  class="input-text" placeholder="APPID"></span></c:if>
	    <span class="fr">UID：<input type="text" value="${params.guid}" name="guid"  class="input-text" placeholder="UID"></span>
	    <span class="fr">登录帐号：<input type="text" value="${params.username}" name="username"  class="input-text" placeholder="登录帐号"></span>
	   <button type="submit" class="btn btn-success radius " id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
	   </label> 
	    <div style="width:100%;overflow:auto;" >
			<table id="treeTable" class="table table-border table-bordered table-hover table-bg table-sort">
			    <thead>
			       <tr class="text-c">
			            <th>用户ID</th>
						<th>用户名称</th>
						<th>APPID</th>
						<th>真实姓名</th>
						<th>UID</th>
						<th>手机</th>
						<th>状态</td>
						<th>注册时间</td>
						<th>登录时间</td>
						<th>操作</td>
					   </tr>	
				</thead>
				<tbody>
				     <c:forEach var="item" items="${userList}" varStatus="status"> 
                       <tr class="text-c" >
                       <td>${item.userId}</td>
						<td>${item.username}</td>
						<td>${item.appid}</td>
						<td>${item.realname}</td>
						<td>${item.guid}</td>
						<td>${item.mobile}</td>
						<c:if test="${item.status==1}">
							<td>有效</td>
						</c:if>
						<c:if test="${item.status==2}">
							<td>禁用</td>
						</c:if>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.regTime}"/></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.loginTime}"/></td>
						<td class="td-manage">
						<a title="编辑" href="<c:url value='/auth/user/edit/${item.userId}'></c:url>" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>&nbsp;&nbsp;&nbsp;
						<a title="删除" onclick="onDelete(${item.userId})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>&nbsp;&nbsp;&nbsp;
						<a title="冻结"  onclick="onFrozen(${item.userId})" style="text-decoration:none"><i>禁用</i></a>&nbsp;
						</td>
					   </tr>
                    </c:forEach> 	
				</tbody>
			</table>
		</div>
		<div class="displayVisR">
			<myTag:paging paging="${paging}" url="/auth/user/list" formId="stateForm" />
			</div> 
	</div>
</div>
</form>
<script type="text/javascript">
function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}

function onDelete(userid) {
	layer.confirm('确认删除该记录？', {
		  btn: ['确定','取消'] //按钮
		}, function(){
			window.location="<c:url value='/auth/user/delete/'/>"+userid;
		}, function(){
		  layer.msg('操作已取消', {
		    time: 1000 //20s后自动关闭
		  });
		});
}
$(function(){
    $("#search").click(function(){
    	$("#stateForm").action="<c:url value='/auth/user/list'/>";
    	$("#stateForm").submit();
    })
})

function onFrozen(userid) {
	layer.confirm('你确认要禁用此用户吗？', {
		  btn: ['确定','取消'] //按钮
		}, function(){
			window.location="<c:url value='/auth/user/frozen/'/>"+userid;
		}, function(){
		  layer.msg('操作已取消', {
		    time: 1000 //20s后自动关闭
		  });
		});
}

</script>

</body>
</html>