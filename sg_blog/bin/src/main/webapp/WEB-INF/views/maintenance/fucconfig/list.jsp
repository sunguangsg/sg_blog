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
<title>游戏维护</title>
<style>
@media ( max-width : 350px) {
	.table {
		min-width: 198%;
	}
}
</style>
</head>

<body>
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>
		<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" >
		    <i class="Hui-iconfont">&#xe68f;</i>
		</a>
	 </nav>
<div class="page-container">
	
	<div class="mt-20 clearfix">
	<button class='btn' style="float: right;margin-right: 10px; color: red" type="button" onclick="addAgent();"><i class='icon-plus'></i>新增</button>
	    <label class="search">按条件查询：
	    <input type="text" name=""  class="input-text" style="width:55%;">
	    </label>
	    <div style="width:100%;overflow:auto;" >
			<table id="treeTable" class="table table-border table-bordered table-hover table-bg table-sort">
			    <thead>
			     <tr class="text-c">
			            <th>APPID</th>
						<th>游戏名称</th>
						<th>APPKey</th>
						<th>创建时间</th>
						<th>修改时间</th>
						<th>操作</th>
				</tr>	
				</thead>
				<tbody>
				     <c:forEach var="item" items="${appInfoList}" varStatus="status"> 
                       <tr class="text-c" >
        		      <td>${item.appid}</td>
        		        <td>${item.appname}</td>
        		        <td>${item.appkey}</td>
        		        <td>
        		        <fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${item.createTime }"/>
        		        </td>
        		        <td>
        		        <fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${item.updateTime}"/>
        		        </td>
        		        <td class="td-manage">
						<a title="编辑"  onclick="member_edit('编辑','<c:url value='/appinfo/edit/${item.appid}'></c:url>','4','','510')" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>&nbsp;&nbsp;&nbsp;
						<a title="删除" href="<c:url value='/appinfo/delete/${item.appid}'></c:url>" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
						</td>
					   </tr>
                    </c:forEach> 	
				</tbody>
			</table>
		</div>
	<!-- 	<form>
				<span >显示</span>
				<select>
				<option value="10">10</option>
				<option value="25">25</option>
				<option value="50">50</option>
				<option value="100">100</option>
				</select>
				<span >条</span>
		    </form> -->
<!-- 		<div class="displayVisL">显示&nbsp;1&nbsp;到&nbsp;2&nbsp;，共&nbsp;2&nbsp;条</div> -->
		<div class="displayVisR">
		<form  id="stateForm">
			<myTag:paging paging="${paging}" url="/appinfo/list" formId="stateForm" />
			</form>
			</div> 
	</div>
</div>

<script type="text/javascript">
function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
function addAgent(){
	window.location = "<c:url value='/appinfo/add'/>";
}
</script>
</body>
</html>