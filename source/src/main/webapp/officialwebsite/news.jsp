<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
<head>
<title>幸福假日官网-新闻</title>
<link id="easyuiTheme" rel="stylesheet" type="text/css"
	href="<c:url value='/csslib/officialwebsite/news.css'/>">
<style type="text/css">
</style>
</head>

<body>
	<!-- 导航栏start -->
	<div id="officialwebsite_news_nav">
		<jsp:include page="./nav.jsp"></jsp:include>
	</div>
	<!-- 导航栏end -->
	<!-- 新闻start -->
	<div id="officialwebsite_news_displayArea">
		<!-- 左部start -->
		<div id="officialwebsite_news_displayArea_left">
			<div id="officialwebsite_news_displayArea_left_title">新闻档案</div>
			<!-- 下一页按钮 -->
			<div id="officialwebsite_news_displayArea_left_prePage"><a href="#">上一页</a></div>
			<!-- 标题列表start -->
			<ul>
			</ul>
			<!-- 标题列表end -->
			<!-- 上一页按钮 -->
			<div id="officialwebsite_news_displayArea_left_nextPage"><a href="#">下一页</a></div>
		</div>
		<!-- 左部end -->
		<!-- 右部start -->
		<div id="officialwebsite_news_displayArea_right">
			<!-- 新闻标题start -->
			<div id="officialwebsite_news_displayArea_right_title">
				
			</div>
			<!-- 新闻创建时间start -->
			<div id="officialwebsite_news_displayArea_right_createTime">
			</div>
			<div class="clear"></div>
			<!-- 新闻创建时间end -->
			<!-- 新闻文章start -->
			<p id="officialwebsite_news_displayArea_right_content">
				
			</p>
			<!-- 新闻文章end -->
		</div>
		<!-- 右部end -->
	</div>
	<!-- 新闻end -->
	<!-- 清除浮动 -->
	<div class="clear"></div>
	<!-- 底部模块start -->
	<div id="officialwebsite_news_bottom">
		<jsp:include page="./bottom.jsp"></jsp:include>
	</div>
	<!-- 底部模块end -->
</body>
<script type="text/javascript"
	src="<c:url value='/jslib/jquery-easyui-1.4.1/jquery.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/jslib/jquery-easyui-1.4.1/jquery.easyui.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jslib/zkutil.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/jslib/officialwebsite/news.js'/>"></script>

</html>
