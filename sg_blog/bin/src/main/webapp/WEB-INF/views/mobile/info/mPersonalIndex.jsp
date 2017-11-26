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

<title>个人中心</title>
<style>
body {
	background: #F5F6F6;
}
 .mybtn {
    width:100%;
    height:30px;
}
 .mybtn a {
    display: block;
    width: 25%;
    background:#EDEDEA;
    float:left;
    text-align:center;
    position:relative;
    padding-top: 40px;
    padding-bottom: 9px;
    margin-bottom: 10px;
}
.mybtn a i {
    font-size: .8rem;
    position: absolute;
    top: 2px;
    color: #778899;
    left: 26px;
}
</style>
</head>
<body class="overflowA">
	<nav class="breadcrumb clearfix">我的信息
      <a  href="javascript:void();" onclick="modifyPWD(${sessionUser.userId})" style ="float:right;">修改密码</a>
    </nav>
	<div class="page-container">
		<div class="mt-20 clearfix" >
	       <div style="width:100%;" class="personP" >
    		       <div class="person ">
                        <div class="basemsg ">
                              <span><i class="Hui-iconfont">&#xe63c;</i>账户信息</span><br>
                        </div>
                        <div class="clearfix">
                            <ul class="floatL" >
                                 <li>UID: <span>${sessionUser.guid}</span></li>
                                 <li>代理UID : <span>${userInfo.superGuid}</span></li>
                                 <li>手机号 ：<span class="phone">${sessionUser.mobile}</span></li>
                                 <li>账户(元): <span>${agentInfo.balance/100}</span></li>
                            </ul>
                           <ul class="floatL ">
                                 <li>真实姓名 : <span>${sessionUser.realname}</span></li>
                                 <li>绑定微信: 
                                  <c:if test="${agentInfo.openid==null||agentInfo.openid==''}">
									<span>未绑定</span>
								   </c:if> 
								 <c:if test="${agentInfo.openid!=null&&agentInfo.openid!=''}">
									<span>已绑定</span>
								   </c:if> 
							    </li>
                                 <li>状态 : 
                                 <c:if test="${agentInfo.state==0}">
                                 <span>正常</span>
                                 </c:if>
                                  <c:if test="${agentInfo.state==1}">
                                 <span>已冻结</span>
                                 </c:if>
                                </li>
                                 <li>冻结(元) : 
                                 <span>${agentInfo.freeze/100}</span>
                                </li>
                              <%-- <li><a style="color:red;" href="<c:url value='/cash/mApplyCash/${sessionUser.appid}/${sessionUser.guid}'></c:url>">提现</a></li>--%>                           </ul>
                        </div>
    		       </div>
               <div class="mybtn">
                   <a href="<c:url value='/order/income/mList/'></c:url>"><i class="Hui-iconfont">&#xe63a;</i>我的收益</a>
                   <a href="<c:url value='/analysis/agent/mAgentDailyData/${sessionUser.appid}/${sessionUser.guid}'/>" style="margin: 0 12%;"><i class="Hui-iconfont">&#xe621;</i>每日数据</a>
                   <a href="<c:url value='/agent/mPersonalInfo'></c:url>"><i class="Hui-iconfont">&#xe705;</i>个人信息</a>
                    <a href="<c:url value='/userinfo/mList/'></c:url>" ><i class="Hui-iconfont">&#xe667;</i>玩家列表</a>
                    <a href="<c:url value='/order/mList/'></c:url>" style="margin: 0 12%;"><i class="Hui-iconfont">&#xe687;</i>订单</a>
               </div>


		    </div>
	    </div>
</div>
<div class="exit_out " >
    <a onclick="logout(${sessionUser.appid})" class="exit"  >
        退&nbsp;&nbsp;出&nbsp;&nbsp;登&nbsp;&nbsp;录
    </a>
</div>
<script type="text/javascript">
function logout(appid){
	window.parent.location.href="<c:url value='/agentLogout/"+appid+"'></c:url>"
}
function modifyPWD(userId){
	window.parent.location.href="<c:url value='/auth/user/editPage/'></c:url>"+userId
}
</script>
</body>
</html>