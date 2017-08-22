<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link id="easyuiTheme" rel="stylesheet" type="text/css"
	href="<c:url value='/csslib/officialwebsite/nav.css'/>">
<!-- 返回顶部的按钮start -->
<div id="officialwebsite_nav_backTop">
	<a href="javascript:void(0);" onClick="void(0);" id="toTopBtnId"> 
		<img src="<c:url value='/img/officialwebsite/icons/arrow_up.png'/>"/>
	</a>
</div>
<!-- 返回顶部的按钮end -->

<!-- 返回顶部锚点start -->
<a id="topId" style="display:block;0px;height:0px;">&nbsp</a>
<!-- 返回顶部锚点end -->

<!-- 导航栏start -->
<div id="officialwebsite_nav_nav">
	<!-- 左部导航栏start -->
	<div id="officialwebsite_nav_nav_left">
		<img id="officialwebsite_nav_nav_left_logo" alt="加载错误" src="<c:url value='/img/officialwebsite/icons/logo.png'/>">
	</div>
	<!-- 左部导航栏end -->
	<!-- 右部导航栏start -->
	<div id="officialwebsite_nav_nav_right">
		<!-- 右部导航栏选项start -->
		<ul id="officialwebsite_nav_nav_right_ul">
			<li><a href="<c:url value='/officialwebsite/index.jsp'/>">关于幸福假日</a></li>
			<li><a href="<c:url value='/officialwebsite/members.jsp'/>">成员介绍</a></li>
			<li><a href="<c:url value='/officialwebsite/news.jsp'/>">新闻中心</a></li>
			<li><a href="<c:url value='/officialwebsite/service.jsp'/>">业务概括</a></li>
			<li><a href="<c:url value='/officialwebsite/contactus.jsp'/>">联系我们</a></li>
			<li><a target="blank" href="<c:url value='/admins/index.jsp'/>">后台登陆</a></li>
		</ul>
		<!-- 右部导航栏选项end -->
	</div>
	<!-- 右部导航栏end -->
	
	
</div>
<!-- 导航栏end -->
<script type="text/javascript"
	src="<c:url value='/jslib/jquery-easyui-1.4.1/jquery.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/jslib/jquery-easyui-1.4.1/jquery.easyui.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jslib/zkutil.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/jslib/officialwebsite/nav.js'/>"></script>
