<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	*{
		color: black;
		font-family: "Microsoft YaHei";
		font-size:14px;
	}
</style>
	<div class="easyui-layout" data-options="fit:true,border:false">
		<div class="" data-options="region:'north',title:'筛选',border:false"
			style="height:170px;">
		<form id="ticketSearch" action="" style="width:860px">
			<table cellpadding="5px">
					<tr>
						<td>票名:</td>
						<td><input type="text" name="searchName" placeholder="检索门票名(可模糊查询)"/></td>
						<td>票种:</td>
						<td>
							<select id="searchType" name="searchType" >
							<option></option>
							</select>
						</td>
						<td>票型:</td>
						<td>
						<select  id="searchStyle" name="searchStyle" >
							<option></option>
							</select>
						</td>
						<td>支付方式:</td>
						<td>
							<select  id="searchPayType" name="searchPayType" >
							<option></option>
							</select>
						</td>
					</tr>
					<tr>
						<td>市场价:</td>
						<td><input type="text" name="minMarketPrice" placeholder="最小市场价"/></td>
						<td>----</td>
						<td><input type="text" name="maxMarketPrice" placeholder="最大市场价" /></td>
						<td></td>
						<td><a href="javascript:void(0);"  class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true" onClick="clearTicket();">清空</a>
					</tr>
					<tr>
						<td>幸福价:</td>
						<td><input type="text" name="minHappyPrice" placeholder="最小幸福价"/></td>
						<td>----</td>
						<td><input type="text" name="maxHappyPrice" placeholder="最大幸福价" /></td>
						<td></td>
						<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onClick="searchTicket();" >查询</a></td>
					</tr>
			</table>
				
		</form>
				
			
		</div>
		<div class="" data-options="region:'center'">
			<table id="viewticket_tickets" data-options="fit:true,border:false">

			</table>
		</div>
	</div>
	
</body>
<script type="text/javascript">
	//景区窗口
	var viewTicketDataDialog  = undefined;
	var addViewTicketDialog = undefined;
	var addViewTicketForm = undefined;
	var editViewTicketDialog = undefined;
	var editViewTicketForm = undefined;
	//下拉框条件
	var searchType = $("#searchType");
	var searchStyle = $("#searchStyle");
	var searchPayType = $("#searchPayType");
	
	//显示票种
	function  showsearchType(){
		//远程加载下拉框数据
		zkAjax("/frontSystemddlAction!getSystemddlByParentId.action?id=7",function(data){
		
			var rows = data;
			for (var i = 0; i < rows.length; i++) {
				searchType.show();
				searchType.append("<option value="+rows[i].text+">"+rows[i].text+"</option>");
			}
		});	
	}
	
	//显示票型
	function showsearchStyle(){
		//远程加载下拉框数据
		zkAjax("/frontSystemddlAction!getSystemddlByParentId.action?id=6",function(data){
			
			var rows = data;
			for (var i = 0; i < rows.length; i++) {
				searchStyle.show();
				searchStyle.append("<option value="+rows[i].text+">"+rows[i].text+"</option>");
			}
		});	
		
	}
	//显示支付方式
	function showsearchPayType(){
		//远程加载下拉框数据
		zkAjax("/frontSystemddlAction!getSystemddlByParentId.action?id=10",function(data){
			
			var rows = data;
			for (var i = 0; i < rows.length; i++) {
				searchPayType.show();
				searchPayType.append("<option value="+rows[i].text+">"+rows[i].text+"</option>");
			}
		});	
	}
	
	
	
	$(function(){
		showsearchType();
		showsearchStyle();
		showsearchPayType();
		//views表格
		 viewTicketDataDialog = $('#viewticket_tickets')
					.datagrid(
							{	
								url:'${pageContext.request.contextPath}/viewTicketsAction!getViewTicketsDatagrid.action',
								title : '景区门票列表',
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

								// 工具栏设计
								toolbar : [ {
									text : '添加',
									iconCls : 'icon-add',
									handler: addViewTicket
									
								}, {
									text : '删除',
									iconCls : 'icon-remove',
									handler : deleteViewTicket
									
								}, {
									text : '编辑',
									iconCls : 'icon-edit',
									handler : editViewTicket
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

							
							
							});
		
	});
	
	function addViewTicket(){
		addViewTicketDialog =  $('<div/>').dialog({
			title:'添加门票',
			width:650,
			height:450, 
			modal:true,
			href:'${pageContext.request.contextPath}/admins/viewticket/viewticket_tickets_add.jsp',
			onClose:function(){
				//删除以前的节点
				$(this).dialog('destroy');
				viewTicketDataDialog = undefined;
			},
			onOpen:function(){
			},
			onLoad:function(){
				//初始化dialog及其内部标签
				addViewTicketForm = $('#addViewTicketForm');
			}
		});
	}
	
	function deleteViewTicket(){
		var checkedRows = viewTicketDataDialog.datagrid('getChecked');
		if(checkedRows.length<1){
			$.messager.show({
				title:'提示',
				msg:'请勾选需要删除的记录！'
			});
		}else{
			//询问是否确认删除
			$.messager.confirm('提示','确认删除这'+checkedRows.length+'行？',function(r){
				if(r){
					var id = checkedRows[0].id;
					//链接服务器删除
					zkAjax("/viewTicketsAction!deleteViewTicket.action?id="+id,function(data){
						
						var success = data.success;
						var msg = data.msg;
						//提示结果
						$.messager.show({
								title:'提示',
								msg:msg
						});
						
						if(success){
							//重新加载
							viewTicketDataDialog.datagrid('reload');
							//取消选择的行
							viewTicketDataDialog.datagrid('unselectAll');
							viewTicketDataDialog.datagrid('uncheckAll');
						}else{
							
						}
						
					});
				}else{
					//提示取消删除
					$.messager.show({
						title:'提示',
						msg:'取消删除！'
					});
				}
			});
		}
	}
	
	function editViewTicket(){
		var checkedRow = viewTicketDataDialog.datagrid('getChecked');
		if(checkedRow.length<1){
			$.messager.show({
				title:'提示',
				msg:'请选择要编辑的记录！'
			});
		}else{
			
			editViewTicketDialog =  $('<div/>').dialog({
			title:'编辑门票信息',
			width:650,
			height:400, 
			modal:true,
			href:'${pageContext.request.contextPath}/admins/viewticket/viewticket_tickets_edit.jsp',
			onClose:function(){
				//删除以前的节点
				$(this).dialog('destroy');
				editViewTicketDialog = undefined;
			},
			onOpen:function(){
			},
			onLoad:function(){
				//初始化dialog及其内部标签
				editViewTicketForm = $('#editViewTicketForm');
				editViewTicketForm.form('load',checkedRow[0]);
			
			}
		});
			
		}
	}
	
	
	//查询
	function searchTicket(){
		var params = serializeObject($('#ticketSearch'));
		console.info(params);
		viewTicketDataDialog.datagrid('load', params);
	}
	function clearTicket(){
		$("#ticketSearch input").val("");
		$("#ticketSearch select").val("");
		$('#viewticket_tickets').datagrid('load', {});
	}
</script>
</html>
