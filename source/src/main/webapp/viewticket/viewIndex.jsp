<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>幸福假日官网</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/csslib/viewticket/viewIndex.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/csslib/viewticket/slide.css'/>" />
  </head>
  <style>
  	.header-cont .middle{
  		display:none
  	}
  </style>
  <body>
  		<jsp:include page="../header.jsp"></jsp:include>
		<!--主要内容-->
		<div class="container">
			<!--搜索框开始-->
			<div class="search-hearder">
			
				<div class="search-box-keywords" style="position:relative">
					<label class="search-box-keywords-icon"></label>
					<input maxlength="100" autocomplete="off" name="keyword" id="keyWord" placeholder="" type="text" />
				</div>
				<input class="search-box-btn" hidefocus="true" value="搜索" type="button" id="search" />
		
			<div class="city-station">
				<em class="city-present">
					<span id="cityNow"><i></i></span>
				</em>
				<div class="city-box">
				</div>
			</div>
		</div>
		<!--搜索框 结束-->
		<!--图片轮播开始-->
		<div id="demo1" class="slideBox">
		</div>	
		<!--图片轮播结束-->
		<!--周边旅游开始-->
		<div class="travel-list">
			<div class="list-box">
				<div class="box-hd">
					<h2 class="title"></h2>
				</div>
				<div class="box-bd">
					<ul class="ul-list">
					</ul>
				</div>
				<div class="box-bo">
					<a href="<c:url value='/viewticket/viewlist.jsp'/>" target="_blank">更多</a>
				</div>
			</div>
		</div>
		<!--周边旅游结束-->
		<!--活动专区开始-->
		<!-- <div class="activity-list">
			<div class="box-hd">
				<h2 class="thumb">活动专区</h2>
			</div>
			<div class="box-hd">
					<div class="span-left">
							<img src="img/activity.jpg" />
					</div>
					<div class="span-right">
						<ul class="ul-list">
						<li class="travel-item-1">
							<a class="thumb" href="#" target="_blank">
								<img src="img/travel-list1.jpg" / >
							</a>
							<h3 class="title">
								<a href="#" target="_blank">张家界大峡谷</a>
								<p class="price">58 元起</p>
							</h3>
							<div class="flag flag-hot">热销</div>
						</li>
						<li class="travel-item-1">
							<a class="thumb" href="#" target="_blank">
								<img src="img/travel-list1.jpg" / >
							</a>
							<h3 class="title">
								<a href="#" target="_blank">张家界大峡谷</a>
								<p class="price">58 元起</p>
							</h3>
							<div class="flag flag-hot">热销</div>
						</li>
						<li class="travel-item-1">
							<a class="thumb" href="#" target="_blank">
								<img src="img/travel-list1.jpg" / >
							</a>
							<h3 class="title">
								<a href="#" target="_blank">张家界大峡谷</a>
								<p class="price">58 元起</p>
							</h3>
							<div class="flag flag-hot">热销</div>
						</li>
						<li class="travel-item-1">
							<a class="thumb" href="#" target="_blank">
								<img src="img/travel-list1.jpg" / >
							</a>
							<h3 class="title">
								<a href="#" target="_blank">张家界大峡谷</a>
								<p class="price">58 元起</p>
							</h3>
							<div class="flag flag-hot">热销</div>
						</li>
						<li class="travel-item-1">
							<a class="thumb" href="#" target="_blank">
								<img src="img/travel-list1.jpg" / >
							</a>
							<h3 class="title">
								<a href="#" target="_blank">张家界大峡谷</a>
								<p class="price">58 元起</p>
							</h3>
							<div class="flag flag-hot">热销</div>
						</li>
					</ul>
				</div>
			</div>
		</div> -->
		<!--活动专区结束-->
	</div>
	<!--主要内容结束-->
	<jsp:include page="../bottom.jsp"></jsp:include>
	</body>
	<script type="text/javascript" src="<c:url value='/jslib/jquery-1.11.2.min.js'/>"></script>
  	<script type="text/javascript" src="<c:url value='/jslib/viewticket/slide.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jslib/viewticket/viewIndex.js'/>"></script>
	
	
</html>
