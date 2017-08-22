<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div class="" data-options="region:'north',title:'筛选',border:false,collapsed:true" style="height:100px;">
		<form id="admins_syqctjgl_searchForm" style="display: inline-block;" method="post">
			<tr>
				<th>
					 提交时间：
				</th>
				<td>
					<input name="minCreateTime" style=";" class="easyui-datetimebox" data-options="editable:false"/>-
					
				</td>
				<td>
					<input name="maxCreateTime" style=";" class="easyui-datetimebox" data-options="editable:false"/>
					
				</td>
			</tr>
			<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onClick="syqctjglSearchFun();">查询</a>
			<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true" onClick="syqctjglClearFun();">清空</a>
		</form>
	</div>	
	<div class="" data-options="region:'center'">
		<table id="admins_syqctjgl_datagrid" data-options="fit:true,border:false">

		</table>	
	</div>
</div>


<script type="text/javascript" src="<c:url value='/jslib/zkutil.js'/>"></script>
<script type="text/javascript">
	//添加轮播图片的dialog
	var syqctjglAddDialog = undefined;
	//添加轮播图片的form
	var syqctjglAddImgForm = undefined;
	var syqctjglDatagrid = undefined;
	$(function($) {
		syqctjglDatagrid = $('#admins_syqctjgl_datagrid').datagrid({
			
			url :'${pageContext.request.contextPath}/recommendCarsAction!getDatagrid.action',
			pagination:true,
			fit:true,
			idField:'id',
			sortName:'id',
			sortOrder:'desc',
			multiSort:false,
			/* remoteSort:true, */
			selectOnCheck:true,
			checkOnSelect:true,
			singleSelect:true,
			columns : [ [  {
				field : 'id',
				title : 'id',
				hidden:true
			}, {
				field : 'imgName',
				sortable:true,
				title : '图片',
				width:250,
				height:250,
				formatter: function(value,row,index){
					var carImg = "<span  style='width:250px;' title=''><img style='width:250px;height:126px' src='${pageContext.request.contextPath}/recommendCarsAction!getRecommendCarByImgName.action?imgName="+value+"&t="+new Date().getTime()+"'/></span>";
					
					return carImg;
				}
			} ,{
				field : 'carId',
				title : '查看汽车',
				sortable:true,
				formatter: function(value,row,index){
					
					var btn = "<a href=javascript:checkCar('"+value+"');>查看汽车</a>";
					return btn;
				}
			} , {
				field : 'introduction',
				title : '备注',
				sortable:true,
				hidden:true
			}, {
				field : 'createTime',
				title : '创建时间'
			}] ],toolbar: [ {
				text:'添加',
				iconCls: 'icon-add',
				handler: function(){
					syqctjglAdd();
				}
			},'-',{
				text:'删除',
				iconCls: 'icon-remove',
				handler: function(){
					syqctjglRemove();
				}
			},/*'-',{
				text:'修改',
				iconCls: 'icon-edit',
				handler: function(){
					editPwd();
				}
			},'-',*/{
				text:'帮助',
				iconCls: 'icon-help',
				handler: function(){
					help();
				}
			}],
			onLoadSuccess:function(data){
				showMsg(data);
				//判断管理员是否在线
				var online = data.online;
				if(!online){
					loginDialog.dialog('open');
					return;
				}
				
			}


		});
		
		
	});
	
	/**
	*查询
	**/
	function syqctjglSearchFun(){
		//获取查询的form参数
		var params = serializeObject($('#admins_syqctjgl_searchForm'));
		syqctjglDatagrid.datagrid('load', params);
	}
	/**
	*清空
	**/
	function syqctjglClearFun(){
		//清空input
		$('#admins_syqctjgl_searchForm input').val("");
		//select选择第一个option
		firstOption("admins_syqctjgl_searchForm");
		//重新加载
		syqctjglDatagrid.datagrid('load', {});
		
	}
	/**
	*添加
	*/
	function syqctjglAdd(){
		
		//添加节点
		syqctjglAddDialog = $('<div/>').dialog({
			title:'增加',
			width:980,
			height:600,
			maximizable:true,
			modal:true,
			href:'${pageContext.request.contextPath}/admins/cars/syqctjgl_adddialog.jsp',
			onClose:function(){
				//删除以前的节点
				$(this).dialog('destroy');
				syqctjglAddDialog = undefined;
			},
			onOpen:function(){
			},
			onLoad:function(){
			}
		});
	}
	
	/**
	*删除
	*/
	function syqctjglRemove(){
		//选择的需要删除的行
		var checkedRows = syqctjglDatagrid.datagrid('getChecked');
		
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
					zkAjax("/recommendCarsAction!deleteRecommendCar.action?deleteIds="+ids.join(','),function(data){
						var success = data.success;
						//提示结果
						showMsg(data);
						try{
							//判断是否在线
							isOnline(data);
						}catch(e){
							return;
						}
						if(success){
							//重新加载
							syqctjglDatagrid.datagrid('load');
							//取消选择的行
							syqctjglDatagrid.datagrid('unselectAll');
							syqctjglDatagrid.datagrid('uncheckAll');
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
</script>


