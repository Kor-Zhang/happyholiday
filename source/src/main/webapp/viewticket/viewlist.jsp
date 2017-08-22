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
	href="<c:url value='/csslib/viewticket/viewlist.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/jslib/kkpager/kkpager_orange.css'/>" />

</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<!--主内容开始-->
	<div class="container">
		<!--搜索条件开始-->
		<div class="select-list">
			<div class="left">
				<a id="rcommend" class="active" title="不限">不限</a> <a class="nums"
					title="人气由高到底">人气</a> <a class="prices" title="价格">价格 <i></i>
				</a>
				<div class="prices-box">
					<a id="hightolow" title="价格从高到底">价格从高到低</a> <a id="lowtohigh"
						title="价格从高到底">价格从低到高</a>
				</div>
			</div>
			<div class="right">
				<span class="sight-subjiect">景点主题:</span>
				<dl class="sight-subjiect-list">
					<dd class="active" onclick="selectSub(this)">
						<span class="span">不限</span>
					</dd>

				</dl>
			</div>
		</div>
		<div class="clear"></div>
		<!--搜索条件结束-->
		<div id="total" style="display:none">${sessionScope.viewsTotal}</div>
		<div id="province" style="display:none">${sessionScope.frontViews[0].province}</div>
		<div id="keyword" style="display:none">${sessionScope.keyword}</div>
		<!--门票列表开始-->
		<div class="sight">
			<c:if test="${sessionScope.viewsTotal==0}">
				未找到相关景点！请重新搜索 
			</c:if>
			<c:forEach items="${sessionScope.frontViews}"  var="view" begin="0" end="10"
				varStatus="index">
				<div class="sight-item">
					<div class="sight-item-img">
						<img src="<c:url value='/frontViewsAction!getViewImg.action?imgName=${view.imgName}'/>" width="280" height="200">
					</div>
					<div class="sight-item-info">
						<h3 class="sight-item-name">${view.name}</h3>
						<div class="sight-item-address">
							<span class="level">${view.grade}景区</span> <span class="area">[${view.province}-${view.city}]</span>
						</div>
						<div class="address">地址 : ${view.address}</div>
						<div class="feature">特色 : ${view.feature }</div>
					</div>
					<div class="sight-item-order">
						<table>
							<tbody>
								<tr>
									<td><span class="sight-item-price"> <i>￥</i> <em>${view.lowPrice}</em>起
									</span></td>
								</tr>
								<tr>
									<td><!-- <span class="sight-item-discount">5折</span> --> <span
										class="sight-item-source">票面价: ${view.marketPrice}</span></td>
								</tr>
								<tr>
									<td class="hh"><a id="${view.id}"  href="<c:url value='/frontViewsAction!getOneView.action?id=${view.id}'/>" class="sight-item-do" target="_blank">预定</a>
									</td>
								</tr>
								<tr>
									<td class="sight-item-soldNum">月销量:<span class="hot-num">${view.salesNumber}</span></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="clear"></div>
				</div>
			</c:forEach>
		</div>
		<!--门票列表结束-->
		<!--TOP排行榜开始-->
		<div class="top-ticket">
			<h3>TOP10</h3>
			<ul class="top-list">
				<c:forEach items="${sessionScope.top10}" begin="0" end="0" var="top10">
					<li class="on" onmouseenter="topOn(this)"
						onmouseleave="topOff(this)"><a  href="<c:url value='/frontViewsAction!getOneView.action?id=${top10.id}'/>" target="_blank"> <em>1</em>
							${top10.name}<img src="<c:url value='/frontViewsAction!getViewImg.action?imgName=${top10.imgName}'/>" width="200" height="100" />
					</a></li>	
				 </c:forEach>
				<c:forEach items="${sessionScope.top10}" begin="1" end="${sessionScope.top10.size()}" var="top10" varStatus="index">
					<li class="" onmouseenter="topOn(this)"
						onmouseleave="topOff(this)"><a href="<c:url value='/frontViewsAction!getOneView.action?id=${top10.id}'/>"  target="_blank"> <em>${index.index+1}</em>
							${top10.name}<img src="<c:url value='/frontViewsAction!getViewImg.action?imgName=${top10.imgName}'/>" width="200" height="100" />
					</a></li>	
				 </c:forEach>
			</ul>
		</div>
		<div class="clear"></div>
		<!--TOP排行榜结束-->
		<!--分页开始-->
		<div id='kkpager'></div>
		<!--分页结束-->
	</div>
	<!--主内容结束-->
	<jsp:include page="../bottom.jsp"></jsp:include>
</body>
<script type="text/javascript"
	src="<c:url value='/jslib/jquery-1.11.2.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jslib/kkpager.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/jslib/viewticket/viewlist.js'/>"></script>

</html>
