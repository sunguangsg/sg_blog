<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<%@ include file="../../common/mHeader.jsp" %>
<title>提现申请</title>
<style type="text/css" media="screen">
	.cf {
       margin-top:30px;
	}
   .blue {
    background: #5a98de;
    color: #fff;
   }
  .form {
    margin:0;
    margin-top:0;
    margin-left:0;
}
</style>
</head>
<body>
	<nav class="breadcrumb clearfix">余额提现
		<a  href="<c:url value='/cash/mMyCashRecord'></c:url>" style="float: right;">提现记录</a>
	</nav>
   <form id="agentCashApplysub" action="<c:url value='/cash/mInserApply'/>"  method="post">
	<div class="page-container row-fluid">
		<div class="page-content">
			<div class="portlet-body" style="padding: 0px;">
				<div class="vip_box">
				<div class="form-c ">
				<label class="marginLeft"><span class="c-red" style="margin-left: 14%;">余额：</span> </label><span class="c-red">${balance/100}元</span>
				</div>
          <div class="form-c cf">
            <label class="marginLeft"><span class="c-red" style="color: red;">*</span>提现金额：</label>
            <input type="text" maxlength="11" id="totalFee" name="totalFee"  class="input-text input" placeholder="金额(元)">
          </div>
					<div class="form-c cf">
              <label><span class="c-red" style="color: red;">*</span>手机号：</label>
              <input id="mobile" value="${authUser.mobile}"  type="tel" class="input-text input"   id="phone" name="mobile"  placeholder="手机号" readonly="readonly" >
          </div>
          <div class="form-c cf">
              <label><span class="c-red" style="color: red;" >*</span>验证码：</label>
               <input type="number" maxlength="6" id="checkCode" name="checkCode"  class="input-text input" placeholder="验证码">
                <input onclick="sendCode(this,${authUser.userId});" type="button"  class="input-text size- sendInfo borderR" id="sendInfo" value="获取验证码">
          </div>
				</div>
				<div class="form-actions" style="text-align: center;margin-top: 40px;">
					<button id="formSub" type="submit" class="btn blue borderR" id="addRole"><i class="icon-ok"></i> 确&nbsp;定&nbsp;提&nbsp;现</button>
				</div>
			</div>
		</div>
	</div>
		<input type="hidden" name="appid" value="${authUser.appid}"> 
	<input type="hidden" name="guid" value="${authUser.guid}">
</form>
<script type="text/javascript">
function sendCode(thisBtn,userId){
	var mobile=$("#mobile").val().trim();
	if(mobile==''){
		return;
	}else{
		$.ajax({
	             type: "post",
	             url: "<c:url value='/cash/sendCheckCode'></c:url>",
	             data: {'userId':userId, 'mobile':mobile},
	             dataType: "json",
	             success: function(data){
	            	 if(data.code==420){
	            		 sendCodeCallBack(thisBtn);
	            	 }
	             }
	         });
	}
};
//定时器
var clock = '';
var nums = 90;
var btn;
function sendCodeCallBack(thisBtn){ 
btn = thisBtn;
btn.disabled = true; //将按钮置为不可点击
btn.value = nums+'秒后重新获取';
clock = setInterval(doLoop, 1000); //一秒执行一次
}
function doLoop(){
nums--;
if(nums > 0){
 btn.value = nums+'秒后重新获取';
}else{
 clearInterval(clock); //清除js定时器
 btn.disabled = false;
 btn.value = '点击获取验证码';
 nums = 90; //重置时间
}
}
</script>
</body>
</html>