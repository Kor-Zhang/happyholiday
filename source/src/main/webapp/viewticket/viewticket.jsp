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
	href="<c:url value='/csslib/viewticket/viewticket.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/csslib/viewticket/slide.css'/>" />

  </head>
  
 <body>
 		<jsp:include page="../header.jsp"></jsp:include>
		<!--主要内容开始-->
			<div class="container">
				<!--图片轮播和简介开始-->
				<div class="view-briefing">
					<!--左边图片轮播-->
					<div id="view-imgs" class="view-imgs slideBox">
					  <ul class="items">
					  	<c:forEach items="${sessionScope.oneView.imgsName}" begin="0" end="${sessionScope.oneView.imgsName.size()}" varStatus="status" >
					    <li><img src="<c:url value='/frontViewsAction!getViewImg.action?imgName=${sessionScope.oneView.imgsName[status.index]}'/>" width="710" height="360"/></li>
					    </c:forEach>
					  </ul>
					</div>	
					<!--右边文字介绍-->
					<div class="view-text">
						<h3 class="text-name">
							${sessionScope.oneView.name}
						</h3>
						<div class="text-level">
							${sessionScope.oneView.grade}景区
						</div>
						<div class="text-feature">特色  : <span>${sessionScope.oneView.feature}</span></div>
						<div class="text-address">详细地址  : <span>${sessionScope.oneView.address}</span></div>
						<div class="text-openTime">开放时间:
							<span class="text-startTime">${sessionScope.oneView.opentime}</span>
						</div>
						<div class="text-promise">
							服务承诺:<span class="text-promise-item">入园保证</span>
						</div>
						<div class="item-introduction">
							预定此景区门票，入园无票且幸福假日10分钟未解决，可购买原价票入场，我们双倍赔差价
						</div>
					</div>
					<div class="text-price">
							<i class="text-price-head"></i>
							<div class="price-box">
								<em>￥</em>
								<span>${sessionScope.oneView.lowPrice}</span>起
							</div>
							<i class="text-price-tail"></i>
					</div>
				</div>
				<!--图片轮播和简介结束-->
				<!--小型导航条开始-->
				<div class="navbar">
					<ul>
						<li class="current" onclick="selectInfo(this)">门票预定</li>
						<li onclick="selectInfo(this)" >景点简介</li>
						<li onclick="selectInfo(this)" >旅游须知</li>
						<li onclick="selectInfo(this)" >XX</li>
					</ul>
				</div>
				<!--小型导航条结束-->
				<div class="content1">
				<!--选项卡内容  门票-->
				<div class="piao-list">
					<table class="piao-table">
						<thead>
							<tr>
								<td class="td1">门票</td>
								<td class="td2">名称</td>
								<td class="td3">类型</td>
								<td class="td4">提取预定时间</td>
								<td class="td5">市场价</td>
								<td class="td6">幸福价</td>
								<td class="td7">支付方式</td>
								<td class="td8"></td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${sessionScope.oneView.viewticket}" begin="0" end="${sessionScope.oneView.viewticket.size()}" var="ticket">
							<tr>
								<td class="td1"></td>
								<td class="piao-title white">${ticket.name}</td>
								<td class="piao-type white">${ticket.style}</td>
								<td class="piao-time white">${ticket.orderTime}</td>
								<td class="piao-delPirce white">
									<em>￥</em>
									<strong>${ticket.marketPrice}</strong>
								</td>	
								<td class="piao-happyPrice white">
									 <em>￥</em>
									<strong>${ticket.happyPrice}</strong>
								</td>
								<td class="piao-orderType white">${ticket.payType}</td>
								<td class="piao-order white"><a href="<c:url value='/frontViewTicketAction!getOneTicket.action?id=${ticket.id}'/>"target="_blank" class="piao-order-btn">预定</a></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!--门票结束-->
				<!--其余票种开始-->
			<!-- 	<div class="piao-list">
					<table class="piao-table">
						<thead>
							<tr>
								<td class="td1">通票</td>
								<td class="td2">名称</td>
								<td class="td3">类型</td>
								<td class="td4">提取预定时间</td>
								<td class="td5">市场价</td>
								<td class="td6">幸福价</td>
								<td class="td7">支付方式</td>
								<td class="td8"></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="td1"></td>
								<td class="piao-title white">张家界国家森林公园门票</td>
								<td class="piao-type white">成人票</td>
								<td class="piao-time white">游玩前1天21:00前</td>
								<td class="piao-delPirce white">
									<em>￥</em>
									<strong>248</strong>
								</td>	
								<td class="piao-happyPrice white">
									<em>￥</em>
									<strong>248</strong>
								</td>
								<td class="piao-orderType white">在线支付</td>
								<td class="piao-order white"><a href="#" class="piao-order-btn">预定</a></td>
							</tr>
							<tr>
								<td class="td1"></td>
								<td class="piao-title white">张家界国家森林公园门票</td>
								<td class="piao-type white">成人票</td>
								<td class="piao-time white">游玩前1天21:00前</td>
								<td class="piao-delPirce white">
									<em>￥</em>
									<strong>248</strong>
								</td>	
								<td class="piao-happyPrice white">
									<em>￥</em>
									<strong>248</strong>
								</td>
								<td class="piao-orderType white">在线支付</td>
								<td class="piao-order white"><a href="#" class="piao-order-btn">预定</a></td>
							</tr>
							<tr>
								<td class="td1"></td>
								<td class="piao-title white">张家界国家森林公园门票</td>
								<td class="piao-type white">成人票</td>
								<td class="piao-time white">游玩前1天21:00前</td>
								<td class="piao-delPirce white">
									<em>￥</em>
									<strong>248</strong>
								</td>	
								<td class="piao-happyPrice white">
									<em>￥</em>
									<strong>248</strong>
								</td>
								<td class="piao-orderType white">在线支付</td>
								<td class="piao-order white"><a href="#" class="piao-order-btn">预定</a></td>
							</tr>
						</tbody>
					</table>
				</div> -->
				<!--其余票种结束-->
				</div>
				<!--景点简介 开始-->
				<div class="content2" style="display: none;">
					<div class="view-feature">
						<ul>
							<c:if test="${sessionScope.oneView.viewIntro[0].textDescription!=''}">
								<li><span>特色1</span><p>${sessionScope.oneView.viewIntro[0].textDescription}</p></li>
							</c:if>
							<c:if test="${sessionScope.oneView.viewIntro[0].textDescriptionTwo!=''}">
								<li><span>特色2</span><p>${sessionScope.oneView.viewIntro[0].textDescriptionTwo}</p></li>
							</c:if>
							<c:if test="${sessionScope.oneView.viewIntro[0].textDescriptionThree!=''}">
								<li><span>特色3</span><p>${sessionScope.oneView.viewIntro[0].textDescriptionThree}</p></li>
							</c:if>
						</ul>
					</div>
					<div class="view-info">
						<c:if test="${sessionScope.oneView.viewIntro[0].introduction!=''}">
								<div class="view-introduction">
									<p>${sessionScope.oneView.viewIntro[0].introduction}</p>
								</div>
						</c:if>
						<div class="view-img">
								<c:forEach items="${sessionScope.oneView.imgsName}" begin="0" end="1" varStatus="status" >
							    	<img src="<c:url value='/frontViewsAction!getViewImg.action?imgName=${sessionScope.oneView.imgsName[status.index]}'/>" width="545" height="277"/>
							    </c:forEach>
						</div>
						<c:if test="${sessionScope.oneView.viewIntro[0].introductionTwo!=''}">
								<div class="view-introduction">
									<p>${sessionScope.oneView.viewIntro[0].introductionTwo}</p>
								</div>
						</c:if>
						<div class="view-img">
								<c:forEach items="${sessionScope.oneView.imgsName}" begin="2" end="3" varStatus="status" >
							    	<img src="<c:url value='/frontViewsAction!getViewImg.action?imgName=${sessionScope.oneView.imgsName[status.index]}'/>" width="545" height="277"/>
							    </c:forEach>
						</div>
						<c:if test="${sessionScope.oneView.viewIntro[0].introductionThree!=''}">
								<div class="view-introduction">
									<p>${sessionScope.oneView.viewIntro[0].introductionThree}</p>
								</div>
						</c:if>
						<div class="view-img">
								<c:forEach items="${sessionScope.oneView.imgsName}" begin="4" end="5" varStatus="status" >
							    	<img src="<c:url value='/frontViewsAction!getViewImg.action?imgName=${sessionScope.oneView.imgsName[status.index]}'/>" width="545" height="277"/>
							    </c:forEach>
						</div>
					</div>			
				</div>
				<!--景点简介 结束-->
				<!--旅游须知 开始-->
				<div class="content3" style="display:none">
					<div class="rule">
						<span>提前预定时间</span>
						<p>您最晚要在${sessionScope.oneView.viewticket[0].orderTime}下单，请尽早预订，以免耽误行程。</p>
						<span>退改规则</span>
						<p>1个订单多张票，不支持部分退。</p>
						<p>如需取消订单，请登录幸福账户至订单中心取消。</p>
						<p>如需改期，请申请取消后重新预订。</p>
						
					</div>
				</div>
				<!--旅游须知 结束-->
			</div>
		<!--主要内容结束-->
		<jsp:include page="../bottom.jsp"></jsp:include>
	</body>
  <script type="text/javascript"
	src="<c:url value='/jslib/jquery-1.11.2.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jslib/viewticket/slide.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/jslib/viewticket/viewticket.js'/>"></script>
	<script>
		$(function(){
			$('#view-imgs').slideBox({
				duration : 0.3,//滚动持续时间，单位：秒
				easing : 'linear',//swing,linear//滚动特效
				delay : 5,//滚动延迟时间，单位：秒
				hideClickBar : false,//不自动隐藏点选按键
				clickBarRadius : 1,
			});

		})
	</script>
</html>
