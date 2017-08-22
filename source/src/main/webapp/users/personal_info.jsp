<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'personal_dzzj.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/csslib/bootstrap.min.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/csslib/users/personal.css'/>" />
	<script type="text/javascript" src="<c:url value='/jslib/jquery-1.11.2.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jslib/bootstrap.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jslib/users/personal_info.js'/>"></script>

  </head>
 <body>
		<div class="myContent2" id="content">
			<p>个人信息设置</p>
			<form id="frmChangeInfo" role="form" >
				<table class="table">

					<tr>
						<td>手机</td>
						<td><span name="phone" id="phone" />${sessionScope.user.phone}</span>
						</td>
						<td id="phone_Tips"></td>
					</tr>
					<c:if test="${not empty sessionScope.user.userName}">
						<tr>
							<td>昵称</td>
							<td id="userName-content"><span name="userName" id="userName"/>${sessionScope.user.userName}</span> </td>
							<td id="userName_Tips"></td>
						</tr>
					</c:if>
					<c:if test="${empty sessionScope.user.userName}">
						<tr>
							<td>昵称</td>
							<td id="userName-content"><span name="userName" id="userName"/>未设置</span> </td>
							<td id="userName_Tips"></td>
						</tr>
					</c:if>
					<c:if test="${not empty sessionScope.user.realName}">
						<tr>
							<td>姓名</td>
							<td id="realName-content"><span name="realName" id="realName"/>${sessionScope.user.realName}</span> </td>
							<td id="realName_Tips"></td>
						</tr>
					</c:if>
					<c:if test="${empty sessionScope.user.realName}">
						<tr>
							<td>姓名</td>
							<td id="realName-content"><span name="realName" id="realName"/>未设置</span> </td>
							<td id="realName_Tips"></td>
						</tr>
					</c:if>
					<c:if test="${not empty sessionScope.user.cardClazz}">
					<tr>
						<td>证件类型</td>
						<td id="cardClazz-content"><span name="cardClazz" id="cardClazz">${sessionScope.user.cardClazz}</span>
						</td>
						<td id="cardClazz_Tips"></td>
					</tr>
					</c:if>
					<c:if test="${empty sessionScope.user.cardClazz}">
					<tr>
						<td>证件类型</td>
						<td id="cardClazz-content"><span name="cardClazz" id="cardClazz">未设置</span>
						</td>
						<td id="cardClazz_Tips"></td>
					</tr>
					</c:if>
					<c:if test="${not empty sessionScope.user.cardNumber}">
					<tr>
						<td>证件号</td>
						<td id="cardNumber-content"><span name="cardNumber" id="cardNumber"/>${sessionScope.user.cardNumber}</td>
						<td id="cardNumber_Tips"></td>
					</tr>
					</c:if>
					<c:if test="${empty sessionScope.user.cardNumber}">
					<tr>
						<td>证件号</td>
						<td id="cardNumber-content"><span name="cardNumber" id="cardNumber"/>未设置</td>
						<td id="cardNumber_Tips"></td>
					</tr>
					</c:if>
				</table>
				<hr size="1" color="gainsboro" />
				<label><input id="change" class="btn btn-default" type="button" value="编辑" style="margin-left: 100px;"/>
				<input id="save" class="btn btn-default" value="保存" type="button"  style="margin-left: 100px; display: none;"></label>
			</form>
		</div>
	</body>
	
</html>
