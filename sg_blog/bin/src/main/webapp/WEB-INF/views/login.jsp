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
<!--[if lt IE 9]>
<script type="text/javascript" src="../jslib/html5shiv.js"></script>
<script type="text/javascript" src="../jslib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="<c:url value='/static/css/h-ui/css/H-ui.min.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/static/css/Hui-iconfont/iconfont.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/static/css/h-ui.admin/css/H-ui.login.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/static/css/h-ui.admin/css/style.css'/>" />
<!--[if IE 6]>
<script type="text/javascript" src="../jslib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>后台登录</title>
</head>
<body>
<div class="loginWraper">
  <div id="loginform" class="loginBox">
          <span >${msg}</span>
    <form class="form form-horizontal" action="<c:url value='/doLogin'></c:url>" method="post" style="width: 405px;">
    <span>Username</span>
      <div class="row cl marginTop">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-xs-8">
          <input id="username" name="username" type="text" placeholder="账户" class="input-text size-L">
        </div>
      </div>
      <span>Password</span>
      <div class="row cl marginTop">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-xs-8">
          <input id="password" name="password" type="password" placeholder="密码" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <label for="online">
           <input type="checkbox" name="online" id="online" value="">记住我  </label>   <a href="###" style="margin-left:40px;">忘记密码</a>
        </div>
      
      </div>
        <div class="row cl">
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input name="" type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
          <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
        </div>
      </div>
    </form>
  </div>
</div>
<script type="text/javascript" src="<c:url value='/static/js/lib/jquery/jquery.min.js'></c:url>"></script>
<script type="text/javascript" src="<c:url value='/static/js/h-ui/H-ui.min.js'></c:url>"></script>

</body>
</html>