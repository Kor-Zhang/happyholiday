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
	href="<c:url value='/csslib/cars/car-source.css'/>" />
	<link rel="stylesheet" type="text/css"
	href="<c:url value='/jslib/kkpager/kkpager_orange.css'/>" />


</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<!--主内容开始-->
		<div class="container">
			<div class="white-backgorund firstInfo">
				<!--搜索栏 开始-->
				<div class="take-car-bar">
					<!--取车地点 开始-->
					<div class="choose-ul">
						<div class="take-car-box">
							<label class="source-bar c_car">取车地点</label>
							<select name="getCarNation" id="getCarNation" class="source-bar"  style="height: 39px;margin-left: 5px;">
        			  	
			        	    	</select>
			        	    	<select name="getCarProvince" id="getCarProvince" class="source-bar"  style="height: 39px;margin-left: 5px;">
			        			  	
			        	    	</select>
			        	    	<select name="getCarCity" id="getCarCity" class="source-bar"  style="height: 39px;margin-left: 5px;">
			        			  	
			        	    	</select>
			        	    	<select name="getCarCounty" id="getCarCounty" class="source-bar"  style="height: 39px;margin-left: 5px;">
			        			  	
			        	    	</select>
			        	    	<select name="getCarStore" id="getCarStore" class="source-bar"  style="height: 39px;margin-left: 5px;">
			        			  	
			        	    	</select>
						</div>
					</div>
					<!--取车地点 结束-->
					<!-- 搜索-start -->
					<div class="search">
						<span class="search-button" id="search">搜索车型</span>
					</div>
					<!-- 搜索-end -->
				</div>
				<!--搜索栏 结束-->
			</div>
			<!--搜索及显示-->
			<div class="">
				<!--左边搜索开始-->
				<div class="white-backgorund car-left">
					<!--车型-->
					<div class="white-backgorund car-type-div">
						<p class="car-type">车型</p>
						<ul class="chexing">
							<li onclick="selectType(this)">
								<a id="type" class="checked">
									<span class="car-img car-type-img car-img-0"></span>
									<span class="cartxt">不限</span>
								</a>
							</li>
							<!-- <li onclick="selectType(this)">
								<a id="type" class="">
									<span class="car-img car-type-img car-img-1"></span>
									<span class="cartxt">手动紧凑性</span>
								</a>
							</li>
							<li onclick="selectType(this)">
								<a id="type" class="">
									<span class="car-img car-type-img car-img-2"></span>
									<span class="cartxt">经济型</span>
								</a>
							</li>
							<li onclick="selectType(this)">
								<a id="type" class="">
									<span class="car-img car-type-img car-img-3"></span>
									<span class="cartxt">商务型</span>
								</a>
							</li>
							<li onclick="selectType(this)">
								<a id="type" class="">
									<span class="car-img car-type-img car-img-4"></span>
									<span class="cartxt">6至15座商务</span>
								</a>
							</li> -->
						</ul>
					</div>
					<!--价格-->
					<div class="white-backgorund price-div">
						<p class="car-type">价格（元）</p>
						<ul class="price-range">
							<li class="bar1 checked" onclick="selectPrice(this)" value="不限">
								<a>
									<span class="w40"></span>
								</a>
							</li>
							<li class="bar2" onclick="selectPrice(this)" value="150">
								<a>
									<span class="w40"></span>
								</a>
							</li>
							<li class="bar3" onclick="selectPrice(this)" value="300">
								<a>
									<span class="w40"></span>
								</a>
							</li>
							<li class="bar4" onclick="selectPrice(this)" value="450">
								<a>
									<span class="w40"></span>
								</a>
							</li>
							<li class="bar5" onclick="selectPrice(this)" value="500">
								<a>
									<span class="w70"></span>
								</a>
							</li>
						</ul>
						<ul class="price-num">
							<li class="price1 w40 checked">不限</li>
							<li class="price2 w40">0</li>
							<li class="price3 w40">150</li>
							<li class="price4 w40">300</li>
							<li class="price5 w40">500</li>
							<li class="price6 w40">500+</li>
						</ul>
					</div>
					<!-- 品牌 -->
					<div class="white-backgorund">
						<p class="car-type">品牌</p>
						<ul class="car-brand">
							<li value="不限" class="checked" onclick="selectBrand(this)">
								<a>不限</a>
							</li>
							<!-- <li value="奥迪" class="" onclick="selectBrand(this)"><a class="">奥迪</a></li>
							<li onclick="selectBrand(this)"><a class="">宝马</a></li>
							<li onclick="selectBrand(this)"><a class="">奔驰</a></li>
							<li onclick="selectBrand(this)"><a class="">本田</a></li>
							<li onclick="selectBrand(this)"><a class="">标致</a></li> -->
						</ul>
					</div>
				</div>
				<!--左边搜索结束-->
				<!--车型显示 开始-->
				<div class="white-backgorund car-right">
					<div style="min-height: 1139px;width:910px" id="content">
						<ul class="right-tab">
							<li class="tab w120 day-active">
								<a>短租自驾</a>
							</li>
							
							<li class="clear"></li>
						</ul>
						<div class="car-list">
							<!-- 短租自驾 -->
							<table class="work-suit" width="910px" border="0" cellpadding="0" cellspacing="0" id="content">
								<tbody class="carList">
									
								</tbody>
							</table>
						</div>
						<!--显示车 结束-->
						<!--分页条 开始-->
						<div id='kkpager' style="padding-top: 20px;"></div>
						<!--分页条 结束-->
					</div>
				</div>
				<!--车型显示 结束-->
				<div class="clear"></div>
			</div>
			<!--搜索及显示-->
		</div>
		<jsp:include page="../bottom.jsp"></jsp:include>
</body>
<script type="text/javascript"
	src="<c:url value='/jslib/jquery-1.11.2.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/jslib/cars/car-source.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/jslib/zkutil.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jslib/kkpager.js'/>"></script>
</html>
