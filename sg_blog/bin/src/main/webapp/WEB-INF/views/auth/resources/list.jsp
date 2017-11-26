<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" type="text/css" href="<c:url value='/static/treeTable/jquery.treetable.theme.default.css'/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/static/treeTable/jquery.treetable.css'/>"/>
<script type="text/javascript" src="<c:url value='/static/treeTable/jquery.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/treeTable/jquery.treetable.js'/>"></script>

<title>菜单列表</title>
<style>
@media ( max-width : 350px) {
	.table {
		min-width: 198%;
	}
}
</style>
</head>
<body>
	<nav class="breadcrumb">
		<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" >
		    <i class="Hui-iconfont">&#xe68f;</i>
		</a>
	 </nav>
<div class="page-container">
	<div class="mt-20 clearfix">
	    <div style="width:100%;overflow:auto;" >
			<table id="treeTable" class="table table-border table-bordered table-hover table-bg table-sort">
			    <thead>
			       <tr class="text-c">
			            <th>名称</th>
						<th>编号</th>
						<th>链接</th>
						<th>父级编号</th>
						<th>状态</th>
						<th>描述</th>
						<th>类型</th>
						<th>操作</td>
					   </tr>	
				</thead>
				<tbody>
				     <c:forEach var="menu" items="${treeList}" varStatus="status"> 
                        <!--判断元素是否是一级节点-->
                       <c:if test="${menu.parentId!=-1}"> 
                       <tr class="text-c"  data-tt-id="${menu.resourceId}" data-tt-parent-id="${menu.parentId}">
        		        <td>${menu.name}</td>
						<td>${menu.resourceId}</td>
						<td>${menu.href}</td>
						<td>${menu.parentId}</td>
						<c:if test="${menu.state==1}">
							<td>生效</td>
						</c:if>
						<c:if test="${menu.state==0}">
							<td>无效</td>
						</c:if>
						<td>${menu.description}</td>
					  <c:if test="${menu.type==1}">
						<td>菜单</td>
					</c:if>
					<c:if test="${menu.type==2}">
						<td>操作</td>
					</c:if>
					   <td class="td-manage">
						<a title="新增"  onclick="member_edit('添加','<c:url value='/auth/resources/add'></c:url>','4','','510')" style="text-decoration:none"><i class="Hui-iconfont">&#xe600;</i></a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a title="编辑"  onclick="member_edit('编辑','<c:url value='/auth/resources/edit/${ menu.resourceId}'></c:url>','4','','510')" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>&nbsp;&nbsp;&nbsp;
						<a title="删除" onclick="checkDelete(${menu.resourceId})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
						</td>
					   </tr>
                       </c:if>   
                       <c:if test="${menu.parentId==-1}"> 
                       <tr class="text-c" data-tt-id='${menu.resourceId}'>
                         <td>${menu.name}</td>
						<td>${menu.resourceId}</td>
						<td>${menu.href}</td>
						<td>${menu.parentId}</td>
						<c:if test="${menu.state==1}">
							<td>生效</td>
						</c:if>
						<c:if test="${menu.state==0}">
							<td>无效</td>
						</c:if>
						<td>${menu.description}</td>
					  <c:if test="${menu.type==1}">
						<td>菜单</td>
					</c:if>
					<c:if test="${menu.type==2}">
						<td>操作</td>
					</c:if>
						<td class="td-manage">
						<a title="新增"  onclick="member_edit('添加','<c:url value='/auth/resources/add?resourceId=${menu.resourceId}'></c:url>','4','','510')" style="text-decoration:none"><i class="Hui-iconfont">&#xe600;</i></a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a title="编辑"  onclick="member_edit('编辑','<c:url value='/auth/resources/edit/${menu.resourceId}'></c:url>','4','','510')" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>&nbsp;&nbsp;&nbsp;
						<a title="删除" onclick="checkDelete(${menu.resourceId});" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
						</td>
					   </tr>
                       </c:if>
                    </c:forEach> 	
				</tbody>
			</table>
		</div>
	</div>
</div>

<script type="text/javascript">
//初始化表格样式和树形结构
$(function() {
 $('#treeTable').treetable({ expandable: true }); //默认可折叠
 
});
function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}

function checkDelete(resourceId) {
	layer.confirm('确认删除该记录？', {
		  btn: ['确定','取消'] //按钮
		}, function(){
			window.location="<c:url value='/auth/resources/delete/"+resourceId+"'></c:url>";
		}, function(){
		  layer.msg('操作已取消', {
		    time: 1000 //20s后自动关闭
		  });
		});
}
</script>
</body>
</html>