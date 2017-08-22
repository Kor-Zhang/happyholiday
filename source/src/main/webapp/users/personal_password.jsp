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
	<div class="myContent2" id="content">
		<p>修改密码  </p> 
		<form id="frmChangePwd" role="form" mthod="post" action="${pageContext.request.contextPath}/frontUsersAction!updatePwd.action">
		
			
			<table class="table">
				<tr>
					<td>原账户</td>
					<td>
						<input name="phone" id="phone" type="text" disabled="true"
							value="${sessionScope.user.phone}" class="form-control"  />
					</td>
				</tr>
				<input type="text" style="display:none;">
				<input type="password" style="display:none;">
				<tr>
					<td>原密码</td>
					<td>
						<input name="oldPassword" id="oldPassword" type="password"
							class="form-control" placeholder="请输入原来的密码" />
					</td>
					<td id="password_Tips1" style="color:red">${requestScope.msg}</td>
				</tr>
				<tr>
					<td>请输入新密码</td>
					<td>
						<input name="newPassword" id="newPassword" maxlength="16"
							type="password" class="form-control"
							placeholder="建议6-16位的数字、字母、符号的组合密码" />
					</td>
					<td id="password_Tips2" class="default">
						<span>弱</span>
						<span>中</span>
						<span>强</span>
						请牢记新密码
					</td>
				</tr>
				<tr>
					<td>确认密码</td>
					<td>
						<input name="newPasswordAgain" id="newPasswordAgain"
							maxlength="16" type="password" class="form-control"
							placeholder="再次输入密码" />
					</td>
					<td id="password_Tips3">再次输入新密码</td>
				</tr>
			</table>
			<hr size="1" color="gainsboro" />
			<label>
				<input class="btn btn-default" type="submit" value="保存" />
			</label>
		</form>
	</div>
</body>
</html>
