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
  <form id="accountForm" action="<c:url value='/funcConfig/insert'></c:url>"  method="post">
    <div class="page-container row-fluid">
        <div class="page-content">
            <div class="portlet-body" style="padding: 0px;">
                <div class="vip_box" style="padding-top: 10px;">
                <div class="form-c cf">
                        <label>APPID：</label>
                        <input type="text" name="appid"  class="input-text input" id="appid">
                        <span class='help-inline' name="appid"></span>
                    </div>
                    <div class="form-c cf">
                        <label>接口名称：</label>
                        <input type="text" name="funcName"  class="input-text input" id="funcName">
                        <span class='help-inline' name="funcName"></span>
                    </div>
                    <div class="form-c cf">
                        <label>接口地址：</label>
                        <input type="text" name="notfiyUrl"  class="input-text input" id="notfiyUrl">
                        <span class='help-inline' name="notfiyUrl"></span>
                    </div>
					</div>
                <div class="form-actions" style="text-align: center;margin-top: 40px;">
                    <button type="button" onclick="funt()" class="btn blue" id="addRole"><i class="icon-ok"></i> 确定</button>
                    <!-- <button type="reset" class="btn" id="removeRole" >取消</button> -->
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

function funt(){
	if($("#appid").val().trim()== ''){
		$("span[name='appid']").html("<font>* 请输入appid </font>");
		$("#appid").vai("");
		return;
	}
	if($("#funcName").val().trim() == ''){
		$("span[name='funcName']").html("<font>* 请输入接口名称  </font>");
		$("#funcName").vai("");
		return;
	}
	if($("#notfiyUrl").val().trim() == ''){
		$("span[name = 'notfiyUrl']").html("<font>* 请输入接口地址   </font>");
		$("#notfiyUrl").vai("");
		return;
	}
	$("#accountForm").submit();
}

</script>
</body>
</html>