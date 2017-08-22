<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>幸福假日</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="<c:url value='/csslib/index.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/jslib/ck-slide/css/slide.css'/>" />
	<style>
		.ck-slide { width: 1200px; height: 430px; margin: 0 auto;}
		.ck-slide ul.ck-slide-wrapper { height: 430px;}
		</style>
  </head>
  
  <body>
	<jsp:include page="header.jsp"></jsp:include>
    <!--图片轮播开始-->
    <div class="container">
    	<div class="ck-slide"> 
		    <ul class="ck-slide-wrapper">
		    </ul> 
	    	<a href="javascript:" class="ctrl-slide ck-prev">上一张</a> <a href="javascript:" class="ctrl-slide ck-next">下一张</a> 
		    <div class="ck-slidebox"> 
		        <div class="slideWrap"> 
		            <ul class="dot-wrap">
					</ul> 
		        </div> 
	    	</div> 
		</div>

    </div>
    <!--图片轮播结束-->
   
  
    
    <!-- 酒店推荐 开始 -->
    
    <!-- 酒店推荐 结束 -->
    <!-- 汽车推荐开始 -->
    <div class="mod car">
    	<div class="container">
    		<div class="mod-hd">
    			<span class="current">短租自驾</span>
    			<!-- <span >顺风车</span> -->
    		</div>
    		<div class="mod-bd">
    			<div class="mod-bd-panel" style="display: block;">
    				
    				<div class="product">
    					<div class="product-hd">
    						<ul class="inner-tabs-nav">
    							<li class="myActive"><a href="#">新车</a></li>
    							<!-- 待拓展 -->
    							<!-- <li ><a href="#">张家界</a></li>
    							<li ><a href="#">上海</a></li> -->
    						</ul>
    						<a class="link-more" href="<c:url value='/cars/car-source.jsp'/>">更多租车</a>
    					</div>
    					<div class="product-bd">
    						<div class="inner-tabs-panel">
    							
    						</div>
    					</div>
    				</div>
    			</div>
    					
    		</div>
    	</div>
    </div>
    <!-- 汽车推荐结束 -->
  	<!-- 景区推荐开始 -->
    <div class="mod view">
    	<div class="container">
    		<div class="mod-hd">
    			<span class="current">幸福旅游</span>
    			<!-- <span >顺风车</span> -->
    		</div>
    		<div class="mod-bd">
    			<div class="mod-bd-panel" style="display: block;">
    				
    				<div class="product">
    					<div class="product-hd">
    						<ul class="inner-tabs-nav">
    							<li class="myActive"><a href="#">热门景区</a></li>
    							<!-- 待拓展 -->
    							<!-- <li ><a href="#">张家界</a></li>
    							<li ><a href="#">上海</a></li> -->
    						</ul>
    						<a class="link-more" href="<c:url value='/viewticket/viewIndex.jsp'/>">更多景区</a>
    					</div>
    					<div class="product-bd">
    						<div class="inner-tabs-panel-viewticket">
    							
    						</div>
    					</div>
    				</div>
    			</div>
    					
    		</div>
    	</div>
    </div>
    <!-- 景区推荐结束 -->
  
    <jsp:include page="bottom.jsp"></jsp:include>
	</body>
	<script type="text/javascript" src="<c:url value='/jslib/jquery-1.11.2.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jslib/bootstrap.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jslib/index.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jslib/ck-slide/js/slide.js'/>"></script>

</html>
