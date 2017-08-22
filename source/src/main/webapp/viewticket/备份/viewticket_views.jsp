<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>My JSP 'viewticket.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--导入  -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/jslib/jquery-easyui-1.4.1/themes/bootstrap/easyui.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/jslib/jquery-easyui-1.4.1/themes/icon.css'/>">

<style>
	*{
		color: black;
		font-family: "Microsoft YaHei";
		font-size:14px;
	}
	#save{
		float:right;
		margin:5px 5px;
	}
</style>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true,border:false">
		<div class="" data-options="region:'north',title:'筛选',border:false"
			style="height:240px;"></div>
		<div class="" data-options="region:'center'">
			<table id="viewticket_views" data-options="fit:true,border:false">

			</table>
		</div>
	</div>
	
</body>
<script type="text/javascript"
	src="<c:url value='/jslib/jquery-easyui-1.4.1/jquery.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/jslib/jquery-easyui-1.4.1/jquery.easyui.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/jslib/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/jslib/zkutil.js'/>"></script>
<script type="text/javascript">
	//景区的datagrid
	var viewAddDialog = undefined;
    var addViewForm  = undefined;
	var viewDataDialog = undefined;
	//景区图片窗口
	var viewImgDialog = undefined;
	var viewImgDatagrid = undefined;
	
	//记录当前景区ID
	var currentViewId = undefined;
	
	var editRowIndex = undefined;
	$(function() {
		//views表格
	 viewDataDialog = 	$('#viewticket_views')
				.datagrid(
						{	
							url:'${pageContext.request.contextPath}/viewsAction!getViewsDatagrid.action',
							title : '景区列表',
							singleSelect : true,
							pagination : true,
							rownumbers : true,
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
											var checkImgBtn = "<a href=javascript:showViewImgDialog('"
													+ viewId + "')>点击查看图片</a>";
											return checkImgBtn;
										}

									}, {
										field : 'country',
										title : '国家',
										sortable : true
									}, {
										field : 'province',
										title : '省份',
										sortable : true
									}, {
										field : 'city',
										title : '城市',
										sortable : true
									}, {
										field : 'name',
										title : '景点名',
										sortable : true
									}, {
										field : 'grade',
										title : '等级',
										sortable : true
									}, {
										field : 'address',
										title : '详细地址',
										sortable : true
									}, {
										field : 'feature',
										title : '评价',
										sortable : true
									}, {
										field : 'opentime',
										title : '开放时间',
										sortable : true
									}, {
										field : 'endtime',
										title : '结束时间',
										sortable : true
									}, {
										field : 'creatTime',
										title : '创建时间',
										sortable : true
									} ] ],
							/* columns : [ [ {
								field : 'grade',
								title : '等级',
								sortable : true
							}, ] ] */

							// 工具栏设计
							toolbar : [ {
								text : '添加',
								iconCls : 'icon-add',
								handler : addrow
							}, {
								text : '删除',
								iconCls : 'icon-remove',
								handler : deleterow
							}, {
								text : '编辑',
								iconCls : 'icon-edit',
								handler : editrow
							} ],
							onClickRow : function(index, row) {
								editRowIndex = index;
							}
						})
	});
	//添加景区
	function addrow(){
		
		viewAddDialog =  $('<div/>').dialog({
			title:'增加',
			width:850,
			height:450, 
			modal:true,
			href:'${pageContext.request.contextPath}/viewticket/back/viewticket_views_addview.jsp',
			onClose:function(){
				//删除以前的节点
				$(this).dialog('destroy');
				viewAddDialog = undefined;
			},
			onOpen:function(){
			},
			onLoad:function(){
				//初始化dialog及其内部标签
				addViewForm = $('#addViewForm');
			}
		});
		
	}
	
	
	
	//删除景区
	function deleterow(){
		if(editRowIndex==undefined){
			alert('请选择一行')
		}else{
			alert(editRowIndex)
		}   
	}
	//编辑景区
	function editrow(){
		 alert('editrow')        
	}
	//显示景区图片
	function showViewImgDialog(viewId){
		//记录当前ID
		currentViewId = viewId;
		//添加节点
		viewImgDialog = $('<div/>').dialog({
			title:'查看并管理景区图片',
			width:600,
			height:400,
			resizable:true,
			minimizable:true,
			maximizable:true,
			modal:true,
			href:'${pageContext.request.contextPath}/viewticket/back/viewticket_views_viewImg.jsp',
			onClose:function(){
				//删除以前的节点
				$(this).dialog('destroy');
				viewImgDialog = undefined;
			},
			onOpen:function(){
				
			},
			onLoad:function(){
			}
		});
	}
	
	
	
</script>
</html>
