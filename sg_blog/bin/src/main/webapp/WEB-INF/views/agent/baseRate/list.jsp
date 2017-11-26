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

<title>代理基础分成列表</title>
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
.add {margin-bottm:20px;
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
	 <a onclick="member_edit('添加','<c:url value='/agent/baseRate/add'/>','4','','510')" style="text-decoration:none">新增</a>
	 </div>
	 <label class="search">
	     <c:if test="${appid==0}"> <span class="fr">APPID：<input type="text" value="${params.qappid}" name="qappid"  class="input-text" placeholder="APPID"></span></c:if>
	    <button type="submit" class="btn btn-success radius " id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
	   </label> 
	    <div style="width:100%;overflow:auto;" >
			<table id="treeTable" class="table table-border table-bordered table-hover table-bg table-sort">
			    <thead>
			       <tr class="text-c">
			            <th>APPID</th>
			            <th>代理等级</th>
						<th>一级代理分成比例(%)</th>
						<th>二级代理分成比例(%)</th>
						<th>三级代理分成比例(%)</th>
						<th>备注</th>
						<th>操作</th>
				</tr>	
				</thead>
				<tbody>
				     <c:forEach var="item" items="${list}" varStatus="status"> 
                       <tr class="text-c" >
        		        <td>${item.appid}</td>
        		        <td>${item.level}</td>
        		        <td>${item.rate1}</td>
        		        <td>${item.rate2}</td>
        		        <td>${item.rate3}</td>
        		        <td>${item.name}</td>
        		        <td class="td-manage">
						<a title="编辑"  onclick="member_edit('编辑','<c:url value='/agent/baseRate/edit/${item.appid}/${item.level}'></c:url>','4','','510')" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>&nbsp;&nbsp;&nbsp;
						<a title="删除" onclick="checkDelete(${item.appid},${item.level})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
						</td>
					   </tr>
                    </c:forEach> 	
				</tbody>
			</table>
		</div>
	</div>
	<div class="displayVisR">
	  <myTag:paging paging="${paging}" url="/agent/baseRate/list" formId="stateForm" />
</div>
</div>
</form>
<script type="text/javascript">
function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}

function checkDelete(appid,level) {
	layer.confirm('确认删除该记录？', {
		  btn: ['确定','取消'] //按钮
		}, function(){
			window.location="<c:url value='/agent/baseRate/delete/'/>"+appid+"/"+level;
		}, function(){
		  layer.msg('操作已取消', {
		    time: 1000 //20s后自动关闭
		  });
		});
}
</script>
</body>
</html>