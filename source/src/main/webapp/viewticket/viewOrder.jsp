<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>幸福假日官网</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css"
	href="<c:url value='/csslib/viewticket/viewOrder.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/jslib//datetimepicker/jquery.datetimepicker.css'/>" />
  </head>
  
 <body>
		<!--内容开始-->
		<div class="container">
			<!--页头开始-->
			<div class="head">
				<div class="logo">
					幸福假日
				</div>
				<div class="personal">
					<a href="#">个人中心</a>
				</div>
			</div>
			<div class="clear"></div>
			<!--页头结束-->
			<!--预定进度条开始-->
			<div class="process-bar">
				<ul>
					<li class="step-1">
						<span>1.</span>
						填写订单信息
						<i></i>
					</li>
					<li class="step-2">
						<span>2.</span>
						在线支付
						<i></i>
					</li>
					<li class="step-3">
						<span>3.</span>
						完成订单
					</li>
				</ul>
			</div>
			<!--预定进度条结束-->
			<!--预定信息开始-->
			<div class="ticket-info">
				<div class="ticket-title">
					<span id="ticketId" style="display:none">${sessionScope.oneViewTicket.id}</span>
					<h1 class="ticket-name">${sessionScope.oneViewTicket.name}  ( ${sessionScope.oneViewTicket.style} )</h1>
				</div>
				<div class="ticket-table">
					<div style="padding: 10px 10px 5px">
						<table class="mytable">
							<thead>
								<tr>
									<th width="250">游玩日期</th>
									<th width="200">门票单价</th>
									<th width="200">门票数量</th>
									<th>总价</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<div class="ticket-time">
										<input id="datetimepicker" autocomplete="off" type="text" placeholder="请选择游玩日期" >
										<i class="time-icon"></i>
										<p>选定游玩日期</p>
										</div>
									</td>
									<td>
										<em>￥</em>
										<strong class="singlePrice">${sessionScope.oneViewTicket.happyPrice}</strong>
									</td>
									<td>
										<div class="num-box">
											<i class="num-cut disabled"></i><!--
											 --><input type="text" value="1" id="number"  autocomplete="off" class="num-input" /><!--
											--><i class="num-add "></i>
										</div>
										<p>最多可预定99张</p>
									</td>
									<td>
										<em>￥</em>
										<strong class="totalPrice">${sessionScope.oneViewTicket.happyPrice}</strong>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!--预定信息结束-->
			<!--取票人信息开始-->
			<div class="getTicket">
				<div class="title">
					<h3>取票人信息</h3><span>用于接收门票信息和入园</span>
				</div>
				<div class="table">
					<div style="padding: 10px 10px 5px">
						<table class="mytable">
							<thead>
								<tr>
									<th width="250">联系人姓名</th>
									<th width="200">手机号</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<input name="realName" id="realName" autocomplete="off" type="text" placeholder="请输入真实姓名" />
										<p id="realName-tips" style="color: red;"></p>
									</td>
									<td>
										<input name="phone" id="phone"  autocomplete="off" type="text" placeholder="用于接收门票信息" />
										<p  id="phone-tips" style="color: red;"></p>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!--取票人信息结束-->
			<!--去支付开始-->
			<div class="pay">
				<div class="agree-info">
					<input  id="agree"  type="checkbox" checked="checked" />我已经阅读并同意XX
					<span id="agree-tips" style="color: red;"></span>
				</div>
				<div class="pay-btn">
					<a id="onlinePay">在线支付</a>
				</div>
			</div>
			<!--去支付结束-->
		</div>
		<!--内容结束-->
		<jsp:include page="../bottom.jsp"></jsp:include>
	</body>
   <script type="text/javascript"
	src="<c:url value='/jslib/jquery-1.11.2.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jslib/datetimepicker/jquery.datetimepicker.js'/>"></script>
	<script type="text/javascript"
	src="<c:url value='/jslib/viewticket/viewOrder.js'/>"></script>
	<script>
		$(function(){
			/*日期选择框*/
			$('#datetimepicker').datetimepicker({
				lang:'ch',
			  	timepicker: false,
				format:'Y-m-d',
				minDate: '-1970/01/01', 
			});
			$('.time-icon').bind('click',function(){
				$('#datetimepicker').focus();
			})
			
		})
	</script>
</html>
