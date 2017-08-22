<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table id="viewticket_viewtickets" data-options="fit:true,border:false">

</table>
<script>
	$(function(){
		$('#viewticket_viewtickets')
				.datagrid(
						{	
							url:'${pageContext.request.contextPath}/viewTicketsAction!getOneViewTicket.action?id='+currentCheckViewTicketId,

							singleSelect : true,
							
							fitColumns:true,
							//表头设计
								frozenColumns : [ [
										{
											field : 'id',
											hidden : true
										},
										{
											field : 'viewId',
											title : '景区',
											formatter : function(value, row, index) {
												var btn = "<a href=javascript:checkView('"+value+"');>查看景区</a>";
												return btn;
											}

										}, {
											field : 'name',
											title : '景区门票名',
											sortable : true
										}, {
											field : 'type',
											title : '票种',
											sortable : true
										}, {
											field : 'style',
											title : '票型',
											sortable : true
										}, {
											field : 'orderTime',
											title : '提取预定时间',
											sortable : true
										}, {
											field : 'marketPrice',
											title : '市场价',
											sortable : true,
											align:"center",
										}, {
											field : 'happyPrice',
											title : '幸福价',
											sortable : true,
											align:"center",
											formatter: function(value,row,index){
												return "<font style='color:orange;'>"+value+"</font>";
											}
										},{
											field : 'payType',
											title : '支付方式',
											sortable : true	,
										}] ],
								columns : [ [ {
											field : 'creatTime',
											title : '创建时间',
											sortable : true
										} ] ],
						
						});
	});


</script>