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
<title>新增角色</title>
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
  <form id="accountForm" action="<c:url value='/auth/role/insert'></c:url>"  method="post">
    <div class="page-container row-fluid">
        <div class="page-content">
            <div class="portlet-body" style="padding: 0px;">
                <div class="vip_box" style="padding-top: 10px;">
                    <div class="form-c cf">
                        <label>名称：</label>
                        <input type="text" id ="roleName" name="roleName"  class="input-text input" id="name1">
                        <span class='help-inline' name="roleName"></span>
                    </div>
                      <div class="form-c cf">
                        <label>说明：</label>
                        <input type="text" name="remark"  class="input-text input" id="name1">
                        <span class='help-inline' name="remark"></span>
                    </div>
                  
					</div>
                <div class="form-actions" style="text-align: center;margin-top: 40px;">
                    <button type="button" onclick="funtest()" class="btn blue" id="addRole"><i class="icon-ok"></i> 提交</button>
                    <button type="reset" class="btn" id="removeRole" >取消</button>
                </div>
            </div>
        </div>
    </div>
</form>
<script type="text/javascript">
$(function(){
	//默认选中父级菜单
//	$("select option[value='${resourceId}']").attr("selected","selected");
})

function funtest(){
	if($("#roleName").val().trim() == ''){
		$("span[name='roleName']").html("<font>*请输入名称  </font>");
		$("#roleName").val("");
		return;	
	}
	$("#accountForm").submit();
}
</script>
</body>
</html>