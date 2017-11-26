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

<title>代理申请</title>
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
  <form id="accountForm" action="<c:url value='/agent/insert'></c:url>"  method="post">
    <input type="hidden" name="appid" value="${appid}"/>
    
    <div class="page-container row-fluid">
        <div class="page-content">
            <div class="portlet-body" style="padding: 0px;">
                <div class="vip_box" style="padding-top: 10px;">
                    <div class="form-c cf">
                        <label>UID：</label>
                        <input type="text" name="guid" value="${guid}"  class="input-text input" id="guid" readonly="readonly">
                        <span class='help-inline' name="guid"></span>
                    </div>
                     <div class="form-c cf">
                        <label>真实姓名：</label>
                        <input type="text" name="name"  class="input-text input" id="name" placeholder="真实姓名">
                        <span class='help-inline' name="name"></span>
                    </div>
                    <div class="form-c cf">
                        <label>密码：</label>
                        <input type="password" name="password"  class="input-text input" id="password" placeholder="设置登录密码">
                        <span class='help-inline' name="password"></span>
                    </div> 
                    <div class="form-c cf">
                        <label>确认密码：</label>
                        <input type="password" name="password1"  class="input-text input" id="password1" placeholder="确认登录密码">
                        <span class='help-inline' name="password1"></span>
                    </div> 
				   <div class="form-c cf">
                        <label style="margin-left:2px;">手机号：</label>
                        <input type="text" name="phone"  class="input-text input" id="phone" placeholder="输入手机号码">
                        <span class='help-inline' name="phone"></span>
                    </div>
					 <div class="form-c cf">
                        <label>联系地址：</label>
                        <input type="text" name="address"  class="input-text input" id="address" placeholder="输入联系地址">
                        <span class='help-inline' name="address"></span>
					</div> 
					 <div class="form-c cf">
                        <label>QQ：</label>
                        <input type="text" name="qq"  class="input-text input" id="qq" placeholder="输入QQ号码">
                        <span class='help-inline' name="qq"></span>
					</div> 
                   
                 <div class="form-actions" style="text-align: center;margin-top: 40px;">
                    <button type="button" class="btn blue" id="addAgent"><i class="icon-ok"></i> 提交</button>
                    <button type="reset" class="btn" id="removeRole" >取消</button>
                </div>
            </div>
        </div>
    </div>
</form>
<script type="text/javascript">
$(function(){

	//默认选中父级菜单
	//$("select option[value='${resourceId}']").attr("selected","selected");

	$("#addAgent").click(function() {
		var pwd = $("#password").val();

		var pwd2 = $("#password1").val();
	if(pwd.trim() == "" ){
	   $("span[name='password']").html("<font color='pink'>* 请输入密码</font>");
       return;
		} 
	if(pwd2.trim() ==  "" ){
		 $("span[name='password1']").html("<font color='pink'>* 请再次输入密码</font>");
		    return;
	}
	if(pwd.trim() != pwd2.trim()){
		$("span[name='password1']").html("<font color='pink'>* 两次输入的密码 不一样 </font>");
	    return;
	}
	$("#accountForm").submit();
	});
});


</script>
</body>
</html>