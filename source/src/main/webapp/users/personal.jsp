<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'personal.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/csslib/bootstrap.min.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/csslib/users/personal.css'/>" />

  </head>
  
 <body>
	<jsp:include page="../header.jsp"></jsp:include>
    <div class="container"> 	
		<div class="left_ct">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						我的订单
					</h3>
				</div>
				 <ul class="list-group">
			    	 <a href="personal_dzzj.jsp" target="f1"><li class="list-group-item checked" onclick="selectNav(this)">短租自驾</li></a>
			    	 <a href="personal_jdmp.jsp" target="f1"><li class="list-group-item" onclick="selectNav(this)">景点门票</li></a>
			      	 <a href="personal_sfc.jsp" target="f1"><li class="list-group-item" onclick="selectNav(this)">酒店订单</li></a>
  				</ul>	
			</div>
			<hr />
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						我的账户
					</h3>
				</div>
				 <ul class="list-group">
			    	 <a href="personal_info.jsp" target="f1"><li class="list-group-item" onclick="selectNav(this)">我的信息</li></a>
			      	 <a href="personal_password.jsp" target="f1"><li class="list-group-item" onclick="selectNav(this)">我的密码    </li></a>                                                                                                                                                                                               </li></a>
  				</ul>	
			</div>
		</div>
		<div class="right_ct">
			<iframe width="100%"  id="iframepage" height="100%" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="personal_dzzj.jsp" name="f1">
			</iframe>
		</div>
	</div>
	<jsp:include page="../bottom.jsp"></jsp:include>
	</body>
	<script type="text/javascript" src="<c:url value='/jslib/jquery-1.11.2.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jslib/bootstrap.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jslib/users/personal.js'/>"></script>
</html>
