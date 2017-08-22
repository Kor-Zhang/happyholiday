<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>My JSP 'login.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/csslib/bootstrap.min.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/csslib/login.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/csslib/bottom.css'/>" />
<script type="text/javascript"
	src="<c:url value='/jslib/jquery-1.11.2.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/jslib/bootstrap.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jslib/login.js'/>"></script>
<script>
	$(document).ready(function() {

		if (location.hash) {

			$('a[href=' + location.hash + ']').tab('show');

		}

		$(document.body).on("click", "a[data-toggle]", function(event) {

			location.hash = this.getAttribute("href");

		});

	});

	$(window).on(
			'popstate',
			function() {

				var anchor = location.hash
						|| $("a[data-toggle=tab]").first().attr("href");

				$('a[href=' + anchor + ']').tab('show');

			});
</script>
</head>

<body>
	<!--导航LOGO开始-->
	<div class="banner">
		<div class="logo container">幸福假日-HappyHoliday
			<div class="login-index">
					<a href="index.jsp">首页</a>
		</div>
		</div>
	</div>
	<div class="container">
		<div class="loginPic" style="float: left;">
			<img src="<c:url value='/img/login.png'/>" />
		</div>
		<div class="panel panel-primary" style="width:400px;float: right;">
			<ul class="nav nav-tabs" id="tab-ul">
				<li class="active active" style="width: 200px;text-align: center;">
					<a href="#login" data-toggle="tab">登录</a>
				</li>
				<li style="width: 198px;"><a href="#phoneLogin"
					data-toggle="tab">手机动态码登录</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="login">
					<form role="form" id="frmLogin" method="post"
						action="${pageContext.request.contextPath}/frontUsersAction!login.action">
						<div class="form-group">

							<div class="input-group">
								<div class="input-group-addon">
									<i class="glyphicon glyphicon-user"></i>
								</div>

								<input value="${phone}" type="text" class="form-control"
									name="phone" id="phone" placeholder="请输入手机号/证件号"
									autocomplete="off" />
							</div>

							<div class="form-group">

								<div class="input-group">
									<div class="input-group-addon">
										<i class="glyphicon glyphicon-lock"></i>
									</div>

									<input type="password" class="form-control a<%=0%>"
										name="password" id="password" placeholder="请输入密码"
										autocomplete="off" />
								</div>
								<div class="input-group">
									<p style="color:red;">${requestScope.msg}</p>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<div class="checkbox" >
										<label style="display:none;"><input type="checkbox" name="useCookie"
											value="true" />记住密码</label>
									</div>
									<a href="forgetPwd.jsp">忘记密码?</a><a href="register.jsp">立即注册&nbsp;</a>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<input type="submit" class="btn btn-login" value="登录" />
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="tab-pane " id="phoneLogin">
					
						<form role="form" id="frmLogin" action="${pageContext.request.contextPath}/frontUsersAction!loginByPhone.action#phoneLogin">
							<div class="form-group">

								<div class="input-group">
									<div class="input-group-addon">
										<i class="glyphicon glyphicon-phone"></i>
									</div>

									<input type="text" class="form-control" name="phoneTwo" id="phoneTwo"
									value="${requestScope.phoneTwo}"	placeholder="请输入注册手机号" autocomplete="off" />
								</div>
							</div>
							<input type="password" style="display:none;">
							<div class="form-group">

								<div class="input-group">
									<div class="input-group-addon">
										<i class="glyphicon glyphicon-envelope"></i>
									</div>
									<input type="password" class="form-control word" name="word"
										id="word" placeholder="请输入动态验证码" autocomplete="off" /> <input
										type="button" id="getWord" class="btn btn-word" value="获取手机动态码" />
								</div>
								<div class="input-group">
									<p style="color:red;" id="phoneTwo_Tips">${requestScope.msgTwo}</p>
								</div>

							</div>
							<div class="form-group">
								<div class="input-group">
									<div class="checkbox">
										<label style="display:none;"><input type="checkbox" /> 记住密码</label>
									</div>
									<a href="#">忘记密码?</a><a href="register.jsp">立即注册&nbsp;</a>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<input type="submit" class="btn btn-login"  value="登录" />
								</div>
							</div>
					</div>
					</form>
				
			</div>
		</div>

	</div>

	<!--登录框开始-->

	<!--登录框结束-->
	<!-- 底部 部分-->
	<div class="bottom">
		<div class="bottom-content">
			<div class="content1">
				<a href="###">关于我们</a><span>丨</span> <a href="###">友情链接</a><span>丨</span>
				<a href="###">免责声明</a><span>丨</span> <a href="###">旅游者投诉</a><span>丨</span>
				<a href="###">网站地图</a><span>丨</span> <a href="###">广告合作</a>
			</div>
			<div class="bot">
				<div class="bot-div1">联系我们：service@cits.com.cn |
					咨询热线：400-600-8888</div>
				<div class="bot-div2">
					<span><img src="img/gongan.gif" width="20" height="25" /></span>Copyright
					© 2007-2014 去旅行旅行社总社有限公司
				</div>
				<div class="bot-div3">京ICP证020312号 | 京公网安备11010102000810号</div>
			</div>
		</div>
	</div>

</body>
</html>
