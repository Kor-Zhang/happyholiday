<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 工具栏 -->
<div class="easyui-layout" data-options="fit:true,border:false">
	<div class="" data-options="region:'north',title:'筛选',border:false,collapsed:true" style="height:120px;">
		<form id="admins_zcfygl_searchForm" style="display: inline-block;" method="post">
			<table width="100%">
				<tr>
					
				
					<th>
						介绍：
					</th>
					<td>
						<input type="text" name="searchIntroduction" placeholder="检索介绍(可模糊查询)"/>	
					</td>
					<th>
						创建时间：
					</th>
					
					<td>
						<input name="minCreateTime" style=";" class="easyui-datetimebox" data-options="editable:false"/>-
					</td>
					<td>
						<input name="maxCreateTime" style=";" class="easyui-datetimebox" data-options="editable:false"/>
					</td>
					
				</tr>
				<tr>
					<th>
						费用名：
					</th>
					<td>
						<input type="text" name="searchName" placeholder="检索费用名(可模糊查询)"/>	
					</td>
					<th>
						单价：
					</th>
					
					<td>
						<input type="text" name=minPrice" placeholder="检索最小单价(可模糊查询)"/>	
					</td>
					<td>
						<input type="text" name="maxPrice" placeholder="检索最大单价(可模糊查询)"/>	
					</td>
					
				</tr>
				<tr>
					
					
					<td>
						<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onClick="zcfyglSearchFun();">查询</a>
						
					</td>
					<td>
						<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true" onClick="zcfyglClearFun();">清空</a>
					</td>
					<th>
						修改时间：
					</th>
					<td>
						<input name="minUpdateTime" style=";" class="easyui-datetimebox" data-options="editable:false"/>-
					</td>
					<td>
						<input name="maxUpdateTime" style=";" class="easyui-datetimebox" data-options="editable:false"/>
					</td>
				</tr>
			</table>
		</form>
	</div>	
	<div class="" data-options="region:'center'">
		<table id="admins_zcfygl_zcfyglDataGrid">
	
	
		</table>
	</div> 
</div>

<script type="text/javascript">
	var zcfyglDataGrid = undefined;
	//添加节点
	var zcfyglCheckUserId = undefined;
	//添加dialog
	var zcfyglAddDialog = undefined;
	//修改的dialog
	var zcfyglEditForm = undefined;
	//修改的form
	var zcfyglEditDialog = undefined;
	$(function($) {
		zcfyglDataGrid = $('#admins_zcfygl_zcfyglDataGrid').datagrid({
			
			url :'${pageContext.request.contextPath}/costAction!getDatagrid.action',
			pagination:true,
			fit:true,
			idField:'id',
			sortName:'createTime',
			sortOrder:'desc',
			multiSort:false,
			/* remoteSort:true, */
			selectOnCheck:true,
			checkOnSelect:true,
			singleSelect:true,
			frozenColumns:[[
			{
				field : 'checkbox',
				checkbox:true
			},{
				field : 'id',
				title : 'id',
				hidden:true
			}
	     	]],
			columns : [ [ {
				field : 'name',
				title : '费用名称',
				sortable:true
			} ,{
				field : 'introduction',
				title : '介绍',
				sortable:true
			}, {
				field : 'price',
				sortable:true,
				title : '单份价格'
			} , {
				field : 'createTime',
				title : '创建时间',
				sortable:true
			}, {
				field : 'updateTime',
				title : '修改时间',
				sortable:true
			} ] ],toolbar: [{
				text:'添加',
				iconCls: 'icon-add',
				handler: function(){
					zcfyglAdd();
				}
			},'-',{
				text:'删除',
				iconCls: 'icon-remove',
				handler: function(){
					zcfyglRemove();
				}
			},'-',{
				text:'编辑',
				iconCls: 'icon-edit',
				handler: function(){
					zcfyglEdit();
				}
			},'-',{
				text:'帮助',
				iconCls: 'icon-help',
				handler: function(){
					help();
				}
			}],
			onLoadSuccess:function(data){
				showMsg(data);
				//判断管理员是否在线
				try{
					isOnline(data);
				}catch(e){
					return;
				}
				
			}
	
	
		});
		/* //点击回车查询
		$('#admins_qxgl_searchId').keyup(function(e){
			if(e.keyCode==13){
				searchFun();
			}
		}); */
		
	});
	
	/**
	*查询
	**/
	function zcfyglSearchFun(){
		//获取查询的form参数
		var params = serializeObject($('#admins_zcfygl_searchForm'));
		zcfyglDataGrid.datagrid('load', params);
	}
	/**
	*清空
	**/
	function zcfyglClearFun(){
		$('#admins_zcfygl_searchForm input').val("");
		zcfyglDataGrid.datagrid('load', {});
		
	}
	/**
	*点击增加按钮，弹出dialog
	**/
	function zcfyglAdd(){
		//添加节点
		zcfyglAddDialog = $('<div/>').dialog({
			title:'增加',
			width:500,
			height:200,
			modal:true,
			href:'${pageContext.request.contextPath}/admins/cars/zcfygl_adddialog.jsp',
			onClose:function(){
				//删除以前的节点
				$(this).dialog('destroy');
				zcfyglAddDialog = undefined;
			},
			onOpen:function(){
			},
			onLoad:function(){
				
			}
		});
	}
	/**
	*点击删除数据
	**/
	function zcfyglRemove(){
		//选择的需要删除的行
		var checkedRows = zcfyglDataGrid.datagrid('getChecked');
		
		//判断是否选择行 
		if(checkedRows.length<1){
			$.messager.show({
				title:'提示',
				msg:'请勾选需要删除的记录！'
			});
		}else{
			//询问是否确认删除
			$.messager.confirm('提示','确认删除这'+checkedRows.length+'行？',function(r){
				if(r){
					var ids = [];
					for(var i = 0;i<checkedRows.length;i++){
						ids.push(checkedRows[i].id);
					}
					//链接服务器删除
					zkAjax("/costAction!deleteCost.action?deleteIds="+ids.join(','),function(data){
						var msg = data.msg;
						var success = data.success;
						//提示结果
						$.messager.show({
							title:'提示',
							msg:msg
						});
						try{
							//判断是否在线
							isOnline(data);
						}catch(e){
							return;
						}
						if(success){
							//重新加载
							zcfyglDataGrid.datagrid('load');
							//取消选择的行
							zcfyglDataGrid.datagrid('unselectAll');
							zcfyglDataGrid.datagrid('uncheckAll');
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
	/**
	*编辑
	**/
	function zcfyglEdit(){
		
		var checkedRow = zcfyglDataGrid.datagrid('getChecked');
		//是否选择一行
		if(checkedRow.length==1){
			
			//添加节点
			zcfyglEditDialog = $('<div/>').dialog({
				title:'编辑',
				width:500,
				height:200,
				modal:true,
				href:'${pageContext.request.contextPath}/admins/cars/zcfygl_editdialog.jsp',
				onClose:function(){
					//删除以前的节点
					$(this).dialog('destroy');
					zcfyglEditDialog = undefined;
				},
				onOpen:function(){
					
					
				},
				onLoad:function(){
					zcfyglEditForm = $('#admins_zcfygl_editdialog_editForm'); 
					zcfyglEditForm.form('load',checkedRow[0]);
					
				}
			});
			
			
		}else{
			//提示是否选择一行
			$.messager.show({
				title:'提示',
				msg:'只能同时操作一行'
			});
		}
		
		
	}
</script>