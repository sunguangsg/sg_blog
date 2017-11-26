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
  <form id="accountForm" action="<c:url value='/agentNotice/insert'></c:url>"  method="post">
    <div class="page-container row-fluid">
        <div class="page-content">
            <div class="portlet-body" style="padding: 0px;">
                <div class="vip_box" style="padding-top: 10px;">
                  <div class="form-c cf">
                        <label>APPID：</label>
                        <input type="text" name="appid"  class="input-text input" id="name">
                        <span class='help-inline' name="name"></span>
                    </div>
                    <div class="form-c cf">
                        <label>公告标题：</label>
                        <input type="text" name="name"  class="input-text input" id="name">
                        <span class='help-inline' name="name"></span>
                    </div>
                    <div class="form-c cf">
                        <label>公告内容：</label>
                        <input type="Testarea" name="content"  class="input-text input" id="content">
                        <span class='help-inline' name="content"></span>
                    </div>
					</div>
                <div class="form-actions" style="text-align: center;margin-top: 40px;">
                    <button type="button" onclick="funtest()" class="btn blue" id="addRole"><i class="icon-ok"></i> 确定</button>
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
function funtest(){
	if($("#name").val().trim() == ''){
		$("span[name='name']").html("<font color='pink'>* 请输入公告标题 </font>");
		return;
	}
	if($("#content").val().trim() == ''){
		$("span[name='content']").html("<font color='pink'>* 请输入公告内容 </font>");
		return;
	}
	
	$("#accountForm").submit();
}

</script>
</body>
</html>