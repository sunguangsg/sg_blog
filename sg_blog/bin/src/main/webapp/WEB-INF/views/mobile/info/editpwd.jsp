<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<%@ include file="../../common/mHeader.jsp" %>
<title>修改密码</title>
<style>
/* .btn-success {background-color: #5A98DE; border-color: #5A98DE;} */
.help-inline{display: block;}

.row cl{ margin-bottom: 30%;}
@media (min-width: 322px) and (max-width:450px){
form {
    margin-top: 30%;
    margin-left: 9%;
} }
</style>
</head>
<body>
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="loginWraper">
  <div id="loginform" class="PasswordBox">
    <form class="form form-horizontal" id="resetform" action="<c:url value='/auth/user/resetPWD'></c:url>" method="post" style="width: 405px;" submit="return check();">   
          <input id="userId" name="userId" type="hidden" value="${userId}" class="input-text size-L" placeholder="用户Id">
              <span class='help-inline' name="userId"></span>
          <input id="username" name="username" type="hidden" readonly="readonly" class="input-text size-L" placeholder="用户名" >
             <span class='help-inline' name="username">${usernameErro }</span>
      <div class="row cl marginTop">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe63f;</i></label>
        <div class="formControls col-xs-8">
          <input id="password" name="password" type="password"  class="input-text size-L" placeholder="旧密码">
          <span class='help-inline' name="password">${passwordErro }</span>
        </div>
      </div>
      <div class="row cl marginTop">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe63f;</i></label>
        <div class="formControls col-xs-8">
          <input id="newPWD" name="newPWD" type="password" class="input-text size-L" placeholder="新密码">
          <span class='help-inline' name="newPWD">${newPWDErro }</span>
        </div>
      </div>
      <div class="row cl marginTop">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe63f;</i></label>
        <div class="formControls col-xs-8">
          <input id="renewPWD" name="renewPWD" type="password" class="input-text size-L" placeholder="再次确认密码" >
          <span class='help-inline' name="renewPWD"></span>
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3 marginLeftL">
          <input name="register" type="button" onclick="funtext()" class="btn btn-success radius size-L" id="register" value="&nbsp;确&nbsp;&nbsp;&nbsp;&nbsp;定&nbsp;">
          <!-- <input id="restest" name="restest" type="button" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;"> -->
          <a href="javascript:history.go(-1)" id="restest" class="btn btn-default radius size-L">&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;</a>
        </div>
      </div>
    </form>
  </div>
</div>
<script type="text/javascript">
function funtext(){
		if($("#password").val().trim()==''){
			$("span[name='password']").html("<font>* 请输入旧密码 </font>");
			$("#newPWD1").val("");
			return;
		}
		if($("#newPWD").val().trim()==''){
			$("span[name='newPWD']").html("<font>* 请输入新密码  </font>");
			$("#newPWD").val("");
			return;
		}
		
		if($("#newPWD").val().trim().length < 6){
		    $("span[name='newPWD']").html("<font>* 请输入不少于6位密码</font>");
		    $("#newPWD").val("");
			return;
		}
		
		if($("#renewPWD").val().trim() == ''){
		    $("span[name='renewPWD']").html("<font>* 请输入确认密码 </font>");
		    $("#newPWD").val("");
			return;
		}
		
		if($("#renewPWD").val().trim() != $("#newPWD").val().trim() ){
		    $("span[name='newPWD']").html("<font>* 俩次输入密码不一致 </font>");
		    $("#newPWD").val("");
			return;
		}
		
		$("#resetform").submit();
		
	}
	
</script>
</body>
</html>