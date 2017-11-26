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

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />


<title>后台登录</title>
<style>
  .loginBox{  height:400px;}
  .formControls .input-text {padding-left: 41px; ! important} 
</style>
</head>
<body>
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="loginWraper">
  <div id="loginform" class="loginBox">

    <form id="relogin" class="form form-horizontal" action="<c:url value='/updateModifyPWD'></c:url>" method="post" style="width: 405px;">


          <input id="userId" name="userId" type="hidden" readonly="readonly" placeholder="账户" class="input-text size-L" value="${authuser.userId}">
   
      <div class="row cl marginTop">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe63f;</i></label>
        <div class="formControls col-xs-8">
          <input id="password" name="password" type="password" placeholder="旧密码" class="input-text size-L">
          <span class='help-inline' name="password">${passwordErro }</span>
        </div>
      </div>
      <div class="row cl marginTop">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe63f;</i></label>
        <div class="formControls col-xs-8">
          <input id="newpassword" name="newpassword" type="password" placeholder="新密码" class="input-text size-L">
          <span class='help-inline' name="newpassword">${newpasswordErro }</span>
        </div>
      </div>
      <div class="row cl marginTop">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe63f;</i></label>
        <div class="formControls col-xs-8">
          <input id="renewpwd" name="renewpwd" type="password" placeholder="再输入一次新密码" class="input-text size-L">
          <span class='help-inline' name="renewpwd">${renewpwdErro }</span>
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input id="loging" name="loging" type="button" onclick="funtest()" class="btn btn-success radius size-L" value="&nbsp;提&nbsp;&nbsp;&nbsp;&nbsp;交&nbsp;">
       	 <input id="reset" name="reset" type="reset" class="btn btn-success radius size-L" value="&nbsp;重&nbsp;&nbsp;&nbsp;&nbsp;置&nbsp;">
       	 
        </div>
      </div>
    </form>
  </div>
</div>
<script type="text/javascript">
	function funtest(){
		if($("#password").val().trim()==''){
			$("span[name='password']").html("<font>* 请输入旧密码 </font>");
			$("#password").val("");
			return;
		}
		if($("#newpassword").val().trim()==''){
			$("span[name='newpassword']").html("<font>* 请输入新密码 </font>");
			$("#newpassword").val("");
			return;
		}
		if($("#renewpwd").val().trim()==''){
			$("span[name='renewpwd']").html("<font>* 请再次确认密码  </font>");
			$("#renewpwd").val("");
			return;
		}
		$("#relogin").submit();
		
	}

</script>
</body>
</html>