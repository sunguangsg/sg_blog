<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<%@ include file="../common/mHeader.jsp" %>
<title>首页</title>
<style>
.show_iframe {
    bottom:50px;
}
</style>
</head>
<body>
 <div class="show_iframe">
        <div style="display:none" class="loading"></div>
        <iframe scrolling="yes" frameborder="0" src="<c:url value='/agent/mPersonalIndex'></c:url>"  name="main-iframe"></iframe>
  </div>
<div>
<div class="foot">
    <div class="foot_cont">
        <div class="info">
            <a href="<c:url value='/agent/mSpread'></c:url>" target="main-iframe"><i class="Hui-iconfont">&#xe6f1;</i>推广</a>
        </div>
        <div class="cash">
            <a href="<c:url value='/cash/mApplyCash/${loginUser.appid}/${loginUser.guid}'></c:url>" target="main-iframe"><i class="Hui-iconfont">&#xe6b7;</i>提现</a>
        </div>
         <div class="activity">
            <a href="<c:url value='/agentNotice/mNotice/${loginUser.appid}'></c:url>" target="main-iframe"> <i class="Hui-iconfont">&#xe60c;</i>公告</a>
        </div>
        <div class="our">
            <a href="<c:url value='/agent/mPersonalIndex'></c:url>"  target="main-iframe"> <i class="Hui-iconfont">&#xe60d;</i>我的</a>
        </div>
    </div>
    </div>
    </div>
<script type="text/javascript">

</script>
</body>
</html>