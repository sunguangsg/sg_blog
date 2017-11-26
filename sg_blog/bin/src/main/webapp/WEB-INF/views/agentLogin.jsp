<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/taglib.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" type="text/css" href="<c:url value='/static/mobile/css/h-ui/css/H-ui.min.css'></c:url>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/static/mobile/css/Hui-iconfont/iconfont.css'></c:url>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/static/mobile/css/h-ui.admin/css/H-ui.login.css'></c:url>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/static/mobile/css/h-ui.admin/css/style.css'></c:url>" />
<title>登录</title>
<style>
  .btn.size-L {
    padding: 12px 60px;
}
@media (max-width:320px) {
  form {
    margin-top:30px;
    margin-left: 8%;
}
.marginLeftL {
    margin-left: 35%;
}
}
@media (min-width:321px){
form {
    margin-top:80px;
}

}
@media (max-width: 767px){

.loginBox .input-text {
    width: 100%;
}
}
</style>
</head>
<body>
<div class="loginWraper">
  <div id="loginform" class="loginBox">
    <form class="form form-horizontal" action='<c:url value='/doAgentLogin'></c:url>' method="post">
      <span >${msg}</span><br><br>
    <span>Username</span>
      <div class="row cl marginTop">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-xs-8">
          <input  name="username" type="text" placeholder="账户" class="input-text size-L">
        </div>
      </div>
      <span>Password</span>
      <div class="row cl marginTop">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-xs-8">
          <input id="" name="password" type="password" placeholder="密码" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <label for="online" style="width:70px;">
            <input type="checkbox" name="online" id="online" value="">记住我
            </label>
            <label for="online" style="width:70px;">
             <a href="<c:url value='/forgetPWD/${appid}'></c:url>">忘记密码</a>
            </label>
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3 marginLeftL">
          <input name="" type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
        <!--   <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;"> -->
        </div>
      </div>
      <input type="hidden" name="appid" value="${appid}">
    </form>
  </div>
</div>
<script type="text/javascript" src="<c:url value='/static/mobile/js/lib/jquery/jquery.min.js'></c:url>"></script>
<script type="text/javascript" src="<c:url value='/static/mobile/js/lib/flexible/flexible.js'></c:url>"></script>
</body>
</html>