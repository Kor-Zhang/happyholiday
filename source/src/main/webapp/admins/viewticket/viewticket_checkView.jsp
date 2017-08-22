<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table id="viewticket_views" data-options="fit:true,border:false">

</table>
<script>
	
	$(function(){
		$('#viewticket_views')
				.datagrid(
						{	
							url:'${pageContext.request.contextPath}/viewsAction!getOneViewDatagrid.action?id='+currentCheckViewId,

							singleSelect : true,
							
							fitColumns:true,
							//表头设计
							frozenColumns : [ [
									{
										field : 'id',
										hidden : true
									},
									{
										field : 'showImg',
										title : '图片',
										formatter : function(value, row, index) {
											var viewId = row.id;
											/* var carImg = "<span style='width:30px;' title='点击更新图片'><img style='width:30px;' src='${pageContext.request.contextPath}/carsAction!getCarsImg.action?id="+value+"'/></span>"; */
											var checkImgBtn = "<a href=javascript:checkViewImg('"
													+ viewId + "')>点击查看图片</a>";
											return checkImgBtn;
										}

									}, {
										field : 'country',
										title : '国家',
									
									}, {
										field : 'province',
										title : '省份',
										
									}, {
										field : 'city',
										title : '城市',
										
									}, {
										field : 'name',
										title : '景点名',
									
									}, {
										field : 'grade',
										title : '等级',
										
									}, {
										field : 'type',
										title : '风格',
									
									},{
										field : 'hasIntro',
										title : '景区介绍',
									
										align:"center",
										formatter: function(value,row,index){
											if(value){
												return "<font style='color:green;'>"+"是"+"</font>";
											}
											return "<font style='color:red;'>"+"否"+"</font>";
										}
									}] ],
							columns : [ [{
										field : 'address',
										title : '详细地址',
										
									}, {
										field : 'feature',
										title : '评价',
										
									}, {
										field : 'opentime',
										title : '开放时间',
										
									}, {
										field : 'endtime',
										title : '结束时间',
										
									}, {
										field : 'creatTime',
										title : '创建时间',
										
									} ] ],
						
						});
	});


</script>