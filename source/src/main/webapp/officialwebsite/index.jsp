<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
<head>
<title>幸福假日官网-主页</title>
<link id="easyuiTheme" rel="stylesheet" type="text/css"
	href="<c:url value='/csslib/officialwebsite/index.css'/>">
<style type="text/css">
</style>
</head>

<body>
	
	<!-- 导航栏start -->
	<div id="officialwebsite_inedx_nav">
		<jsp:include page="./nav.jsp"></jsp:include>
	</div>
	<!-- 导航栏end -->
	<!-- 轮播start -->
	<div id="officialwebsite_inedx_carousel">
		<%-- <div class="carouselImgDiv">
			<img alt="加载错误！" src="<c:url value='/img/officialwebsite/bg/imgdemo02.jpg'/>">
			<font>让我们来一场说走就走的旅行吧！</font>
		</div> --%>
	</div>
	<!-- 轮播end -->
	<!-- 展示公示信息start -->
	<div id="officialwebsite_inedx_companyinfo">
		<jsp:include page="./index_info.jsp"></jsp:include>
	</div>
	<!-- 展示公示信息end -->
	<!-- 底部模块start -->
	<div id="officialwebsite_inedx_bottom">
		<jsp:include page="./bottom.jsp"></jsp:include>
	</div>
	<!-- 底部模块end -->
</body>
<script type="text/javascript"
	src="<c:url value='/jslib/jquery-easyui-1.4.1/jquery.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/jslib/officialwebsite/index.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/jslib/jquery-easyui-1.4.1/jquery.easyui.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jslib/zkutil.js'/>"></script>
<script type="text/javascript">
	
</script>
</html>
