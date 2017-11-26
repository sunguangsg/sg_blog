<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="jslib/html5shiv.js"></script>
<script type="text/javascript" src="jslib/respond.min.js"></script>
<![endif]-->

<!--[if IE 6]>
<script type="text/javascript" src="jslib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<%@ include file="common/header.jsp" %>
<title>代理系统</title>
<style>
 @media (max-width: 767px){
.hhiden {
	display:block ! important;
}
#Hui-userbar .cl {
	float:left;
	width:100%;
}
.navbar-nav>ul>li.dropDown.open>.dropDown-menu {
	display: block;
}
  #Hui-userbar .cl >li {
	float:left;
	width: 58%;
}

#Hui-userbar {
      right: 90px;
    top: 0px;
    width: 37%;
}
@media (min-width:765px) and (max-width: 787px){
.hhiden {
	display:block ! important;
}
}
#layui-layerl {
    width:100px ! important ;
    height: 100px ! important ;
}
</style>
</head>
<body>
<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl">
			<span class="logo navbar-slogan f-l mr-10 hidden-xs ">余额:<span>${agentDto.balance/100}元</span></span>
			 <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
			<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs hhiden">
			    	<ul class="cl">
					<li class="dropDown dropDown_hover" >
						<a href="#" class="dropDown_A" >${authUser.username} <i class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li>
						<%-- <a onclick="member_edit('修改密码','<c:url value='/Modify/${authUser.userId}'/>','4','','510')" >修改密码</a> --%>
								<a href='<c:url value='/Modify/${authUser.userId}'/>'>修改密码</a>
								</li>
								<li><a href='<c:url value="/login"></c:url>'>切换账户</a></li>
								<li><a href="<c:url value="/logout"></c:url>">退出</a></li>
					</ul>
				</li>
			</ul>
			    
		</nav>
	</div>
</div>
</header>
<aside class="Hui-aside">
	<div class="menu_dropdown bk_2">
			<c:forEach var="menu" items="${sessionMenu}">
			    <c:if test="${menu.parentId ==-1}">
					<dl id="menu-system">
						<dt>${menu.name }<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
						</dt>
						<dd>
							<ul>
								<c:forEach var="menutemp" items="${sessionMenu}">
									<c:if test="${menutemp.parentId== menu.resourceId}">
										<li><a data-href="<c:url value='${menutemp.href}'></c:url>" data-title="${menutemp.name}" >${menutemp.name}</a></li>
									</c:if>
								</c:forEach>
							</ul>
						</dd>
					</dl>
				</c:if>
			</c:forEach>
		</div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
	<section class="Hui-article-box">
		<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
			<div class="Hui-tabNav-wp">
				<ul id="min_title_list" class="acrossTab cl">
				<li class="active">
					<span title="个人中心" data-href="<c:url value='/agent/personalInfo'></c:url>">个人中心</span>
					<em></em></li>
				</ul>
			</div>
			<div class="Hui-tabNav-more btn-group">
				<a id="js-tabNav-prev" class="btn radius btn-default size-S"
					href="javascript:;"> <i class="Hui-iconfont">&#xe6d4;</i>
				</a> <a id="js-tabNav-next" class="btn radius btn-default size-S"
					href="javascript:;"> <i class="Hui-iconfont">&#xe6d7;</i>
				</a>
			</div>
		</div>
		<div id="iframe_box" class="Hui-article">
			<div class="show_iframe">
				<div style="display: none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="<c:url value='/agent/personalInfo'></c:url>"></iframe>
			</div>
		</div>
	</section>

	<div class="contextMenu" id="Huiadminmenu">
	<ul>
		<li id="closethis">关闭当前 </li>
		<li id="closeall">关闭全部 </li>
</ul>
</div>
<!--_footer 作为公共模版分离出去-->
<%-- <script type="text/javascript" src="${ctx}/js/lib/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/js/lib/layer/layer.js"></script>
<script type="text/javascript" src="${ctx}/js/h-ui/H-ui.min.js"></script>
 <script type="text/javascript" src="${ctx}/js/h-ui.admin/H-ui.admin.js"></script> --%>
<script type="text/javascript">
function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}

function click() {
	$(".dropDown-menu").css("display","block");
}


/*个人信息*/
function myselfinfo(){
	layer.open({
		type: 1,
		area: ['300px','200px'],
		fix: false, //不固定
		maxmin: true,
		shade:0.4,
		title: '查看信息',
		content: '<div>管理员信息</div>'
	});
}

</script>
</body>
</html>