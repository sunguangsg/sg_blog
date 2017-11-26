<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<%@ include file="../common/header.jsp" %>
<title>提现申请</title>
<style type="text/css" media="screen">
    .cf {
       margin-top:30px;
    }
   .blue {
    background: #5a98de;
    color: #fff;
   }
form {
    margin-top: -25px;
}
</style>
</head>
<body>
  <form id="accountForm" action="<c:url value='/cash/insert'></c:url>"  method="post">
      <input type="hidden" value="${authUser.appid}" name="appid"  class="input-text input" id="appid">
    <div class="page-container row-fluid">
        <div class="page-content">
            <div class="portlet-body" style="padding: 0px;">
                <div class="vip_box" style="padding-top: 10px;">
                    <div class="form-c cf">
                        <label>UID：</label>
                        <input type="text"  value="${authUser.guid}" name="guid"  class="input-text input" id="guid" readonly="readonly">
                        <span class='help-inline' name="guid"></span>
                    </div>
                      <div class="form-c cf">
                        <label>提取金额(元)：</label>
                        <input type="text" name="totalFee"  class="input-text input"  placeholder="提取金额(元)">
                        <span class='help-inline' name="password"></span>
                    </div> 
                    <div class="form-c cf">
                        <label>手机号：</label>
                        <input type="text" name="mobile" value="${authUser.mobile}"  class="input-text input" id="mobile" placeholder="手机号码" readonly="readonly">
                     <input onclick="sendCode(this,${authUser.userId});" type="button" value="获取验证码">
                    </div> 
                       <div class="form-c cf">
                        <label>验证码：</label>
                        <input type="text" name="checkCode"  class="input-text input" id="password" placeholder="输入6位验证码">
                        <span class='help-inline' name="password"></span>
                    </div> 
                 <div class="form-actions" style="text-align: center;margin-top: 40px;">
                    <button type="submit" class="btn blue" id="addAgent"><i class="icon-ok"></i> 提交</button>
                    <button type="reset" class="btn" id="removeRole" >取消</button>
                </div>
            </div>
        </div>
    </div>
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
btn.value = nums+'秒后可重新获取';
clock = setInterval(doLoop, 1000); //一秒执行一次
}
function doLoop(){
nums--;
if(nums > 0){
 btn.value = nums+'秒后可重新获取';
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