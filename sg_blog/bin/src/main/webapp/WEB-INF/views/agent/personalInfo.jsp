<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<%@ include file="../common/header.jsp" %>
<title>个人中心</title>
<style>
body {
	background: #F5F6F6;
}
.person{
	border-bottom: 1px solid #ccc;
	padding-bottom: 20px;
	padding-left: 60px;
	background: #EDEDEA;
    padding-top: 15px;
}
.person div {
	margin: 10px 0;
}
.person div span:nth-child(1){
	margin-right: 20px;
}
.person div:nth-child(3) span:nth-child(1) {
	margin-left: 26px;
}
  .person .remain a {
  	margin-left: 40px;
  	color: #DC143C;
  }
  a:hover {
  	text-decoration: none;
  	color: blue;
  }
.personP .ul {
	float:left;
	width: 100%;
	border-bottom: 1px solid #ccc;
	background: #EDEDEA;

}
.personP .ul .li {
	float:left;
	margin: 15px 0;
	width: 25%;
	/* margin: 10px 30px; */
    text-align: center;
}
.personP .li ul {
	margin:15px;
}
.personP .li ul li {
	margin: 10px 0;
}
 .dataTime .ul li,
 {
	float:left;
}
 .floatL li {
	float:left;
	width: 25%;
    text-align: center;
    padding:10px 0;
}

/* .hover:hover {
	margin:10px 0;
	font-size:20px;
} */
 .hover li a:hover{
	color:#DC143C ! important ;
}
/* .height {
	height: 128px;
	overflow: auto;
} */
@media (max-width: 450px){
.person{
	padding-left: 10px;
}
.personP .ul .li {
    width: 30%;
}
.personP .li ul {
	margin:10px;
}
}
</style>

<script type="text/javascript">
function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
</script>
</head>
<body>
	<nav class="breadcrumb">
	    <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" >
	       <i class="Hui-iconfont">&#xe68f;</i>
	    </a>
	</nav>
	<div class="page-container">
		<div class="mt-20 clearfix" >
	       <div style="width:100%;" class="personP" >
		       <div class="person">
			       <div class="agents">
			       	  <span>代理UID：</span><span>${sessionUser.guid}</span><br>

			       </div>
			       <div class="gamName">
			       	  <span>游戏昵称：</span><span>${sessionUser.realname}</span>
			       </div>
			       <div class="remain">
			         	<span>余额：</span><span>${agentInfo.balance/100}元</span>
			         	<a onclick="member_edit('提现','<c:url value='/cash/applyCash/${sessionUser.appid}/${sessionUser.guid}'></c:url>','4','','510')"">提现</a>
			        </div>
		       </div>
		    </div>
	    </div>
    </div>
</body>
</html>
