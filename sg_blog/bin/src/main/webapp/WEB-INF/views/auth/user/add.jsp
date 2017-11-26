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
<title>新增菜单</title>
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
  <form id="accountForm" action="<c:url value='/auth/user/insert'></c:url>"  method="post">
    <div class="page-container row-fluid">
        <div class="page-content">
            <div class="portlet-body" style="padding: 0px;">
                <div class="vip_box" style="padding-top: 10px;">
                    <div class="form-c cf">
                        <label>用户名：</label>
                        <input type="text" name="username"  class="input-text input" id="name2">
                        <span class='help-inline' name="username"></span>
                    </div>
                    <div class="form-c cf">
                        <label>密码：</label>
                        <input type="password" class="input-text input" value="" placeholder="" id="password" name="password"  maxlength="20" >
                        <span class='help-inline' name="password"></span>
                    </div>
                    <div class="form-c cf">
                        <label>APPID：</label>
                        <input type="text" class="input-text input" id="appid" name="appid"  maxlength="20" >
                        <span class='help-inline' name="appid"></span>
						<div class="form-c cf">
							<label>UID：</label> 
			             <input type="text" class="input-text input"  placeholder="" id="guid" name="guid">
							 <span class='help-inline' name="guid"></span>
						</div>
						<div class="form-c cf">
                        <label>真实姓名：</label>
                        <input type="text" class="input-text input" value="" placeholder="" id="realname" name="realname"  maxlength="20" >
                        <span class='help-inline' name="realname"></span>
                    	</div>
                    	<div class="form-c cf">
							<label>公司：</label> 
			             <input type="text" class="input-text input"  placeholder="" id="company" name="company"  >
							 <span class='help-inline' name="company"></span>
						</div>
						<div class="form-c cf">
							<label>地址：</label> 
			             <input type="text" class="input-text input"  placeholder="" id="address" name="address"  >
							 <span class='help-inline' name="address"></span>
						</div>
						<div class="form-c cf">
							<label>手机：</label> 
			             <input type="text" class="input-text input" value="" placeholder="" id="mobile" name="mobile"  >
							 <span class='help-inline' name="mobile"></span>
						</div>
						<div class="form-c cf">
							<label>QQ：</label> 
			             <input type="text" class="input-text input"  placeholder="" id="qq" name="qq"  >
							 <span class='help-inline' name="qq"></span>
						</div>
						<div class="form-c cf">
							<label>状态：</label> 
							<input type="radio" name="status" value="1" checked="checked">生效
							<input type="radio" name="status" value="2">禁用
					     <span class='help-inline' name="status"></span>
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
                    <button type="button" onclick="funtest()" class="btn blue" id="addRole"><i class="icon-ok"></i> 提交</button>
                    <button type="reset" class="btn" id="removeRole" >取消</button>
                </div>
            </div>
        </div>
    </div>
</form>
<script type="text/javascript">
	function funtest(){	
		if($("#name2").val().trim() == ''){
			$("span[name='username']").html("<font>*请输入用户名  </font>");
			$("#username").val("");
		 return;
		}
		
		if($("#password").val().trim() == ''){
			$("span[name='password']").html("<font>*请输入密码 </font>");
			$("#password").val("");
			return;
		}
	
		if($("#realname").val().trim() == ''){
			$("span[name='realname']").html("<font>*请输入真实姓名 </font>");
			$("#realname").val("");
			return;
		}
		
		if($("#mobile").val().trim() == ''){
			$("span[name='mobile']").html("<font>*请输入手机号 </font>");
			$("#mobile").val("");
			return;
		}
		var appid=$("#appid").val().trim();
		if(appid==""){
			$("#appid").attr("value",0);
		}
		$("#accountForm").submit();
	}
</script>
</body>
</html>