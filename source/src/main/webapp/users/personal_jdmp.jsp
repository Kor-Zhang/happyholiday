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
	<link rel="stylesheet" type="text/css"
	href="<c:url value='/jslib/kkpager/kkpager_orange.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/jslib//datetimepicker/jquery.datetimepicker.css'/>" />
  </head>
  
  <body>
		<div class="myContent" id="content">
			<div class="myContent_top">
				<div class="myContent_header">
				<h4>自驾订单</h4>
			<input type="text" id="startTime" class="form-control" placeholder="时间区间查询订单"  />
				<input type="text" id="endTime" class="form-control" placeholder="时间区间查询订单"  />
				<input type="button" id="modify" class="btn btn-default" value="查询"/>	
			</div>
			<div class="myContent_Status">
				<a  target="f2"  onclick="selectStatus(this)" class="btn btn-default checked">全部</a>	
				<a  target="f2" onclick="selectStatus(this)" class="btn btn-default">未付款</a>
				<a  target="f2" onclick="selectStatus(this)" class="btn btn-default">已付款</a>	
				<a  target="f2" onclick="selectStatus(this)" class="btn btn-default">已完成</a>
				<a  target="f2" onclick="selectStatus(this)" class="btn btn-default">已取消</a>
			</div>
			<div class="myContent_Order"> 
				<iframe width="100%"  src='<c:url value='/users/personal_viewOrder.jsp'/>' id="iframepage" heigth="100%" scrolling="no" frameborder="0"  marginheight="0" marginwidth="0" name="f1" >
				</iframe>
				<!--分页条 开始-->
				<div id='kkpager' style="padding-top: 20px;"></div>
				<!--分页条 结束-->
			</div>
				
			</div>
			<div class="myContent_Tips">
				<div class="panel panel-default">
					<div class="panel-heading">
						订单详情
					</div>
					<div class="panel-body">
						<ul class="tips">
							<li>
								<span class="s-green">未付款</span>
								<p>下单成功，未付款</p>
							</li>
						
							<li>
								<span class="s-blue">已付款</span>
								<p>订单已经付款，等待取票</p>
							</li>
							
							<li>
								<span class="s-yellow">已完成</span>
								<p>已取票，订单结算完毕</p>
							</li>
							<li>
								<span class="s-gray">已取消</span>
								<p>订单已经取消 </p>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="myContent_footer">
				<div class="panel panel-danger">
					<div class="panel-heading">
						注意事项
					</div>
					<div class="panel-body">
						<p>1. 修改或取消订单，请您尽早致电400 616 6666申请，送车上门或服务点订单请至少在我们的工作时间内（08:00-20:00）提前2小时修改；</p>
						<p>2. 预付订单，逾时不履行或取消的，退还您预付款中的基本保险、手续费及可选服务费款项，已付费用将作为违约金恕不退还；</p>
						<p>3. 系统将为您保留一年之内的订单，如需查询更早的订单，请致电24小时热线。</p>
					</div>
				</div>
			</div>
		</div>
	</body>
	
<script type="text/javascript"
	src="<c:url value='/jslib/My97DatePicker/WdatePicker.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jslib/jquery-1.11.2.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jslib/bootstrap.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jslib/users/personal_jdmp.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jslib/kkpager.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jslib/datetimepicker/jquery.datetimepicker.js'/>"></script>
	
</html>
