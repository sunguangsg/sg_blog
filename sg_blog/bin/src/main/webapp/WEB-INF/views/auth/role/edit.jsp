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

<title>编辑角色</title>
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
  <form id="accountForm" action="<c:url value='/auth/role/update'></c:url>"  method="post">
    <div class="page-container row-fluid">
        <div class="page-content">
            <div class="portlet-body" style="padding: 0px;">
                <div class="vip_box" style="padding-top: 10px;">
                 <div class="form-c cf">
                        <label>角色ID</label>
                        <input type="text" name="roleId" value="${role.roleId}"  class="input-text input" id="roleId" readonly="readonly">
                        <span class='help-inline' name="name"></span>
                    </div>
                    <div class="form-c cf">
                        <label>名称：</label>
                        <input type="text" name="roleName" value="${role.roleName}"  class="input-text input" id="name1">
                        <span class='help-inline' name="name"></span>
                    </div>
                       <div class="form-c cf">
                        <label>说明：</label>
                        <input type="text" name="remark" value="${role.remark}"  class="input-text input" id="name1">
                        <span class='help-inline' name="name"></span>
                    </div>
                 
					</div>
                <div class="form-actions" style="text-align: center;margin-top: 40px;">
                    <button type="submit"  class="btn blue" id="addRole"><i class="icon-ok"></i> 提交</button>
                </div>
            </div>
        </div>
    </div>
</form>

</body>
</html>