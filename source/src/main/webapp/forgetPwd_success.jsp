<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'forgetPwd.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/csslib/bootstrap.min.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/csslib/forgetPwd.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/csslib/bottom.css'/>"/>
	<script type="text/javascript" src="<c:url value='/jslib/jquery-1.11.2.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jslib/bootstrap.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jslib/forgetPwd.js'/>"></script>

  </head>
  <body>
		<!-- 顶部 开始----------->
		<div class="top">
			<div class="top-content">
				<div class="top-content-left">
					<span>幸福假日</span>
					<a class="tip">Hi,你想去哪玩呢？</a>
				</div>
				<div class="top-content-right">
					<span>手机客户端</span>
					<span>服务中心</span>
					<span>商家中心</span>
					<span>网站导航</span>
				</div>
			</div>
		</div>
		<!-- 顶部 结束----------->
		<!--LOGO和搜索框开始----->
		<div class="logo-serach">
			<div class="logo-serach-contents">
				<div class="logo">
					幸福假日-HappyHoliday
				</div>
				<div class="serach" style="display: none;">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="请输入关键字.." />
						<div class="input-group-addon">
							<a href="#"><i class="glyphicon glyphicon-search"></i></a>
						</div>
					</div>
				</div>
				<div class="phone">
					<img src="img/tel.jpg" />
					<span class="phone-span1">24小时服务热线:</span>
					<span class="phone-span2">123-456-7890</span>
				</div>
			</div>
		</div>
		<!--Logo和搜索结束------->
		<!--导航条开始------>
		<div class="banner">
			<div class="container">
				<ul>
					<li>幸福假日</li>
					<li><a href="#">首页</a></li>
					<li><a href="#">酒店</a></li>
					<li><a href="#">租车</a></li>
					<li><a href="#">xx</a></li>
				</ul>
			</div>
		</div>
		<!--导航条结束------>

		<div class="container">
			<div class="panel panel-default">
				<div class="panel-heading">
					重置登录密码
				</div>
				<div class="panel-body">
					<form id="frmPwd" method="post" action="${pageContext.request.contextPath}/carUsersAction!forgetPwd.action">
						<div class="form-group row">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="glyphicon glyphicon-phone"></i>
								</div>
								<input type="text" class="form-control" name="phone" id="phone" maxlength="11"  placeholder="请输入您的手机号" autocomplete="off" />
							</div>
							<div class="Tip" id="phone_Tips"></div>
							<div class="input-group">
								<div class="input-group-addon">
									<i class="glyphicon glyphicon-envelope"></i>
								</div>
								<input type="text" class="form-control word" name="word" id="word" maxlength="6" placeholder="请输入手机动态码" autocomplete="off" />
								<input type="button" id="getWord" class="btn btn-word" value="获取手机动态码" />
							</div>
							<div class="Tip" id="word_Tips"></div>
							<div class="input-group">
								<div class="input-group-addon">
									<i class="glyphicon glyphicon-lock"></i>
								</div>
								<input type="password" class="form-control" name="newPassword" id="newPassword" maxlength="16"  placeholder="建议6-16位的数字、字母、符号的组合密码" autocomplete="off" />
							</div>
							<div class="Tip default" id="password_Tips2"><span>弱</span><span>中</span><span>强</span></div>
							<div class="input-group">
								<div class="input-group-addon">
									<i class="glyphicon glyphicon-lock"></i>
								</div>
								<input type="password" class="form-control" name="newPasswordAgain" id="newPasswordAgain" maxlength="16"  placeholder="再次输入密码" autocomplete="off" />
							</div>
							<div class="Tip" id="password_Tips3"></div>
							<div class="input-group">
							<input type="submit" class="btn btn-submit" value="提交" />
						</div>
						</div>
					</form>
				</div>
			</div>
		</div>
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

</html>
