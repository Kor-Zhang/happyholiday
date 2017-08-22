<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'header.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/csslib/header.css'/>"/>
	<script type="text/javascript" src="<c:url value='/jslib/jquery-1.11.2.min.js'/>"></script>


  </head>
  
  <%--  <!-- 顶部 开始----------->
		    <div class="top">
		        <div class="top-content">
		            <div class="top-content-left">
		                <span>幸福假日</span>
		                <a class="tip">Hi,你想去哪玩呢？</a>
		               
		            </div>
		            <div class="top-content-right">
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
    	<div class="serach">
    		<div class="input-group">
						<input type="text" style="height:40px" class="form-control" placeholder="请输入关键字.."/>
						<div class="input-group-addon">
							<a href="#"><i class="glyphicon glyphicon-search"></i></a>
						</div>
					</div>
    	</div>
    	<div class="phone">
    		  <img style="border-radius:6px" src="<c:url value='/img/tel.jpg'/>"/>
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
    			<li><a href="<c:url value='/index.jsp'/>">首页</a></li>
    			<li><a href="#">酒店</a></li>
    			<li><a href="<c:url value='/cars/car-source.jsp'/>">租车</a></li>
    			<li><a href="<c:url value='/viewticket/viewIndex.jsp'/>">门票</a></li>
    			<c:if test="${not empty sessionScope.user}">
	    			<li class="user">
	    				<span style="float: left;">
	    					<img src="${pageContext.request.contextPath}/carUsersAction!getUserHead.action?head=${sessionScope.user.head}" width="50px" height="50px" />
	    					
	    				</span>
	    				<span  style="float: right;">			
		    				<div  class="username">${sessionScope.user.phone}</div>	
	    					<div style="width: 100px;height: 25px;line-height: 25px;">	
	    						<a href="<c:url value='/users/personal.jsp'/>">个人中心</a>&nbsp;|&nbsp;<a href="${pageContext.request.contextPath}/carUsersAction!logout.action">退出</a>
	    					</div>
	    				</span>
	    			</li>
   				</c:if>
   				<c:if test="${empty sessionScope.user}">
	    			<li class="user" style="width: 100px;">
	    				
	    				<span  style="float: right;">			
		    				<div  class="username">欢迎你</div>	
	    					<div style="width: 100px;height: 25px;line-height: 25px;">	
	    						<a href="<c:url value='/login.jsp'/>">登录</a>&nbsp;|&nbsp;<a href="<c:url value='/register.jsp'/>">注册</a>
	    					</div>
	    				</span>
	    			</li>
    			</c:if>
    		</ul>
    	</div>
    </div>
    <!--导航条结束------> --%>
    <!--头部开始-->
		<div > 
			<div class="header-top">
				<div class="container">
					<div class="header-top-login">
						<span>你好，欢迎访问 幸福假日！</span>
						<c:if test="${empty sessionScope.user}">
	    					<a href="<c:url value='/login.jsp'/>" id="loginTop">登录</a>
							<a href="<c:url value='/register.jsp'/>" id="registerTop">注册</a>
    					</c:if>
					</div>
						<ul class="topNav">
							<li id="myTel">电话 1122-333-444</li>
							<li id="myService">客户服务</li>
							<li id="joinHappy">合作中心</li>
						</ul>
				</div>
			</div>
			<!--头部 logo 搜索 电话-->
			<div class="header-cont">
				<div class="container">
					<div class="left">
						<!--<img src="#" />-->
						<span>幸福假日-HappyHoliday</span>
					</div>
					<div class="middle">
						<form class="search-box">
							<div class="search-box-keywords" style="position:relative">
								<input maxlength="100" autocomplete="off" name="keyword" placeholder="" type="text" />
							</div>
							<input class="search-box-btn" hidefocus="true" value="搜索" type="submit" />
						</form>
					</div>
					<div class="h-right">
						<p>客户服务电话</p>
						<span>1122-333-444</span>
					</div>
				</div>
			</div>
			<!--导航条开始-->
			<div class="header-bot">
				<div class="container">
					<ul>
						<li><a href="<c:url value='/index.jsp'/>">首页</a></li>
		    			<li><a href="#">酒店</a></li>
		    			<li><a href="<c:url value='/cars/car-source.jsp'/>">租车</a></li>
		    			<li><a href="<c:url value='/viewticket/viewIndex.jsp'/>">门票</a></li>
		    			<li><a target="new" href="<c:url value='/officialwebsite/index.jsp'/>">官网</a></li>
		    			<c:if test="${not empty sessionScope.user}">
	    			<li class="user">
	    				<span style="float: left;">
	    					<img src="${pageContext.request.contextPath}/frontUsersAction!getUserHead.action?head=${sessionScope.user.head}" width="50px" height="50px" />
	    					
	    				</span>
	    				<span  style="float: right;">			
		    				<div  class="username">${sessionScope.user.phone}</div>	
	    					<div style="width: 100px;height: 25px;line-height: 25px;">	
	    						<a href="<c:url value='/users/personal.jsp'/>">个人中心</a>&nbsp;|&nbsp;<a href="${pageContext.request.contextPath}/frontUsersAction!logout.action">退出</a>
	    					</div>
	    				</span>
	    			</li>
   				</c:if>
   				<c:if test="${empty sessionScope.user}">
	    			<li class="user" style="width: 100px;">
	    				
	    				<span  style="float: right;">			
		    				<div  class="username">欢迎你</div>	
	    					<div style="width: 100px;height: 25px;line-height: 25px;">	
	    						<a href="<c:url value='/login.jsp'/>">登录</a>&nbsp;|&nbsp;<a href="<c:url value='/register.jsp'/>">注册</a>
	    					</div>
	    				</span>
	    			</li>
    			</c:if>
					</ul>
				</div>
			</div>
			
		</div>
</html>
