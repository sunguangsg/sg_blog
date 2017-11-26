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
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="<c:url value='/static/css/Hui-iconfont/iconfont.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/static/css/h-ui/css/H-ui.min.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/static/css/h-ui.admin/css/H-ui.admin.css'/>" />
<!--[if IE 6]>
<script type="text/javascript" src="<c:url value='/static/js/lib/DD_belatedPNG_0.0.8a-min.js'/>" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>403页面</title>
</head>
<body>
<section class="container-fluid page-404 minWP text-c">
	<p class="error-title"><i class="Hui-iconfont va-m" style="font-size:80px">&#xe688;</i>
		<span class="va-m">403</span>
	</p>
	<p class="error-description">不好意思，您的权限不足~</p>
	<p class="error-info">您可以：
		<a href="javascript:;" onclick="history.go(-1)" class="c-primary">&lt; 返回上一页</a>
			<!--<span class="ml-20">|</span>
	 <a href="/" class="c-primary ml-20">去首页 &gt;</a> -->
	</p>
</section>
</body>
</html>