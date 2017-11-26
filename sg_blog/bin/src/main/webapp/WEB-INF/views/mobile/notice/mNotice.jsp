<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<%@ include file="../../common/mHeader.jsp" %>
<title>游戏公告</title>
<style>
  .mt-20 {
    padding: 15px 10px;
    border-bottom: 1px solid #ccc;
    }
   .indent {
    text-indent:0;
    padding: 10px 0;}
    p {margin-bottom: 0;}
</style>
</head>
<body class="overflowA">
<nav class="breadcrumb clearfix">游戏公告 </nav>
    <div class="page-container">
       <div class="lists">
   
       </div>
    </div>
<script type="text/javascript">
var appid="${appid}"
// 当前页码
var page = 1;
//总页数
var totalPageNum=1;
$(function(){
	//第一次初始化
	initPage();
    // 懒加载dropload
    $('.page-container').dropload({
        scrollArea : window,
        loadDownFn : function(me){
            page++;
            page=page>totalPageNum?totalPageNum:page;
            // 拼接HTML
            var result = '';
            $.ajax({
                type: 'GET',
                url: "<c:url value='/agentNotice/mNoticeList'/>",
                data:{'appid':appid,'curPageNum':page},
                dataType: 'json',
                success: function(data){
                    var dataList = data.agentNoticeList;
                    totalPageNum=data.paging.totalPageNum;
                    page=data.paging.curPageNum;
                    if(dataList.length > 0){
                            for(var i=0; i<dataList.length; i++){
                                result +='<div class="mt-20 clearfix">'
                                      +'<div>'+dataList[i].name+'</div>'
                                      +'<div class="indent">'+dataList[i].content+'</div>'
                                      +'<div class="floatR">'+new Date(dataList[i].createTime).toLocaleString()+'</div>'
                                  +'</div>';
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
    $.ajax({
        type: 'GET',
        url: "<c:url value='/agentNotice/mNoticeList'/>",
        data:{'appid':appid,'curPageNum':page},
        dataType: 'json',
        success: function(data){
            var dataList = data.agentNoticeList;
            totalPageNum=data.paging.totalPageNum;
            page=data.paging.curPageNum;
            if(dataList.length> 0){
            	var result=''
                for(var i=0; i<dataList.length; i++){
                    result +='<div class="mt-20 clearfix">'
                          +'<div>'+dataList[i].name+'</div>'
                          +'<div class="indent">'+dataList[i].content+'</div>'
                          +'<div class="floatR">'+new Date(dataList[i].createTime).toLocaleString()+'</div>'
                      +'</div>';
                }
                $('.lists').append(result);
            }
        }
    });
}
</script>
</body>
</html>