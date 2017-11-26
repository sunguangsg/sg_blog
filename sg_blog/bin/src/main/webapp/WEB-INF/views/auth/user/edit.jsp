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
<title>编辑菜单</title>
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
  <form id="accountForm" action="<c:url value='/auth/user/update'></c:url>"  method="post">
    <div class="page-container row-fluid">
        <div class="page-content">
            <div class="portlet-body" style="padding: 0px;">
                <div class="vip_box" style="padding-top: 10px;">
                 <div class="form-c cf">
                        <label>用户ID</label>
                        <input type="text" name="userId" value="${authUser.userId}"  class="input-text input"  readonly="readonly">
                        <span class='help-inline' name="name"></span>
                    </div>
                    <div class="form-c cf">
                        <label>用户名称：</label>
                        <input type="text" name="username" value="${authUser.username}"  class="input-text input" id="name1">
                        <span class='help-inline' name="name"></span>
                    </div>
                      <div class="form-c cf">
                        <label>APPID</label>
                        <input type="text" name="appid" value="${authUser.appid}"  class="input-text input"  readonly="readonly">
                        <span class='help-inline' name="name"></span>
                    </div>
                    <div class="form-c cf">
                        <label>真实姓名：</label>
                        <input type="text" name="realname" value="${authUser.realname}"  class="input-text input" id="name2">
                        <span class='help-inline' name="href"></span>
                    </div>
                    <div class="form-c cf">
                        <label>UID：</label>
                        <input type="text" name="guid"  class="input-text input" value="${authUser.guid}" placeholder="" id="cardNo"  maxlength="20" readonly="readonly" >
                        <span class='help-inline' name="icon"></span>
                    </div>
                    <div class="form-c cf">
                        <label>公司：</label>
                        <input type="text" name="company"  class="input-text input" value="${authUser.company}" placeholder="" id="cardNo"  maxlength="20" >
                        <span class='help-inline' name="icon"></span>
                    </div>
                    <div class="form-c cf">
                        <label>地址：</label>
                        <input type="text" name="address"  class="input-text input" value="${authUser.address}" placeholder="" id="cardNo"  maxlength="20" >
                        <span class='help-inline' name="icon"></span>
                    </div>
                    <div class="form-c cf">
                        <label>手机：</label>
                        <input type="text" name="mobile"  class="input-text input" value="${authUser.mobile}" placeholder="" id="cardNo"  maxlength="20" >
                        <span class='help-inline' name="icon"></span>
                    </div>
                    <div class="form-c cf">
                        <label>QQ：</label>
                        <input type="text" name="qq"  class="input-text input" value="${authUser.qq}" placeholder="" id="cardNo"  maxlength="20" >
                        <span class='help-inline' name="icon"></span>
                    </div>
                    <div class="form-c cf">
							<label>状态：</label> 
								<input type="radio" name="status" value="1" checked="checked">生效
								<input type="radio" name="status" value="2">禁用
					     <span class='help-inline' name="type"></span>
					</div>
					<div class="form-c cf">
							<label>角色：</label>
							<c:forEach var="item" items="${roleList}">
								<input name=roleIDs type="checkbox" value="${item.roleId }">${item.roleName}
						</c:forEach>
							<span class='help-inline' name="type"></span>
						</div>
					</div>
                <div class="form-actions" style="text-align: center;margin-top: 40px;">
                 <button type="submit"  class="btn blue" ><i class="icon-ok"></i> 提交</button>
                </div>
            </div>
        </div>
    </div>
</form>
<script type="text/javascript">

</script>
</body>
</html>