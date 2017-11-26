<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<%@ include file="../../common/mHeader.jsp" %>
<title>忘记密码</title>
<style>
/* .btn-success {background-color: #5A98DE; border-color: #5A98DE;} */
 .btn {
    margin: 0 10px;
   }
.help-inline{display: block;}
   .input-text[type="number"] {
    width:35%;
    padding-left:3%;
}
.sendInfo {
    margin-right: 27%;
   }
   .col-xs-offset-3 { margin-left: 26%;}
</style>
</head>
<body>
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="loginWraper">
  <div id="loginform" class="PasswordBox">
    <form id="forgetform" class="form form-horizontal" action='<c:url value='/editforpwd'/>' method="post" style="width: 405px;" >
    <input type="hidden" id="appid" name="appid" value="${appid}"/>
      <div class="row cl marginTop">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-xs-8">
          <input id="username" name="username" type="text"  class="input-text size-L" placeholder="用户名">
           <span class='help-inline' name="username">${usernameErro} </span>
        </div>
      </div>
      <div class="row cl marginTop">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe696;</i></label>
        <div class="formControls col-xs-8">
          <input id="mobile" name="mobile" type="text"  class="input-text size-L" placeholder="手机号">
          <span class='help-inline' name="mobile">${phoneErro }</span>
        </div>
      </div>
       <div class="row cl marginTop">
        <label class="form-label col-xs-3"></label>
        <div class="formControls col-xs-8">
         <input type="number" maxlength="6" id="code" name="code"  class="input-text input" placeholder="请输入验证码">
                <input name="sendInfo" onclick="sendSms(this);" type="button"  class="input-text size- sendInfo" id="sendInfo"  style= "width: 37%;padding-left: 3%;" value="获取验证码"/>
        	 	<span class='help-inline' name="sendInfo">${codeErro }</span>
        </div>
      </div>
      <div class="row cl marginTop">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe63f;</i></label>
        <div class="formControls col-xs-8">
          <input id="password" name="password" type="password" class="input-text size-L" placeholder="新密码">
          <span class='help-inline' name="password">${passwordErro }</span>
        </div>
      </div>
      <div class="row cl marginTop">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe63f;</i></label>
        <div class="formControls col-xs-8">
          <input id="newpwd" name="newpwd" type="password" class="input-text size-L" placeholder="再次确认密码" >
          <span class='help-inline' name="newpwd">${newpwdErro }</span>
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3 marginLeftL">
          <input name="register" type="button" onclick="funtext()" class="btn btn-success radius size-L" id="register"   value="&nbsp;确&nbsp;&nbsp;&nbsp;&nbsp;定&nbsp;">
          <!-- <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;"> -->
          <a href="javascript:history.go(-1)" id="restest" class="btn btn-default radius size-L">&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;</a>
        </div>
      </div>
        <input type="hidden" name="appid" value="${appid}">
    </form>
  </div>
</div>

<script type="text/javascript">
function sendSms(thisBtn) {
	var mobile = $("#mobile").val();
	var username = $("#username").val();
	var appid = $("#appid").val();
			$.ajax({
				type: "POST", // 用POST方式传输
				url:"<c:url value='/phoneSms'/>", // 目标地址
				data: {'mobile':mobile, 'appid':appid,'username':username},
				dataType: "json",
				 success: function(data){
	            		// sendCodeCallBack(thisBtn);
	            		if(data.code == 0){
	            			sendCodeCallBack(thisBtn);
	            		}else if(data.code ==2){
	            			$("span[name='username']").html("<font>*用户名输入有误 </font>");
	            		}else if(data.code == 1){
	            			$("span[name='mobile']").html("<font>*手机号不匹配  </font>");
	            		}else{
	            			$("span[name='sendInfo']").html("<font>*正在发送   </font>");
	            		}
	             },
				error: function (XMLHttpRequest, textStatus, errorThrown) { 
// 					alert("发送失败 ")
// 					alert(XMLHttpRequest.status);  
// 					alert(XMLHttpRequest.readyState);  
// 					alert(textStatus);  
				}
				 
			}); 
	

		    }  
		    
//定时器
var clock = '';
var nums = 90;
var btn;
function sendCodeCallBack(thisBtn){ 
btn = thisBtn;
btn.disabled = true; //将按钮置为不可点击
btn.value = nums+'秒后可重新获取';
clock = setInterval(doLoop, 1000); //一秒执行一次
}
function doLoop(){
nums--;
if(nums > 0){
 btn.value = nums+'秒后再次获取 ';
}else{
 clearInterval(clock); //清除js定时器
 btn.disabled = false;
 btn.value = '点击获取验证码';
 nums = 90; //重置时间
}
}

function funtext(){
	if($("#username").val().trim()==''){
		$("span[name='username']").html("<font>* 请输入用户名  </font>");
		$("#username").val("");
		return;
	}
	
	if($("#username").val().trim()==''){
		$("span[name='username']").html("<font>* 请输入用户名  </font>");
		$("#username").val("");
		return;
	}
	if($("#password").val().trim()==''){
		$("span[name='password']").html("<font>* 密码不能为空   </font>");
		$("#password").val("");
		return;
	}
	if($("#newpwd").val().trim()==''){
		$("span[name='newpwd']").html("<font>* 请再次确认密码   </font>");
		$("#newpwd").val("");
		return;
	}
	if($("#password").val().trim() != $("#newpwd").val().trim() ){
		$("span[name='password']").html("<font>* 两次密码输入不一致   </font>");
		$("#password").val("");
	}
	$("#forgetform").submit();
	
}


var wait=60;
function time(o) {
  if (wait == 0) {
   o.removeAttribute("disabled");
   o.value="获取短信验证码";
   wait = 60;
  } else {

   o.setAttribute("disabled", true);
   o.value="重新发送(" + wait + ")";
   wait--;
   setTimeout(function() {
    time(o)
   },
   1000)
  }
 }
/* document.getElementById("sendInfo").onclick=function(){time(this);} */
</script>
</body>
</html>