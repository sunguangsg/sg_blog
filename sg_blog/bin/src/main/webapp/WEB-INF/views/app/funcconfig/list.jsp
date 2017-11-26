<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<%@ include file="../../common/header.jsp" %>

<title>游戏信息</title>
<style>
@media ( max-width : 350px) {
	.table {
		min-width: 198%;
	}
}
.search .fr {width:43%;}
   label .btn {float: right;}
  @media (max-width:768px) {
  .search .fr {width: 50%;}
  .search {width:100%;}}
  @media (min-width:769px) and (max-width:992px){
  .search .fr {width: 40%;}
  .search {width:88%;}
  }
  @media (min-width:993px) and (max-width:1200px){
   .search { width: 70%;}
  }
  @media  (min-width:1201px){
  .search .fr {width: 43%;}
  .search {width:55%;}}

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
	 <a onclick="member_edit('添加','<c:url value='/funcConfig/add'/>','4','','510')" style="text-decoration:none">新增</a>
	 </div>
<!-- 	     <label class="search">接口名称： -->
<%--            <input id="funcName" type="text" name="funcName" value="${params.funcName}" class="input-text" style="width:55%;" placeholder="接口名称"><button id="search" type="button" class="btn btn-success radius"><i class="Hui-iconfont">&#xe665;</i> 搜索</button> --%>
<!--         </label> -->
	 <label class="search">
	    <c:if test="${appid==0}"> <span class="fr">APPID：<input type="text" value="${params.qappid}" name="qappid"  class="input-text" placeholder="APPID"></span></c:if>
	    <span class="fr">接口名称：<input type="text" value="${params.funcName}" id ="funcName" name="funcName"  class="input-text" placeholder="接口名称"></span>
	   <button type="submit" class="btn btn-success radius " id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
	   </label> 
	    <div style="width:100%;overflow:auto;" >
			<table id="treeTable" class="table table-border table-bordered table-hover table-bg table-sort">
			    <thead>
			     <tr class="text-c">
			            <th>APPID</th>
						<th>接口名称</th>
						<th>接口地址</th>
						<th>操作</th>
				</tr>	
				</thead>
				<tbody>
				     <c:forEach var="item" items="${funcConfigList}" varStatus="status"> 
                       <tr class="text-c" >
        		      <td>${item.appid}</td>
        		        <td>${item.funcName}</td>
        		        <td>${item.notfiyUrl}</td>
        		     
        		        <td class="td-manage">
						<a title="编辑"  onclick="member_edit('编辑','<c:url value='/funcConfig/edit/${item.appid}/${item.funcName }'></c:url>','4','','510')" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>&nbsp;&nbsp;&nbsp;
						<a title="删除" onclick="javascript:onDelete('${item.appid}','${item.funcName }');" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
						</td>
					   </tr>
                    </c:forEach> 	
				</tbody>
			</table>
		</div>

		<div class="displayVisR">
			<myTag:paging paging="${paging}" url="/funcConfig/list" formId="stateForm" />
		</div> 
	</div>
</div>
</form>
<script type="text/javascript">
function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}

function onDelete(appid,funcName) {
	 var funcName = encodeURI(funcName);
	layer.confirm('你确认要删除接口吗？', {
		  btn: ['确定','取消'] //按钮
		}, function(){
			window.location="<c:url value='/funcConfig/delete/'/>"+appid+"/"+funcName;
		}, function(){
		  layer.msg('操作已取消', {
		    time: 1000 //20s后自动关闭
		  });
		});
}


$(function(){
    $("#search").click(function(){
    	$("#stateForm").action="<c:url value='/funcConfig/list'/>";
    	$("#stateForm").submit();
    })
})
</script>
</body>
</html>