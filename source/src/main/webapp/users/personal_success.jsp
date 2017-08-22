<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'personal_success.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css"
	href="<c:url value='/csslib/bootstrap.min.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/csslib/users/personal.css'/>" />
<script type="text/javascript"
	src="<c:url value='/jslib/jquery-1.11.2.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/jslib/bootstrap.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/jslib/users/personal.js'/>"></script>


  </head>
  
  <body>
  <div class="panel panel-success" style="width: 900px;height: 400px;" id="content">
			<div class="panel-heading" style="font-size: 18px;">
				提示
			</div>
			<div class="panel-body">
				<span class="glyphicon glyphicon-ok-sign"></span>
				<span>修改成功</span>
			</div>
		</div>
  </body>
</html>
