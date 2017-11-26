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
  <form id="accountForm" action="<c:url value='/agentNotice/update'></c:url>"  method="post">
    <div class="page-container row-fluid">
        <div class="page-content">
            <div class="portlet-body" style="padding: 0px;">
                <div class="vip_box" style="padding-top: 10px;">
                  <div class="form-c cf">
                        <label> </label>
                        <input type="hidden" name="id" value="${agentNoticeDto.id}"  class="input-text input" id="id" readonly="readonly">
                        <span class='help-inline' name="id"></span>
                    </div>
                    <div class="form-c cf">
                        <label>公告标题 : </label>
                        <input type="text" name="name" value="${agentNoticeDto.name}"  class="input-text input" id="name">
                        <span class='help-inline' name="name"></span>
                    </div>
                    <div class="form-c cf">
                        <label>公告内容 :</label>
                        <input type="text" name="content"  value="${agentNoticeDto.content}" class="input-text input" id="content">
                        <span class='help-inline' name="content"></span>
                    </div>
                    <div class="form-c cf">
                        <label>激活状态：</label>
						<input type="radio" checked="checked" name="state" value="1" />
						开启
						<input type="radio" name="state" value="0" />
                   		关闭
                   	</div>
                        <div class="form-c cf">
                        <label></label>
                        <input type="hidden" name="createTime"  value="${agentNoticeDto.createTime}" class="input-text input" id="createTime" readonly="readonly">
                        <span class='help-inline' name="createTime"></span>
                    </div>
				</div>
                <div class="form-actions" style="text-align: center;margin-top: 40px;">
                    <button type="submit" class="btn blue" id="addRole"><i class="icon-ok"></i> 确定 </button>
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