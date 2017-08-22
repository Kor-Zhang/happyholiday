<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
<head>
<title>幸福假日官网-业务</title>
<link id="easyuiTheme" rel="stylesheet" type="text/css"
	href="<c:url value='/csslib/officialwebsite/service.css'/>">
<style type="text/css">
</style>
</head>

<body>
	<!-- 导航栏start -->
	<div id="officialwebsite_service_nav">
		<jsp:include page="./nav.jsp"></jsp:include>
	</div>
	<!-- 导航栏end -->
	<!-- 业务介绍start -->
	<div id="officialwebsite_service_displayArea">
		<!-- 左部start -->
		<div id="officialwebsite_service_displayArea_left">
			<div id="officialwebsite_service_displayArea_left_title">业务介绍</div>
			<!-- 下一页按钮 -->
			<div id="officialwebsite_service_displayArea_left_prePage"><a href="#">上一页</a></div>
			<!-- 标题列表start -->
			<ul>
				<li><a href="#">2016年4月 </a></li>
				<li><a href="#">2016年4月 </a></li>
				<li><a href="#">2016年4月 </a></li>
				<li><a href="#">2016年4月 </a></li>
				<li><a href="#">2016年4月 </a></li>
				<li><a href="#">2016年4月 </a></li>
				<li><a href="#">2016年4月 </a></li>
				<li><a href="#">2016年4月 </a></li>
				<li><a href="#">2016年4月 </a></li>
				<li><a href="#">2016年4月 </a></li>
			</ul>
			<!-- 标题列表end -->
			<!-- 上一页按钮 -->
			<div id="officialwebsite_service_displayArea_left_nextPage"><a href="#">下一页</a></div>
		</div>
		<!-- 左部end -->
		<!-- 右部start -->
		<div id="officialwebsite_service_displayArea_right">
			<!-- 业务标题start -->
			<div id="officialwebsite_service_displayArea_right_title">
				
			</div>
			<!-- 业务标题end -->
			<!-- 业务创建时间start -->
			<div id="officialwebsite_service_displayArea_right_createTime">
			</div>
			<div class="clear"></div>
			<!-- 业务创建时间end -->
			<!-- 业务文章start -->
			<p id="officialwebsite_service_displayArea_right_content">
				
			</p>
			<!-- 业务文章end -->
		</div>
		<!-- 右部end -->
	</div>
	<!--  业务介绍end -->
	<!-- 清除浮动 -->
	<div class="clear"></div>
	<!-- 底部模块start -->
	<div id="officialwebsite_service_bottom">
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
	src="<c:url value='/jslib/officialwebsite/service.js'/>"></script>

</html>
