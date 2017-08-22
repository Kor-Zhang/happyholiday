<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
* {
	color: black;
	font-family: "Microsoft YaHei";
	font-size: 14px;
}

#save {
	float: right;
	margin: 5px 5px;
}
</style>

<div class="easyui-layout" data-options="fit:true,border:false">
	<div class="" data-options="region:'north',title:'筛选',border:false"
		style="height:140px;">
		<form id="viewSearch" action="" style="width:860px">
			<table cellpadding="5px">
				<tr>
					<td>国家:</td>
					<td><input type="text" name="searchCountry"
						placeholder="检索国家(可模糊查询)" /></td>
					<td>省份:</td>
					<td><input type="text" name="searchProvince"
						placeholder="检索省份(可模糊查询)" /></td>
					<td>城市:</td>
					<td><input type="text" name="searchCity"
						placeholder="检索城市(可模糊查询)" /></td>
					<td>景区名:</td>
					<td><input type="text" name="searchName"
						placeholder="检索景区名(可模糊查询)" /></td>
				</tr>
				<tr>
					<td>等级:</td>
					<td><input type="text" name="searchGrade"
						placeholder="检索等级(可模糊查询)" /></td>
					<td>风格:</td>
					<td><input type="text" name="searchType"
						placeholder="检索风格(可模糊查询)" /></td>
					<td>地址:</td>
					<td><input type="text" name="searchAddress"
						placeholder="检索地址(可模糊查询)" /></td>
				</tr>
				<tr>
					<td></td>

					<td><a href="javascript:void(0);" id="cancel"
						class="easyui-linkbutton"
						data-options="iconCls:'icon-cancel',plain:true"
						onClick="searchClear();">清空</a></td>
					<td></td>
					<td><a href="javascript:void(0);" class="easyui-linkbutton"
						data-options="iconCls:'icon-search',plain:true"
						onClick="searchView();">查询</a></td>
				</tr>
			</table>

		</form>


	</div>
	<div class="" data-options="region:'center'">
		<table id="viewticket_views" data-options="fit:true,border:false">

		</table>
	</div>
