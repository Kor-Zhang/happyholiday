<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
<head>
<title>幸福假日官网-联系我们</title>
<link id="easyuiTheme" rel="stylesheet" type="text/css"
	href="<c:url value='/csslib/officialwebsite/contactus.css'/>">
<style type="text/css">
</style>
</head>

<body>
	<!-- 信息弹出框start -->
	<jsp:include page="./popwindow.jsp"></jsp:include>
	<!-- 信息弹出框end-->
	<!-- 导航栏start -->
	<div id="officialwebsite_contactus_nav">
		<jsp:include page="./nav.jsp"></jsp:include>
	</div>
	<!-- 导航栏end -->
	<!-- 联系start -->
	<div id="officialwebsite_contactus_displayArea">
		<!-- 联系说明start -->
		<div id="officialwebsite_contactus_displayArea_font">
			<h1>
				我们的咨询带来你满意的旅游需求

			
			</h1>
			<h3>
				您可以通过留言联系我们。 
				
				 你的电子邮件地址不登录这个系统,但会被附加到这个页面的消息转发。 
			</h3>
		</div>
		<!-- 联系说明end -->
		<!-- 联系信息填写start -->
		<div id="officialwebsite_contactus_displayArea_sendmsg">
			<form id="officialwebsite_contactus_displayArea_sendmsg_form" action="" method="post">
				<table id="officialwebsite_contactus_displayArea_sendmsg_table">
					<tr>
						<td>
							<input type="text" name="email" placeholder="您的邮箱*" autocomplete="off"/>
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="personOrOrg" placeholder="组织或个人*" autocomplete="off"/>
						</td>
					</tr>
					<tr>
						<td>
							<textarea name="msg" style="resized:none;" placeholder="您的留言*" autocomplete="off"></textarea>
						</td>
					</tr>
					<tr>
						<td>
							<input type="button" value="提交"/>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<!-- 联系信息填写end -->
		
	</div>
	<!-- 联系end -->
	<!-- 清除浮动 -->
	<div class="clear"></div>
	<!-- 底部模块start -->
	<div id="officialwebsite_contactus_bottom">
		<jsp:include page="./bottom.jsp"></jsp:include>
	</div>
	<!-- 底部模块end -->
</body>
<script type="text/javascript"
	src="<c:url value='/jslib/jquery-easyui-1.4.1/jquery.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/jslib/officialwebsite/contactus.js'/>"></script>

</html>
