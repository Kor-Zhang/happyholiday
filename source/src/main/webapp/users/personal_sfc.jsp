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
	<script type="text/javascript" src="<c:url value='/jslib/users/personal.js'/>"></script>

  </head>
  
  <body>
		<div class="myContent" id="content">
			<div class="myContent_top">
				<div class="myContent_header">
				<h4>顺风车</h4>
				<input type="text" id="startTime" class="form-control" value="开始时间"/>
				<input type="text" id="endTime" class="form-control" value="结束时间"/>
				<input type="button" id="modify" class="btn btn-default" value="查询"/>	
			</div>
			<div class="myContent_Status">
				<a href="#" target="f2"  class="btn btn-default">全部</a>	
				<a href="#" target="f2"  class="btn btn-default">处理中</a>
				<a href="#" target="f2"  class="btn btn-default">等待付款</a>	
				<a href="#" target="f2"  class="btn btn-default">预定成功</a>
				<a href="#" target="f2"  class="btn btn-default">租赁中</a>	
				<a href="#" target="f2"  class="btn btn-default">已完成</a>
				<a href="#" target="f2"  class="btn btn-default">已取消</a>
			</div>
			<div class="myContent_Order">
				<iframe width="100%"  src="xx.html" id="iframepage" height="100%" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="#" name="f1" >
			</iframe>
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
								<span class="s-green">预定成功</span>
								<p>订单已被确定，尚未提车</p>
							</li>
							<li>
								<span class="s-orange">等待付款</span>
								<p>订单尚未付款，请在1小时内完成支付</p>
							</li>
							<li>
								<span class="s-blue">处理中</span>
								<p>您的订单已提交，正在处理中</p>
							</li>
							<li>
								<span class="s-blue">租赁中</span>
								<p>订车辆正在租赁过程中</p>
							</li>
							<li>
								<span class="s-orange">待评价</span>
								<p>订单完成48小时内，可对我们做出评价</p>
							</li>
							<li>
								<span class="s-yellow">已完成</span>
								<p>已还车，订单结算完毕</p>
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
</html>
