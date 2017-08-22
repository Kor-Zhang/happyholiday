<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'personal_order.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/csslib/users/personal_order.css'/>" />

  </head>
  
 <body>
 
 		<c:if test="${empty sessionScope.orders}">
 			<div class="myorder" id="content">
			<div class="notorder-bd">
				<img src='<c:url value="/img/car/grayben.png"></c:url>' height="120" width="120" />
				<p>还没租过车？速速来体验吧</p>
				<a class="orang-sub">立即租车</a>
			</div>
			</div>
 		</c:if>
		<c:if test="${not empty sessionScope.orders}">
		<div class="myorder" id="content">
			<table class="tb_order" border="0" cellpadding="0" cellpadding="0">
				<thead>
					<tr>
						<th class="a1">订单信息</th>
						<th width="197"></th>
						<th class="ac" width="263">取/还车信息</th>
						<th class="ac" width="110">总计</th>
						<th class="ac" width="110">订单状态</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${sessionScope.orders}" var="order" begin="0" end="10" varStatus="index">
					<tr>
						<td><img src="<c:url value='/frontCarsAction!getCarsImg.action?mainImgName=${order.mainImgName}'/>" height="97" width="166"/></td>
						<td class="ol-carinfo">
                                <b>${order.carBd}</b>
                                <p>${order.seatType}| ${order.drivingMode}| 乘坐${order.seatNumber}人</p>
                                <p>订单号:${order.id}</p>
                            </td>
                            <td>
                                <div class="ol-caraddress" style="cursor:default;">
                                    <p class="qhicon zctooltip">
                                    <i class="zc_fetch_i"></i>${order.getCarAddress}</p>
                                    <p class="qhtime">${order.getCarTime}</p>
                                    <p class="qhicon zctooltip" >
                                    <i class="zc_giveback_i"></i>${order.returnCarAddress}</p>
                                    <p class="qhtime">${order.returnCarTime}</p>
                                </div>
                            </td>
                            <td>
                                <div class="ol-aggregate">
                                    ¥<span>${order.totalPrice}</span>
                                </div>
                            </td>
                            <td class="ac">
                            
                            	<c:if test="${order.status==0}">
                            	<span class="s-green">预定成功</span>
                            	<span class="s-gray" style="padding-top:5px"><a id="${order.id}" style="cursor:pointer" class="cancel">取消订单</a></span>
                            	</c:if>
                            	<c:if test="${order.status==1}">
                            	<span class="s-blue">租赁中</span>
                            	</c:if>
                            	<c:if test="${order.status==2}">
                            	<span class="s-yellow">已完成</span>
                            	</c:if>
                            	<c:if test="${order.status==-1}">
                            	<span class="s-gray">已取消</span>
                            	</c:if>
                            	<c:if test="${order.status==-2}">
                            	<span class="s-gray">客服取消订单</span>
                            	</c:if>
                      
                            </td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		</c:if>
	</body>
	<script type="text/javascript"
	src="<c:url value='/jslib/jquery-1.11.2.min.js'/>"></script>
	<script>
		$(function(){
			$('.cancel').bind('click',function(){
				var id = $(this).attr('id');
				var data = {
						id:id,
				}
				$.ajax({
					url : getWebProjectName() + '/frontCarOrderAction!cancelOrder.action',
					dataType:'json',
					data:data,
					type:'post',
					success : function(data) {
						data = JSON.parse(data);
						if(data.status==1){
							window.location.href=getWebProjectName()+'/users/personal_success.jsp'
						}
					}
				});
			})
			
			$('.orang-sub').bind('click',function(){
				window.parent.parent.location.href=getWebProjectName()+'/cars/car-source.jsp';
			})
		})
		function getWebProjectName(){
			var webProjectName = undefined;
			//获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
		    var pathName=window.document.location.pathname;
			//获取带"/"的项目名，如：/uimcardprj
		    webProjectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
		    
			return webProjectName;
		}
	</script>
</html>
