<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>修改游戏信息</title>
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
  <form id="accountForm" action="<c:url value='/appinfo/update'></c:url>"  method="post">
    <div class="page-container row-fluid">
        <div class="page-content">
            <div class="portlet-body" style="padding: 0px;">
                <div class="vip_box" style="padding-top: 10px;">
                  <div class="form-c cf">
                        <label>appid : </label>
                        <input type="text" name="appid" value="${appInfoDto.appid}"  class="input-text input" id="appid" readonly="readonly">
                        <span class='help-inline' name="appid"></span>
                    </div>
                    <div class="form-c cf">
                        <label>游戏名字 : </label>
                        <input type="text" name="appname" value="${appInfoDto.appname}"  class="input-text input" id="appname">
                        <span class='help-inline' name="appname"></span>
                    </div>
                    <div class="form-c cf">
                        <label>appKey :</label>
                        <input type="text" name="appkey"  value="${appInfoDto.appkey}" class="input-text input" id="appkey" readonly="readonly">
                        <span class='help-inline' name="appkey"></span>
                    </div>
				</div>
                <div class="form-actions" style="text-align: center;margin-top: 40px;">
                    <button type="submit" class="btn blue" id="addRole"><i class="icon-ok"></i> 提交</button>
                </div>
            </div>
        </div>
    </div>
</form>
<script type="text/javascript">
function chekSubmit(){
	document.forms[0].submit();
}
</script>
</body>
</html>