<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 工具栏 -->
<div class="easyui-layout" data-options="fit:true,border:false">
	<div class="" data-options="region:'north',title:'筛选',border:false" style="height:100px;">
		<form id="admins_yhglrz_searchForm" style="display: inline-block;" method="post">
			<input type="text" id="admins_yhglrz_searchId" name="searchId" placeholder="检索有户名(可模糊查询)"/>	
			<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onClick="yhglrzSearchFun();">查询</a>
			<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true" onClick="yhglrzClearFun();">清空</a>
		</form>
	</div>	
	<div class="" data-options="region:'center'">
		<table id="admins_yhglrz_yhglrzDataGrid">
	
	
		</table>
	</div>
</div>

<script type="text/javascript">
	var yhglrzDataGrid = undefined;
	var yhglrzCheckAdminDialog = undefined;
	var yhglrzCurrtAdminId = undefined; 
	var yhglrzCurrtAdminId = undefined;
	$(function($) {
		yhglrzDataGrid = $('#admins_yhglrz_yhglrzDataGrid').datagrid({
			
			url :'${pageContext.request.contextPath}/userUpdateRecordAction!getDatagrid.action',
			pagination:true,
			fit:true,
			idField:'doAdminId',
			sortName:'doAdminId',
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
				field : 'adminId',
				title : '操作员',
				sortable:true,
				formatter: function(value,row,index){
					if(value==""){
						var userId = row.userId;
						var btn = "<a href=javascript:checkUser('"+userId+"');>本人</a>";
						return btn;
					}
					return "<a href=javascript:checkAdmin('"+value+"');>"+value+"</a>";
				}
			},{
				field : 'userPhone',
				title : '被操作用户',
				sortable:true,
				formatter: function(value,row,index){
					var userId = row.userId;
					var btn = "<a href=javascript:checkUser('"+userId+"');>"+value+"</a>";
					return btn;
				}
			}
	     	]],
			columns : [ [ {
				field : 'updateRecordId',
				hidden:true
			}, {
				field : 'item',
				title : '操作项目'
			} ,{
				field : 'updateTime',
				title : '操作时间',
				sortable:true
			} ] ],toolbar: [{
				text:'帮助',
				iconCls: 'icon-help',
				handler: function(){
					help();
				}
			}],
			onLoadSuccess:function(data){
				$.messager.show({
					title:'提示',
					msg:data.msg
					
				});
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
	function yhglrzSearchFun(){
		//获取查询的form参数
		var params = serializeObject($('#admins_yhglrz_searchForm'));
		yhglrzDataGrid.datagrid('load', params);
	}
	/**
	*清空
	**/
	function yhglrzClearFun(){
		$('#admins_yhglrz_searchId').val("");
		yhglrzDataGrid.datagrid('load', {});
		
	}
	
	
	
</script>