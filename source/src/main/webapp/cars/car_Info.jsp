<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>幸福假日</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/csslib/cars/global.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/csslib/cars/car_Info.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/csslib/viewticket/slide.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/jslib//datetimepicker/jquery.datetimepicker.css'/>" />
</head>

<body width="100%">
	<jsp:include page="../header.jsp"></jsp:include>
		<!--主内容 开始-->
		<div class="container2">
			<!--图片轮播和简介开始-->
			<div class="">
				<!--标题开始-->
				<div class="car-title" style="background: #eaf6fd;">
					基本信息
				</div>
				<!--标题结束-->
				<div class="car-briefing">
					<!--左边图片轮播-->
					<div id="car-imgs" class="car-imgs slideBox">
						<ul class="items">
							<c:forEach items="${sessionScope.orderCarInfo.orderCarImgName}" begin="0" end="${sessionScope.orderCarInfo.orderCarImgName.size()}" varStatus="status" >
						    <li><img src="<c:url value='/frontCarsAction!getCarsImg.action?mainImgName=${sessionScope.orderCarInfo.orderCarImgName[status.index]}'/>" width="600" height="240"/></li>
						    </c:forEach>
						</ul>
					</div>
					<!--右边文字介绍-->
					<div class="car-text">
						<span id="carPrice"style="display:none">${sessionScope.orderCarInfo.price}</span>
						<span style="display: none;" id="carId">${sessionScope.orderCarInfo.id}</span>
						<h3 class="text-name">
							${sessionScope.orderCarInfo.carBd}
						</h3>
						<div class="text-level">
							${sessionScope.orderCarInfo.seatType} | ${sessionScope.orderCarInfo.drivingMode} | ${sessionScope.orderCarInfo.seatNumber}
						</div>
						<div class="text-address">取车地点 : <span id="getCarAddress">${sessionScope.orderCarInfo.address}</span></div>
					</div>
					<div class="text-price">
						<i class="text-price-head"></i>
						<div class="price-box">
							<em>￥</em>
							<span id="carPrice">${sessionScope.orderCarInfo.price}</span>/日均
						</div>
						<i class="text-price-tail"></i>
					</div>
				</div>
			</div>
			<!--图片轮播和简介结束-->
			<!--标题开始-->
			<div class="car-title">
				详细信息
			</div>
			<!--标题结束-->
			<!--详细信息 开始-->
			<div class="order-car">
				<ul class="order-car-info">
					<li><b class="pp">&nbsp;</b>品　　牌：<span>
									${sessionScope.orderCarInfo.carBd}</span></li>
					<li><b class="cx">&nbsp;</b>车　　系：<span>
									${sessionScope.orderCarInfo.carLine}</span></li>
					<li><b class="ndk">&nbsp;</b>年 代 款：<span>
								${sessionScope.orderCarInfo.year}</span></li>
					<li><b class="pzk">&nbsp;</b>配 置 款：<span>
									${sessionScope.orderCarInfo.type}</span></li>
					<li><b class="zws">&nbsp;</b>座 位 数：<span>
									5</span></li>
					<li><b class="cms">&nbsp;</b>车 门 数：<span>
											4</span></li>
					<li><b class="rllx">&nbsp;</b>燃料类型：<span>
								${sessionScope.orderCarInfo.fuelType}</span></li>
					<li><b class="bsxlx">&nbsp;</b>变速箱类型：<span>
									${sessionScope.orderCarInfo.transmissionType}</span></li>
					<li><b class="pl">&nbsp;</b>排　　量：<span>${sessionScope.orderCarInfo.displacement}</span></li>
					<li><b class="rybh">&nbsp;</b>燃油标号：<span>
									未知</span></li>
					<li><b class="qdfs">&nbsp;</b>驱动方式：<span>
									${sessionScope.orderCarInfo.drivingMode}</span></li>
					<li><b class="fdjjqxs">&nbsp;</b>发动机进气形式：<span>
									${sessionScope.orderCarInfo.engineIntakeForm}</span></li>
					<li><b class="tc">&nbsp;</b>天　　窗：<span>
									${sessionScope.orderCarInfo.skyWindow}</span></li>
					<li><b class="yxrl">&nbsp;</b>油箱容量：<span>
									${sessionScope.orderCarInfo.fuelTankage}</span></li>
					<li><b class="yx">&nbsp;</b>音　　箱：<span>
									${sessionScope.orderCarInfo.soundBox}</span></li>
					<li><b class="zy">&nbsp;</b>座　　椅：<span>
									未知</span></li>
					<li class="nonebd"><b class="tc">&nbsp;</b>倒车雷达：<span>
									${sessionScope.orderCarInfo.reverseSensor}</span></li>
					<li class="nonebd"><b class="qin">&nbsp;</b>气　　囊：<span>
									${sessionScope.orderCarInfo.airSacNumber}</span></li>
					<li class="nonebd"><b class="dvd">&nbsp;</b>DVD / CD：<span>
										${sessionScope.orderCarInfo.dvd}</span></li>
					<li class="nonebd"><b class="gps">&nbsp;</b>GPS导航：<span>
										${sessionScope.orderCarInfo.gps}</span></li>
				</ul>
			</div>
			<!--详细信息 结束-->
			<!--标题开始-->
			<div class="car-title">
				填写订单信息
			</div>
			<!--标题结束-->
			<!--订单详细开始-->
			<div class="car-order-info">
				<table class="mytable">
					<thead>
						<tr>
							<th width="250">取车日期</th>
							<th width="250">还车日期</th>
							<th width="200">租期</th>
							<th>总租价</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<div class="order-time">
									<input id="getCarTime" type="text" placeholder="取车日期" autocomplete="off">
									<i class="time-icon" id="geticon"></i>
									<p>选定取车日期</p>
								</div>
							</td>
							<td>
								<div class="order-time">
									<input id="backCarTime" type="text" placeholder="还车日期" autocomplete="off">
									<i class="time-icon" id="backicon"></i>
									<p>选定还车日期</p>
								</div>
							</td>
							<td>
								<strong class="rentDay" id="rentDay">0</strong>
								<em>天</em>
							</td>
							<td>
								<em>￥</em>
								<strong class="totalPrice" id="totalPrice">0</strong>
							</td>
						</tr>
					</tbody>
				</table>
				<!--还车地点-->
				<table class="mytable">
					<tbody>
						<tr>
							<td style="border-bottom: none;">
								<label style="font-weight: bold">还车地点</label>
							<select name="backCarNation" id="backCarNation"  style="height: 25px;margin-left: 5px;">
        			  	
			        	    	</select>
			        	    	<select name="backCarProvince" id="backCarProvince"   style="height: 25px;margin-left: 5px;">
			        			  	
			        	    	</select>
			        	    	<select name="backCarCity" id="backCarCity"   style="height: 25px;margin-left: 5px;">
			        			  	
			        	    	</select>
			        	    	<select name="backCarCounty" id="backCarCounty"   style="height: 25px;margin-left: 5px;">
			        			  	
			        	    	</select>
			        	    	<select name="backCarStore" id="backCarStore"  style="height: 25px;margin-left: 5px;">
			        			  	
			        	    	</select>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!--订单详细结束-->
			<!--标题开始-->
			<div class="car-title">
				填写取车人信息
			</div>
			<!--标题结束-->
			<!--取车人信息开始-->
			<div class="getCarMan">
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
										<input name="realName" id="realName" type="text" placeholder="请输入真实姓名"  autocomplete="off"/>
										<p id="realName-tips" style="color: red;"></p>
									</td>
									<td>
										<input name="phone" id="phone" type="text" placeholder="用于接收信息" autocomplete="off" />
										<p  id="phone-tips" style="color: red;"></p>
									</td>
								</tr>
							</tbody>
						</table>
			</div>
			<!--取车人信息结束-->
			<!--费用明细标题开始-->
			<div class="car-title" style="background: #fdf1ea;color: #f60;">
				费用明细
			</div>
			<!--费用明细标题结束-->
			<!--费用明细结束-->
			<div class="borderbottomDBE4EB" style="background: #fffbf8;">
							<div class="fee-item borderbottomdashedDBE4EB" style="overflow: inherif;">
								<div class="fee-price">
									<span class="orderp-orangeM">
										<em class="rmb">¥</em>
										<em class="num" id="price0">0</em>
									</span>
								</div>
								<div class="calculate">
									<span class="price-gray-small">
										<em class="num" id="jcPrice0">${sessionScope.orderCarInfo.price}*0</em>
										<em class="unit">=</em>
									</span>
								</div>
								<span class="fee-name">
									车辆租赁费及门店服务费
								</span>
							</div>
							<!-- 基本保险费用-start -->
							<div class="fee-item borderbottomdashedDBE4EB">
								<div class="fee-price">
									<span class="orderp-orangeM">
										<em class="rmb">¥</em>
										<em class="num" id="price1">80</em>
									</span>
								</div>
								<div class="calculate">
									<span class="price-gray-small">
										<em class="num">40*2</em>
										<em class="unit">=</em>
									</span>
								</div>
								<span class="fee-name">
									基本保险费
									<em>（必选）</em>
									<span class="icon-tip" onmouseover="openTip(this)" onmouseleave="closeTip(this)">
										<!-- 悬浮提示-start -->
										<div class="float-box" style="display: none;">
											<p>必购产品。如车辆租赁期间出险，保险理赔范围内的损失，客户仅需承担1500元以内的车辆损失部分，不用承担其他损失。</p>
											<p>承保范围：车辆损失险（1500元以内的损失由客户方承担）；第三者责任险 20万元；车上人员责任险（驾驶员）5万元；全车盗抢险；玻璃单独爆裂险；自燃损失险。 </p>
											<p>本服务按天计费，超时4小时以上按1天计费，超时4小时以内不另计费。</p>
										</div>
										<!-- 悬浮提示-end -->
									</span>
								</span>
							</div>
							<!-- 基本保险费用-end -->
							
							<!-- 其他优惠-start -->
							<span id="length"  style="display:none"> ${sessionScope.carCostInfo.size()}</span>
							<c:forEach items="${sessionScope.carCostInfo}"
														var="carCostInfo" begin="0" end="${sessionScope.carCostInfo.size()}" varStatus="index">
							<div class="fee-item borderbottomdashedDBE4EB">
								<div class="fee-price">
									<span class="orderp-orangeM">
										<em class="rmb">¥</em>
										<em class="num" id="price${index.index+2}">${sessionScope.carCostInfo[index.index].price}</em>
									</span>
								</div>
								<span id="costId${index.index}" style="display:none">${sessionScope.carCostInfo[index.index].id}</span>
								<span id="costPrice${index.index}"  style="display:none">${sessionScope.carCostInfo[index.index].price}</span>
								<span class="fee-name">
									${sessionScope.carCostInfo[index.index].introduction}
								</span>
							</div>
							</c:forEach>
							<!-- 其他优惠-end -->
							<!-- 需要发票-start -->
							
							
							
							<!-- 需要发票-end -->
							<!-- 费用总和-start -->
							<div class="order-fee-total">
								<span class="order-total">订单总价：</span>
								<span class="borderbottomdashedDBE4EB">
									<em class="rmb">¥</em>
									<em class="num" id="SumPrice"></em>
								</span>
								<span class="button-blue" style="text-align: center;" id="subOrder">提交订单</span>
								
							</div>
							<!-- 费用总和-end -->
				</div>
			<!--费用明细开始-->
		</div>
		<!--主内容 结束-->
	<jsp:include page="../bottom.jsp"></jsp:include>
</body>
<script type="text/javascript"
	src="<c:url value='/jslib/jquery-1.11.2.min.js'/>"></script>
	<script type="text/javascript"
	src="<c:url value='/jslib/zkutil.js'/>"></script>
	<script type="text/javascript"
	src="<c:url value='/jslib/cars/car_Info.js'/>" charset="utf-8"></script>
	<script type="text/javascript" src="<c:url value='/jslib/viewticket/slide.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jslib/datetimepicker/jquery.datetimepicker.js'/>"></script>
</html>
