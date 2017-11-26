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
<title>个人信息</title>
<style>

.person {
  margin-bottom:0;
  border-bottom:none;
}
.person .wid2 {
  width:100%;
}
</style>
</head>
<body>
<nav class="breadcrumb clearfix">个人信息 </nav>
  <div class="page-container">
    <div class="mt-20 clearfix" >
         <div style="width:100%;" class="personP" >
         <div class="person clearfix">
                   <ul class="floatL">
                     <li>UID:<span>${sessionUser.guid}</span></li>
                     <li>真实姓名:<span>${sessionUser.realname}</span></li>
                     <li>手机号:<span>${sessionUser.mobile}</span></li>
                     
                   </ul>
                   <ul class="floatL">
                   <li>用户名:<span>${sessionUser.guid}</span></li>
                    
                     <li>QQ:<span>${sessionUser.qq}</span></li>
                     
                   </ul>
                    <ul class="floatL wid2">
                       <li>注册时间:<span><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${sessionUser.regTime}"/></span></li>
                       <li>登录时间:<span><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${sessionUser.loginTime}"/></span></li>
                      
                       <li>地址:<span>${sessionUser.address}</span></li>
                   </ul>
           </div>
            <div class="person clearfix" style="padding-top:0;">
              <c:if test="${agentInfo.openid==null||agentInfo.openid==''}">
								     <button onclick="bindWXHref()" type="button" class="btn blue borderR" id="btnFadein" ">绑定微信号</button>
								     <p style="margin:5px 0;"> 绑定微信号可进行提现操作,提现金额直接放入钱包</p>
				</c:if> 
			 <c:if test="${agentInfo.openid!=null&&agentInfo.openid!=''}">
									<span>已绑定微信</span>
				 </c:if>
           </div>
        </div>
      </div>
    </div>
<script type="text/javascript">
var appid=${sessionUser.appid}
var guid=${sessionUser.guid}
$(document).ready(function(){
$("#btnFadein").bind("click",Fadein); //为btnFadein绑定click时间
$("#btnFadeout").bind("click",Fadeout); //为btnFadeout绑定click时间
})

function Fadein(){
$("#fade").slideDown("slow"); //滑入
}

function Fadeout(){
$("#fade").slideUp("slow"); //滑出
}

function bindWXHref(){
window.location.href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx378b6fc928d3e4fa&redirect_uri=http://agent.sunyoo51.com/agent/agent/getOpenid/"+appid+"/"+guid+"&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect"
}
</script>
</body>
</html>