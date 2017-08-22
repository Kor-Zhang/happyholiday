<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/csslib/officialwebsite/popwindow.css'/>">
<style type="text/css">
</style>
</head>

<body>
	<!-- 信息弹出框start-->
	<div id="ow_popwindow_entity">
		<div id="ow_popwindow_msg">
			<!-- <div id="ow_popwindow_head">
				<div id="title">提示</div>
			</div> -->
			<div id="ow_popwindow_body">
				未知错误！
			</div>
			<div id="ow_popwindow_foot">
				<div id="confiremBtn">
					确认
				</div>
			</div>
		</div>
	</div>
	<!-- 信息弹出框end-->	
</body>
<script type="text/javascript"
	src="<c:url value='/jslib/jquery-easyui-1.4.1/jquery.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/jslib/jquery-easyui-1.4.1/jquery.easyui.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jslib/zkutil.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/jslib/officialwebsite/popwindow.js'/>"></script>

</html>
