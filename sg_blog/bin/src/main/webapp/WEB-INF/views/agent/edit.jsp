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
}
.form-c label {
width: 120px;}
</style>
</head>
<body>
  <form id="accountForm" action="<c:url value='/agent/update'></c:url>"  method="post">
    <div class="page-container row-fluid">
        <div class="page-content">
            <div class="portlet-body" style="padding: 0px;">
                <div class="vip_box" style="padding-top: 10px;">
                     <div class="form-c cf">
                        <label>APPID：</label>
                        <input type="text" name="appid" value="${agentDto.appid}"  class="input-text input" id="appid" readonly="readonly">
                        <span class='help-inline' name="appid"></span>
                    </div>
                     <div class="form-c cf">
                        <label>UID：</label>
                        <input type="text" name="guid" value="${agentDto.guid}"  class="input-text input" id="guid" readonly="readonly">
                        <span class='help-inline' name="guid"></span>
                    </div>
                    <div class="form-c cf">
                        <label>真实姓名：</label>
                        <input type="text" name="name" value="${agentDto.name}"  class="input-text input" id="name">
                        <span class='help-inline' name="name"></span>
                    </div>
                    <div class="form-c cf">
                        <label>手机号：</label>
                        <input type="text" name="phone" value="${agentDto.phone}"  class="input-text input" id="phone">
                        <span class='help-inline' name="phone"></span>
                    </div>            
                    <div class="form-c cf">
                        <label>审核状态：</label>
						<input type="radio" checked="checked" name="status" value="2" />
						审核通过
						<input type="radio" name="status" value="3" />
                   		驳回
					</div>
					<div class="form-c cf">
                      <label>描述：</label>
                       <input type="text" id="IDCard" value="${agentDto.remark}" name="remark"  class="input-text input" >
                        <span class='help-inline' name="remark"></span>
                    </div>
                    <div class="form-c cf">
                       <label>设置等级：</label>
                      <select name="agentLevel">
                      <c:forEach var="baseRate" items="${baseRateList}">
                      <option value="${baseRate.level}">${baseRate.name}</option>
                      </c:forEach>
                      </select>
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