</div>
<script type="text/javascript">
	//景区的datagrid
	var viewAddDialog = undefined;
	var addViewForm = undefined;
	var viewDataDialog = undefined;
	var viewEidtDialog = undefined;
	var editViewForm = undefined;
	//景区图片窗口
	var viewImgDialog = undefined;
	var viewImgDatagrid = undefined;

	//记录当前景区ID
	var currentViewId = undefined;

	$(function() {
		//views表格
		viewDataDialog = $('#viewticket_views')
				.datagrid(
						{
							url : '${pageContext.request.contextPath}/viewsAction!getViewsDatagrid.action',
							title : '景区列表',
							singleSelect : true,
							pagination : true,
							rownumbers : true,
							fitColumns : true,
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

									},
									{
										field : 'country',
										title : '国家',
										sortable : true
									},
									{
										field : 'province',
										title : '省份',
										sortable : true
									},
									{
										field : 'city',
										title : '城市',
										sortable : true
									},
									{
										field : 'name',
										title : '景点名',
										sortable : true
									},
									{
										field : 'grade',
										title : '等级',
										sortable : true
									},
									{
										field : 'type',
										title : '风格',
										sortable : true
									},
									{
										field : 'hasIntro',
										title : '景区介绍',
										sortable : true,
										align : "center",
										formatter : function(value, row, index) {
											if (value) {
												return "<font style='color:green;'>"
														+ "是" + "</font>";
											}
											return "<font style='color:red;'>"
													+ "否" + "</font>";
										}
									},
									{
										field : 'salesNumber',
										title : '销量',
										sortable : true,
										align : "center",
										formatter : function(value, row, index) {
											if (value > 500) {
												return "<font style='color:red;'>"
														+ value + "</font>";
											} else {
												return "<foont>" + value
														+ "</font>";
											}
										}
									} ] ],
							columns : [ [ {
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
								field : 'creatTime',
								title : '创建时间',
								sortable : true
							} ] ],

							// 工具栏设计
							toolbar : [ {
								text : '添加',
								iconCls : 'icon-add',
								handler : addView
							}, {
								text : '删除',
								iconCls : 'icon-remove',
								handler : deleteView
							}, {
								text : '编辑',
								iconCls : 'icon-edit',
								handler : editView
							} ],
							onLoadSuccess:function(data){
								showMsg(data);
								console.info(data);
								//判断管理员是否在线
								try{
									isOnline(data);
								}catch(e){
									return;
								}
							}

						})
	});
	//添加景区
	function addView() {

		viewAddDialog = $('<div/>')
				.dialog(
						{
							title : '增加',
							width : 850,
							height : 450,
							modal : true,
							href : '${pageContext.request.contextPath}/admins/viewticket/viewticket_views_addview.jsp',
							onClose : function() {
								//删除以前的节点
								$(this).dialog('destroy');
								viewAddDialog = undefined;
							},
							onOpen : function() {
							},
							onLoad : function() {
								//初始化dialog及其内部标签
								addViewForm = $('#addViewForm');
							}
						});

	}

	//删除景区
	function deleteView() {
		var checkedRows = viewDataDialog.datagrid('getChecked');
		if (checkedRows.length < 1) {
			$.messager.show({
				title : '提示',
				msg : '请勾选需要删除的记录！'
			});
		} else {
			//询问是否确认删除
			$.messager.confirm('提示', '确认删除这' + checkedRows.length + '行？',
					function(r) {
						if (r) {
							var id = checkedRows[0].id;
							//链接服务器删除
							zkAjax("/viewsAction!deleteView.action?id=" + id,
									function(data) {

										var success = data.success;
										var msg = data.msg;
										//提示结果
										$.messager.show({
											title : '提示',
											msg : msg
										});

										if (success) {
											//重新加载
											viewDataDialog.datagrid('reload');
											//取消选择的行
											viewDataDialog
													.datagrid('unselectAll');
											viewDataDialog
													.datagrid('uncheckAll');
										} else {

										}

									});
						} else {
							//提示取消删除
							$.messager.show({
								title : '提示',
								msg : '取消删除！'
							});
						}
					});
		}

	}
	//编辑景区
	function editView() {
		var checkedRow = viewDataDialog.datagrid('getChecked');
		if (checkedRow.length < 1) {
			$.messager.show({
				title : '提示',
				msg : '请选择要编辑的记录！'
			});
		} else {

			viewEidtDialog = $('<div/>')
					.dialog(
							{
								title : '增加',
								width : 850,
								height : 450,
								modal : true,
								href : '${pageContext.request.contextPath}/admins/viewticket/viewticket_views_editview.jsp',
								onClose : function() {
									//删除以前的节点
									$(this).dialog('destroy');
									viewEidtDialog = undefined;
								},
								onOpen : function() {
								},
								onLoad : function() {
									//初始化dialog及其内部标签
									editViewForm = $('#editViewForm');
									editViewForm.form('load', checkedRow[0]);

								}
							});

		}
	}
	//显示景区图片
	function showViewImgDialog(viewId) {

		//记录当前ID
		currentViewId = viewId;
		//添加节点
		viewImgDialog = $('<div/>')
				.dialog(
						{
							title : '查看并管理景区图片',
							width : 600,
							height : 400,
							resizable : true,
							minimizable : true,
							maximizable : true,
							modal : true,
							href : '${pageContext.request.contextPath}/admins/viewticket/viewticket_views_viewImg.jsp',
							onClose : function() {
								//删除以前的节点
								$(this).dialog('destroy');
								viewImgDialog = undefined;
							},
							onOpen : function() {

							},
							onLoad : function() {
							}
						});
	}
	/**
	查询方法
	 */
	function searchView() {
		//获取查询的form参数
		var params = serializeObject($('#viewSearch'));
		console.info(params);
		viewDataDialog.datagrid('load', params);
	}

	function searchClear() {
		//清空input
		$('#viewSearch input').val("");
		viewDataDialog.datagrid('load', {});
	}
</script>
