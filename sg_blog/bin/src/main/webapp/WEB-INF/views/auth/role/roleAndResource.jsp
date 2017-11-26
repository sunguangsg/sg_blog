<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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
<title>角色授权</title>
<style type="text/css" media="screen">
    .cf {
       margin-top:30px;
    }
   .blue {
    background: #5a98de;
    color: #fff;
   }
form {
    margin-top: -25px;
}
</style>
</head>
<body>
		<nav class="breadcrumb">
		<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" >
		    <i class="Hui-iconfont">&#xe68f;</i>
		</a>
	 </nav>
  <form id="accountForm" action="<c:url value='/auth/role/doRoleAndResource'></c:url>"  method="post">
    <div class="page-container row-fluid">
        <div class="page-content">
            <div class="portlet-body" style="padding: 0px;">
                <div class="vip_box" style="padding-top: 10px;">
                    <div class="form-c cf">
                        <label>角色名称：</label>
                      <select name="roleid" id="roleSelect" onchange="getRoleHadResources()">
                      <c:forEach var="role" items="${roleList}" varStatus="status">
                      <option value="${role.roleId}">${role.roleName}</option>
                      </c:forEach>
                      </select>
                        <span class='help-inline' name="roleid"></span>
                    </div>
				</div>
				<table id="treeTable" class="table table-border table-bordered table-hover table-bg table-sort">
			    <thead>
			       <tr class="text-c">
			            <th>名称</th>
						<th>菜单ID</th>
						<th>链接</th>
						<th>描述</th>
				   </tr>	
				</thead>
				<tbody id="menu_t">
				     <c:forEach var="menu" items="${menuList}" varStatus="status"> 
				        <c:if test="${menu.parentId==-1}"> 
                       <tr class="text-c" data-tt-id='${menu.resourceId}'>
                        <td><input parentMenuId="${menu.resourceId}" onclick="parentMenuCheck('${menu.resourceId}')" value="${menu.resourceId}" type="checkbox" name="resourceIds">${menu.name}</td>
						<td>${menu.resourceId}</td>
						<td>${menu.href}</td>
						<td>${menu.description}</td>
					   </tr>
                       </c:if>
                       <c:if test="${menu.parentId!=-1}"> 
                       <tr class="text-c"  data-tt-id="${menu.resourceId}" data-tt-parent-id="${menu.parentId}">
        		        <td><input childMenu="${menu.parentId}" childMenuId="${menu.resourceId}" onclick="childMenuCheck('${menu.resourceId}','${menu.parentId}')" value="${menu.resourceId}" type="checkbox" name="resourceIds">${menu.name}</td>
						<td>${menu.resourceId}</td>
						<td>${menu.href}</td>
						<td>${menu.description}</td>
					   </tr>
                       </c:if>   
                    
                    </c:forEach> 	
				</tbody>
			</table>		
                <div class="form-actions" style="text-align: center;margin-top: 40px;">
                    <button type="submit" class="btn blue" id="addRole"><i class="icon-ok"></i> 提交</button>
                    <button type="reset" class="btn" id="removeRole" >取消</button>
                </div>
            </div>
        </div>
    </div>
</form>
<script type="text/javascript">
$(function(){
    $('#treeTable').treetable({ expandable: true }); //默认可折叠
    getRoleHadResources();
})

function getRoleHadResources(){
	var roleSelect=$("#roleSelect").val();
	var checkboxs=document.getElementsByTagName('input') ;
	for (var j = 0; j < checkboxs.length; j++) {
        checkboxs[j].checked = false;
	}
    $.ajax({
        type: 'GET',
        url: "<c:url value='/auth/role/getAjaxRoleRe/'/>"+roleSelect,
        dataType:"json",
        success: function(data){
         var IDList=data.IDList
         for (var i = 0; i < IDList.length; i++) {
        	    for (var j = 0; j < checkboxs.length; j++) {
               	 if(checkboxs[j].value==IDList[i]){
               		checkboxs[j].checked = true;
               	 break;
        		}
		}
        }
        }
    });
}


function parentMenuCheck(menuId){
	    var parentMenu = "input[parentMenuId='"+menuId+"']";
	    var childMenu = "input[childMenu='"+menuId+"']";
		var isChecked = $(parentMenu).prop('checked');	 
		if(!isChecked){
			$(childMenu).attr("checked",false); 
		}
	}
function childMenuCheck(menuId,parentId){
	    var childMenu = "input[childMenuId='"+menuId+"']";
	    var parentMenu = "input[parentMenuId='"+parentId+"']";
	    var isChecked = $(childMenu).prop('checked');
	    if(isChecked){
            $(parentMenu).prop("checked",true);
	    }
	}

</script>
</body>
</html>