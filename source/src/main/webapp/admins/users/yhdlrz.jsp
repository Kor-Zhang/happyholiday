<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 工具栏 -->
<div class="easyui-layout" data-options="fit:true,border:false">
	<div class="" data-options="region:'north',title:'筛选',border:false,collapsed:true" style="height:100px;">
		<form id="admins_yhdlrz_searchForm" style="display: inline-block;" method="post">
			<input type="text" id="admins_yhdlrz_searchId" name="searchId" placeholder="检索有户名(可模糊查询)"/>	
			<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onClick="yhdlrzSearchFun();">查询</a>
			<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true" onClick="yhdlrzclearFun();">清空</a>
		</form>
	</div>	
	<div class="" data-options="region:'center'">
		<table id="admins_yhdlrz_yhdlrzDataGrid">
	
	
		</table>
	</div> 
</div>

<script type="text/javascript">
	var yhdlrzDataGrid = undefined;
	//添加节点
	var yhdlrzCheckUserId = undefined;
	$(function($) {
		yhdlrzDataGrid = $('#admins_yhdlrz_yhdlrzDataGrid').datagrid({
			
			url :'${pageContext.request.contextPath}/userLoginRecordAction!getDatagrid.action',
			pagination:true,
			fit:true,
			idField:'id',
			sortName:'loginTime',
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
				field : 'userPhone',
				title : '登陆账户',
				sortable:true,
				formatter: function(value,row,index){
					var userId = row.userId;
					var btn = "<a href=javascript:checkUser('"+userId+"');>"+value+"</a>";
					return btn;
				}
			}
	     	]],
			columns : [ [ {
				field : 'loginRecordId',
				title : 'loginrecordid',
				hidden:true
			} ,{
				field : 'loginAddress',
				title : '地点',
				sortable:true
			}, {
				field : 'loginIp',
				sortable:true,
				title : 'ip'
			} , {
				field : 'loginTime',
				title : '登录时间',
				sortable:true
			}, {
				field : 'logoffTime',
				title : '注销时间',
				sortable:true
			} ] ],toolbar: [{
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
	function yhdlrzSearchFun(){
		//获取查询的form参数
		var params = serializeObject($('#admins_yhdlrz_searchForm'));
		yhdlrzDataGrid.datagrid('load', params);
	}
	/**
	*清空
	**/
	function yhdlrzclearFun(){
		$('#admins_yhdlrz_searchId').val("");
		yhdlrzDataGrid.datagrid('load', {});
		
	}
	
</script>