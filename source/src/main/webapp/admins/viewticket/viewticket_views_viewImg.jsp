<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table id="viewImgs">
	
</table>
<script>
	var addViewImgDialog = undefined;
	var addViewImgForm = undefined;
	viewImgDatagrid  = $("#viewImgs").datagrid({
		url :'${pageContext.request.contextPath}/viewsAction!getViewImgsDatagridById.action?id='+currentViewId,
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
		columns:[[
		{
			field : 'checkbox',
			checkbox:true
		},{
			field : 'id',
			hidden:true
		},{
			field : 'imgName',
			title : '图片',
			width:200,
			height:150,
			formatter: function(value,row,index){
				var viewImg = "<span style='width:200px;height:150px'><img style='width:200px;height:150px' src='${pageContext.request.contextPath}/viewsAction!getViewImgsByImgName.action?imgName="+value+"&t="+new Date().getTime()+"'/></span>";
				return viewImg;
			}
		},{
			field : 'main',
			title : '主要图片',
			width:200,
			formatter: function(value,row,index){
				if(value){
					return "<font style='color:green;'>是</font>";
				}
				return "<font style='color:red;'>否</font>";
			}
		}] ],toolbar: [{
			text:'添加',
			iconCls: 'icon-add',
			handler : addViewImg,
			
		},'-',{
			text:'删除',
			iconCls: 'icon-remove',
			handler : deleteViewImg,
		},'-',{
			text :'设置为主要',
			iconCls : 'icon-ok',
			handler : setMain,
		}],
		

	});
	
	
	//删除景区图片
	function deleteViewImg(){
		//选中的行
			var checkedRows = viewImgDatagrid.datagrid('getChecked');
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
					var id = checkedRows[0].id;
					//链接服务器删除
					zkAjax("/viewsAction!deleteViewImg.action?deleteViewImgId="+id,function(data){
						
						var success = data.success;
						var msg = data.msg;
						//提示结果
						$.messager.show({
								title:'提示',
								msg:msg
						});
						
						if(success){
							//重新加载
							viewImgDatagrid.datagrid('reload');
							//取消选择的行
							viewImgDatagrid.datagrid('unselectAll');
							viewImgDatagrid.datagrid('uncheckAll');
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
	
	//添加景区图片
	function addViewImg(){
			addViewImgDialog = $('<div/>').dialog({
			title:'增加景区图片',
			width:500,
			height:100,
			modal:true,
			href:'${pageContext.request.contextPath}/admins/viewticket/viewticket_views_addviewImgs.jsp',
			onClose:function(){
				//删除以前的节点
				$(this).dialog('destroy');
				addViewImgDialog = undefined;
			},
			onOpen:function(){
			},
			onLoad:function(){
			}
		});
	}
	
	//设置图片为主要
	function setMain(){
		//选中的行
			var checkedRows = viewImgDatagrid.datagrid('getChecked');
				//判断是否选择行 
		if(checkedRows.length<1){
			$.messager.show({
				title:'提示',
				msg:'请勾选一张需要设置为主要的图片！'
			});
		}else{
			//询问是否确认删除
			$.messager.confirm('提示','确认设置这'+checkedRows.length+'行？',function(r){
				if(r){
					var id = checkedRows[0].id;
					//链接服务器删除
					zkAjax("/viewImgAction!setMain.action?id="+id,function(data){
						
						var success = data.success;
						var msg = data.msg;
						//提示结果
						$.messager.show({
								title:'提示',
								msg:msg
						});
						
						if(success){
							//重新加载
							viewImgDatagrid.datagrid('reload');
							//取消选择的行
							viewImgDatagrid.datagrid('unselectAll');
							viewImgDatagrid.datagrid('uncheckAll');
						}else{
							
						}
						
					});
				}else{
					//提示取消删除
					$.messager.show({
						title:'提示',
						msg:'取消设置！'
					});
				}
			});
		}
	}
</script>