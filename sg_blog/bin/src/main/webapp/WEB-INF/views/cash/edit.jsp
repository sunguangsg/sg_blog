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
<title>审核提现信息</title>
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
  <form id="accountForm" action="<c:url value='/cash/update'></c:url>"  method="post">
    <div class="page-container row-fluid">
        <div class="page-content">
            <div class="portlet-body" style="padding: 0px;">
                <div class="vip_box" style="padding-top: 10px;">
                  <div class="form-c cf">
                        <label>订单ID : </label>
                        <input type="text" name="orderId" value="${applyCash.orderId}"  class="input-text input" id="appid" readonly="readonly">
                        <span class='help-inline' name="appid"></span>
                    </div>
                    <div class="form-c cf">
                        <label>提现金额 : </label>
                        <input type="text" name="totalFee" value="${applyCash.totalFee/100}"  class="input-text input" id="appname" readonly="readonly">
                        <span class='help-inline' name="appname"></span>
                    </div>
                 
                      <div class="form-c cf">
                        <label>备注 : </label>
                        <input type="text" name="remark" class="input-text input" id="remark" >
                        <span class='help-inline' name="remark" id="remarkTips"></span>
                    </div>
				</div>
                <div class="form-actions" style="text-align: center;margin-top: 40px;">
                    <button type="button" onclick="submitForm(1)" class="btn blue" ><i class="icon-ok"></i> 通过</button>&nbsp;&nbsp;
                    <button type="button" onclick="submitForm(2)" class="btn red" ><i class="icon-ok"></i> 驳回</button>
                </div>
            </div>
        </div>
    </div>
         <input id="hiddenState" type="hidden" value="0" name="state" >
</form>
<script type="text/javascript">
function submitForm(state){
	var remark=$("#remark").val().trim();
	if(remark==""){
		$("#remarkTips").html("<font color=\"#FF0000\">*请填写备注信息</font>")
		return;
	}
	$("#hiddenState").attr("value",state);
	$("#accountForm").submit();
}
</script>
</body>
</html>