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

<title>编辑</title>
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
  <form id="accountForm" action="<c:url value='/agent/rate/update'></c:url>"  method="post">
    <div class="page-container row-fluid">
        <div class="page-content">
            <div class="portlet-body" style="padding: 0px;">
                <div class="vip_box" style="padding-top: 10px;">
                 	<div class="form-c cf">
						<label>APPID</label> 
						<input type="text" value="${rate.appid}"  name="appid" class="input-text input" id="rate1" readonly="readonly"> 
						<span class='help-inline' name="rate1"></span>
					</div>
					<div class="form-c cf">
							<label>UID</label> 
							<input type="text" value="${rate.guid}"  name="guid" class="input-text input" id="rate1" readonly="readonly">
							<span class='help-inline' name="rate1"></span>
					</div>
					<div class="form-c cf">
							<label>一级代理分成：</label>
							 <input type="text" value="${rate.rate1}" name="rate1" class="input-text input" id="rate1">
							<span class='help-inline' name="rate1"></span>
					</div>
					<div class="form-c cf">
                        <label>二级代理分成：</label>
                        <input type="text" name="rate2" value="${rate.rate2}"  class="input-text input" id="rate2">
                        <span class='help-inline' name="rate2"></span>
                    </div>
				   <div class="form-c cf">
                        <label>三级代理分成：</label>
                        <input type="text" name="rate3" value="${rate.rate3}"  class="input-text input" id="rate3">
                        <span class='help-inline' name="rate3"></span>
                    </div>
					</div>
                <div class="form-actions" style="text-align: center;margin-top: 40px;">
                    <button type="submit"  class="btn blue" id="addRole"><i class="icon-ok"></i> 提交</button>
                </div>
            </div>
        </div>
    </div>
</form>
<script type="text/javascript">

</script>
</body>
</html>