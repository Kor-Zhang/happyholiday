<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'register.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/csslib/bootstrap.min.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/csslib/register.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/csslib/bottom.css'/>"/>
	<script type="text/javascript" src="<c:url value='/jslib/jquery-1.11.2.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jslib/bootstrap.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jslib/register.js'/>"></script>

  </head>
 <body>
			<!--导航LOGO开始-->
		<div class="banner">
			<div class="logo container">
				幸福假日-HappyHoliday
				<div class="register-login">
					<a href="login.jsp">登录</a>|
					<a href="index.jsp">首页</a>
				</div>
			</div>
		</div>
		<!--导航条结束-->
		<!--注册表单开始-->、
		<div class="container">
			<form id="frmRegister" method="post" action="${pageContext.request.contextPath}/carUsersAction!register.action">
				<p>注册新用户</p>
				<div class="form-group row">
					<div class="input-group">
						<div class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
						</div>
						<input type="text"  class="form-control" name="realName" id="realName" value="${requestScope.realName}"  placeholder="请输入您的真实姓名"  autocomplete="off" />
					</div>
					<div  class="Tip" id="realName_Tips" ></div>
				
					<div class="input-group">
						<div class="input-group-addon">
							<i class="glyphicon glyphicon-phone"></i>
						</div>
						<input type="text" class="form-control" name="phone" id="phone" maxlength="11"  value="${requestScope.registerPhone}"  placeholder="请输入您的手机号" autocomplete="off" />
					</div>
					<div  class="Tip" id="phone_Tips">${requestScope.msg}</div>
				
					<div class="input-group">
						<div class="input-group-addon">
							<i class="glyphicon glyphicon-envelope"></i>
						</div>
						<input type="text" class="form-control word" name="word" id="word" maxlength="6" placeholder="请输入手机动态码" autocomplete="off" />
						<input type="button" id="getWord" class="btn btn-word" value="获取手机动态码" />
					</div>
					<div  class="Tip" id="word_Tips">${requestScope.wordMsg}</div>
					<input type="password" style="display:none;">
					<div class="input-group">
						<div class="input-group-addon">
							<i class="glyphicon glyphicon-lock"></i>
						</div>
						<input type="text" onFocus="this.type='password'" class="form-control" name="password" id="password" maxlength="18" placeholder="建议10-16位数字、字母、符号的组合" autocomplete="off" />
						<div class="input-group-addon" style="display: none;">
							<i class="glyphicon glyphicon-eye-open"></i>
						</div>
					</div>
					<div  class="Tip" id="password_Tips"></div>
					<div class="input-group">
						<div class="checkbox">
							<label><input type="checkbox" id="agree" checked ='checked' value="1" />我已阅读并同意XXXX</label>
						</div>
					</div>
					<div  class="Tip" id="agree_Tips"></div>
					<div class="input-group">
						<input type="submit" class="btn btn-register" value="注册" />
					</div>
				</div>
			</form>
		</div>
		<!--注册表单结束-->
		<!-- 底部 部分-->
		<div class="bottom">
			<div class="bottom-content">
				<div class="content1">
					<a href="###">关于我们</a><span>丨</span>
					<a href="###">友情链接</a><span>丨</span>
					<a href="###">免责声明</a><span>丨</span>
					<a href="###">旅游者投诉</a><span>丨</span>
					<a href="###">网站地图</a><span>丨</span>
					<a href="###">广告合作</a>
				</div>
				<div class="bot">
					<div class="bot-div1">联系我们：service@cits.com.cn | 咨询热线：400-600-8888</div>
					<div class="bot-div2"><span><img src="img/gongan.gif" width="20" height="25"/></span>Copyright © 2007-2014 去旅行旅行社总社有限公司</div>
					<div class="bot-div3">京ICP证020312号 | 京公网安备11010102000810号</div>
				</div>
			</div>
		</div>
	</body>
<SCRIPT type="text/javascript">
	
</SCRIPT>
</html>
