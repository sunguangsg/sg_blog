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

<title>公告信息</title>
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
<form  id="stateForm" method="post">
<div class="page-container">
 
	<div class="mt-20 clearfix">
	<div class="add">
	 <a onclick="member_edit('添加','<c:url value='/agentNotice/add'/>','4','','510')" style="text-decoration:none">新增</a>
	 </div>
<!-- 	     <label class="search">公告标题： -->
<%--            <input id="name" type="text" name="name" value="${params.name}" class="input-text" style="width:55%;" placeholder="公告标题"><button id="search" type="button" class="btn btn-success radius"><i class="Hui-iconfont">&#xe665;</i> 搜索</button> --%>
<!--         </label> -->
        
         <label class="search">
	     <span class="fr">公告标题：<input type="text" value="${params.name}" name="name"  class="input-text" placeholder="公告标题"></span>
	   <button type="submit" class="btn btn-success radius " id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
	   </label> 
	    <div style="width:100%;overflow:auto;" >
			<table id="treeTable" class="table table-border table-bordered table-hover table-bg table-sort">
			    <thead>
			     <tr class="text-c">
			            <th>序号</th>
						<th>公告标题</th>
						<th>公告内容</th>
						<th>创建时间</th>
						<th>修改时间</th>
						<th>激活状态</th>
						<th>操作</th>
				</tr>	
				</thead>
				<tbody>
				     <c:forEach var="item" items="${agentNoticeList}" varStatus="status"> 
                       <tr class="text-c" >
        		      <td>${status.index + 1}</td>
        		        <td>${item.name}</td>
        		        <td>${item.content}</td>
        		        <td>
        		        <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.createTime }"/>
        		        </td>
        		        <td>
        		        <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.updateTime}"/>
        		        </td>
        		        <td>
        		          <c:if test="${item.state==0}">关闭</c:if>
						<c:if test="${item.state==1}">开启</c:if>
        		        </td>
        		        <td class="td-manage">
						<a title="编辑"  onclick="member_edit('编辑','<c:url value='/agentNotice/edit/${item.id}'></c:url>','4','','510')" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>&nbsp;&nbsp;&nbsp;
						<a title="删除" onclick="javascript:onDelete('${item.id}');" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
						</td>
					   </tr>
                    </c:forEach> 	
				</tbody>
			</table>
		</div>

		<div class="displayVisR">
			<myTag:paging paging="${paging}" url="/agentNotice/list" formId="stateForm" />
		</div> 
	</div>
</div>
</form>
<script type="text/javascript">
function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}

function onDelete(id) {
	layer.confirm('你确认要删除游戏？', {
		  btn: ['确定','取消'] //按钮
		}, function(){
			window.location="<c:url value='/agentNotice/delete/'/>"+id;
		}, function(){
		  layer.msg('操作已取消', {
		    time: 1000 //20s后自动关闭
		  });
		});
}


$(function(){
    $("#search").click(function(){
    	$("#stateForm").action="<c:url value='/agentNotice/list'/>";
    	$("#stateForm").submit();
    })
})
</script>
</body>
</html>