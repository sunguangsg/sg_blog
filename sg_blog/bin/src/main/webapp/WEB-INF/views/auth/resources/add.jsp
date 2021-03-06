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

<title>新增菜单</title>
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
  <form id="accountForm" action="<c:url value='/auth/resources/insert'></c:url>"  method="post">
    <div class="page-container row-fluid">
        <div class="page-content">
            <div class="portlet-body" style="padding: 0px;">
                <div class="vip_box" style="padding-top: 10px;">
                    <div class="form-c cf">
                        <label>名称：</label>
                        <input type="text" name="name"  class="input-text input" id="name1">
                        <span class='help-inline' name="name"></span>
                    </div>
                    <div class="form-c cf">
                        <label>链接：</label>
                        <input type="text" name="href"  class="input-text input" id="name2">
                        <span class='help-inline' name="href"></span>
                    </div>
                    <div class="form-c cf">
                        <label>图标：</label>
                        <input type="text" class="input-text input" value="" placeholder="" id="cardNo" name="icon"  maxlength="20" >
                        <span class='help-inline' name="icon"></span>
                    </div>
						<div class="form-c cf">
							<label>父级菜单：</label> 
							<select name="parentId">
							<option value="-1" selected="selected">无</option>
							<c:forEach var="menu" items="${menuList}">
							<option value="${menu.resourceId}">${menu.name}</option>
							</c:forEach>
							</select> <span class='help-inline' name="IDCard"></span>
						</div>
						<div class="form-c cf">
                        <label>是否生效：</label>
                         <input name="state" type="radio" value="1" checked="checked">生效
                         <input name="state" type="radio" value="0">失效
                        <span class='help-inline' name="status"></span>
                    </div>
                   <div class="form-c cf">
                        <label>描述：</label>
                        <input type="text" id="IDCard" name="description"  class="input-text input" >
                        <span class='help-inline' name="description"></span>
                    </div>
						<div class="form-c cf">
							<label>类型：</label> <input checked="checked" name="type" type="radio" value="1">菜单
							<input name="type" type="radio" value="2">操作
							 <span class='help-inline' name="type"></span>
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
	$("select option[value='${resourceId}']").attr("selected","selected");
})
function funtest(){
	if($("#name1").val().trim() == ''){
		$("span[name='name']").html("<font>请输入名称 </font>");
		$("#name1").val("");
		return;
	}
	$("#accountForm").submit();
}

</script>
</body>
</html>