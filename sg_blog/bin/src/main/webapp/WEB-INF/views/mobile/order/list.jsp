<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<%@ include file="../../common/dropdown.jsp" %>
<title>订单列表</title>
<style>
.floatL li {
    width: 30%;
}
.details {
    background: #EDEDEA;
    margin: 20px 0;
    padding: 10px;
}

  .input-text {
        width: 70%;
  }
  .btn {
    margin:0 3%;
  }
</style>
</head>
<body class="overflowA">
<nav class="breadcrumb clearfix">订单列表</nav>
    <div class="page-container">
        <div class="mt-20 clearfix" >
           <div style="width:100%;" class="personP" >
               <div class="dataTime">
                  <label class="search"><input id="searchIN" type="text" name=""  class="input-text" placeholder="输入 UID"><button onclick="initPage()" type="button" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索</button></label>
                   <div class="dataT clearfix">
                      <ul class="ul floatL">
                           <li>UID</li>
                          <li>充值(元)</li>
                        <li>支付时间</li>
                      </ul>
                   </div>
                   <div class="pageContent clearfix">
                       <div class="lists">
                        </div>
                   </div>
               </div>
            </div>
        </div>
    </div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript">
var appid="${appid}"
var guid="${guid}"
	// 当前页码
	var page = 1;
	//总页数
	var totalPageNum=1;
	var pageSize=10
$(function(){
			//第一次初始化
			initPage();
		    // 懒加载dropload
		    $('.pageContent').dropload({
		        scrollArea : window,
		        loadDownFn : function(me){
		        	var searchStr=$("#searchIN").val().trim();
	        	    page++;
		            page=page>totalPageNum?totalPageNum:page;
		            if(page>=totalPageNum){
		            	 // 锁定
                        me.lock();
                        // 无数据
                        me.noData();
		            }
		            // 拼接HTML
		            var result = '';
		            if(page==1){return}
		            $.ajax({
		                type: 'GET',
		                url: "<c:url value='/order/mOrderData'/>",
		                data:{'appid':appid,'superGuid':guid,'curPageNum':page,'pageSize':pageSize,'queryUID':searchStr},
		                dataType: 'json',
		                success: function(data){
		                	$("#searchIN").val(data.queryUID)
		                    var dataList = data.dataList;
		                    totalPageNum=data.paging.totalPageNum;
		                    page=data.paging.curPageNum;
		                    if(dataList.length > 0){
		                    	   for(var i=0; i<dataList.length; i++){
		   	   	                    result +='<ul class="ul floatL hover">'
		   	   	                          +'<li>'+dataList[i].guid+'</li>'
		   	   	                          +'<li>'+(dataList[i].totalFee/100).toFixed(2)+'</li>'
		   	   	                         +'<li>'+dataList[i].dispalyPayTime+'</li>'
		   	   	                         +'</ul>';
		   	   	                }
		                    // 如果没有数据
		                    }else{
		                        // 锁定
		                        me.lock();
		                        // 无数据
		                        me.noData();
		                    }
		                    // 为了测试，延迟1秒加载
		                    setTimeout(function(){
		                        // 插入数据到页面，放到最后面
		                        $('.lists').append(result);
		                        // 每次数据插入，必须重置
		                        me.resetload();
		                    },1000);
		                },
		                error: function(xhr, type){
		                    alert('Ajax error!');
		                    // 即使加载出错，也得重置
		                    me.resetload();
		                }
		            });
		        }
		    });
		});
function initPage(){
	         var searchStr=$("#searchIN").val().trim();
		    $.ajax({
		        type: 'GET',
		        url: "<c:url value='/order/mOrderData'/>",
		        data:{'appid':appid,'superGuid':guid,'curPageNum':page,'pageSize':pageSize,'queryUID':searchStr},
		        dataType: 'json',
		        success: function(data){
		        	$("#searchIN").val(data.queryUID)
		            var dataList = data.dataList;
		            totalPageNum=data.paging.totalPageNum;
		            page=data.paging.curPageNum;
		            if(dataList.length> 0){
		            	var result=''
		            		   for(var i=0; i<dataList.length; i++){
		            			   result +='<ul class="ul floatL hover">'
		   	   	                          +'<li>'+dataList[i].guid+'</li>'
		   	   	                          +'<li>'+(dataList[i].totalFee/100).toFixed(2)+'</li>'
		   	   	                          +'<li>'+dataList[i].dispalyPayTime+'</li>'
		   	   	                         +'</ul>';
		   	                }
		                $('.lists').html(result);
		            }
		        }
		    });
		}
		
</script>
</body>
</html>