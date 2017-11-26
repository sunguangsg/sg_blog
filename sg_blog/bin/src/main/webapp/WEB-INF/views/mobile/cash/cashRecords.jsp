<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<%@ include file="../../common/mHeader.jsp" %>
<title>提现记录</title>
<style>
</style>
</head>
<body class="overflowA">
	<nav class="breadcrumb">提现记录</nav>
<div class="page-container">
	<div class="mt-20 clearfix">
	    <div style="width:100%;margin:20px 0px;"  >
			<table class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
					<tr class="text-c">
						<th>申请时间</th>
						<th>提现金额</th>
						<th>状态</th>
						<!-- <th>备注</th> -->
					</tr>
				</thead>
				<tbody>
				<c:forEach var="item" items="${records}">
				<tr class="text-c">
				        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${item.applyTime}"/></td>
						<td >${item.totalFee/100}元</td>
						 <c:if test="${item.state==0}">
        		         <td>提交申请</td>
        		        </c:if>
        		        <c:if test="${item.state==1}">
        		         <td>通过</td>
        		        </c:if>
        		        <c:if test="${item.state==2}">
        		         <td>驳回</td>
        		        </c:if>
						<%-- <td>${item.remark}</td> --%>
						
					</tr>
				
				</c:forEach>
				</tbody>
			</table>
		</div>

	</div>
</div>
<script type="text/javascript">
</script>
</body>
</html>