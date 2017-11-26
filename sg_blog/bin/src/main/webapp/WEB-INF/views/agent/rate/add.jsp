<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<%@ include file="../../common/header.jsp" %>

<title>添加</title>
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
  <form id="accountForm" action="<c:url value='/agent/rate/insert'></c:url>"  method="post">
    <div class="page-container row-fluid">
        <div class="page-content">
            <div class="portlet-body" style="padding: 0px;">
                <div class="vip_box" style="padding-top: 10px;">
						<div class="form-c cf">
							<label>APPID：</label> <input type="text" name="appid"
								class="input-text input" id="appid"> <span
								class='help-inline' name="appid"></span>
						</div>
						<div class="form-c cf">
							<label>UID：</label> <input type="text" name="guid"
								class="input-text input" id="guid"> <span
								class='help-inline' name="guid"></span>
						</div>
						<div class="form-c cf">
							<label>一级代理分成：</label> <input type="text" name="rate1"
								class="input-text input" id="rate1"> <span
								class='help-inline' name="rate1"></span>
						</div>
						<div class="form-c cf">
                        <label>二级代理分成：</label>
                        <input type="text" name="rate2"  class="input-text input" id="rate2">
                        <span class='help-inline' name="rate2"></span>
                    </div>
				   <div class="form-c cf">
                        <label>三级代理分成：</label>
                        <input type="text" name="rate3"  class="input-text input" id="rate3">
                        <span class='help-inline' name="rate3"></span>
                    </div>
					</div>
                <div class="form-actions" style="text-align: center;margin-top: 40px;">
                    <button type="button" onclick="funtest()" class="btn blue" id="addRole"><i class="icon-ok"></i> 提交</button>
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
})
function funtest(){
	if($("#appid").val().trim() == ''){
		 $("span[name='appid']").html("<font color='pink'>* 请输入APPID</font>");
		 return;
	}
	if($("#guid").val().trim() == ''){
		$("span[name='guid']").html("<font color='pink'>* 请输入GUID</font>");
		return
	}
	if($("#rate1").val().trim() == ''){
		$("span[name='rate1']").html("<font color='pink'>* 请输入一级代理分成 </font>");
		return;
	}
	if($("#rate2").val().trim() == ''){
		$("span[name='rate2']").html("<font color='pink'>* 请输入二级代理分成  </font>");
		return;
	}
	if($("#rate3").val().trim() == ''){
		$("span[name='rate3']").html("<font color='pink'>* 请输入二级代理分成  </font>");
		return;
	}
	$("#accountForm").submit();
}

</script>
</body>
</html>