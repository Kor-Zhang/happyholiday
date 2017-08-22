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
	
	<link rel="stylesheet" type="text/css" href="<c:url value='/csslib/bottom.css'/>"/>
	
	<script type="text/javascript" src="<c:url value='/jslib/jquery-1.11.2.min.js'/>"></script>
	

  </head>
  <body>
		<!--底部开始-->
		<div class="bottom">
			<div class="w1200">
				<p>
					<a target="_blank" href="<c:url value='/officialwebsite/index.jsp'/>">关于我们</a>
					|
					<a href="#">合作关系</a>
					|
					<a href="#">友情链接</a>
					|
					<a href="#">联系客服</a>
					<br />
					《网络文化经营许可证》：浙网文【2013】 0644-074号浙ICP备08101280号-6《增值电信业务经营许可证》编号:浙B2-20100243
				</p>
				<div class="company">
					<div class="c-left">Logo图片</div>
					<div class="c-right">
						<p>
							Copyright © StarQ 2014 All Rights Reserved.
							<br />
							湖南幸福假日有限公司
						</p>
						<span></span>
					</div>
				</div>
			</div>
		</div>
		
	</body>
  
   
</html>
