<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table id="admins_qcgl_carimgdialog_datagrid">
	
</table>

<script type="text/javascript">
	var addCarImgDialog = undefined;
	var addCarImgForm = undefined;
	carImgDatagrid = $('#admins_qcgl_carimgdialog_datagrid').datagrid({
		url :'${pageContext.request.contextPath}/carsAction!getCarsImgDatagridByCarId.action?id='+currtCarId,
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
			formatter: function(value,row,index){
				var carImg = "<span style='width:200px;'><img style='width:200px;' src='${pageContext.request.contextPath}/carsAction!getCarsImgByCarImgName.action?imgName="+value+"&t="+new Date().getTime()+"'/></span>";
				return carImg;
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
			handler: function(){
				qcglCarImgAdd();
			}
		},'-',{
			text:'删除',
			iconCls: 'icon-remove',
			handler: function(){
				qcglCarImgRemove();
			}
		},'-',{
			text:'设置为主要',
			iconCls: 'icon-ok',
			handler: function(){
				qcglCarImgSetMain();
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
				//判断是否在线
				isOnline(data);
			}catch(e){
				return;
			}
			
		}


	});
	
	/**
	*删除carimg
	**/
	function qcglCarImgRemove(){
		//选择的需要删除的行
		var checkedRows = carImgDatagrid.datagrid('getChecked');
		
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
					zkAjax("/carsAction!deleteCarImgs.action?deleteCarImgIds="+ids.join(','),function(data){
						
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
							carImgDatagrid.datagrid('reload');
							//取消选择的行
							carImgDatagrid.datagrid('unselectAll');
							carImgDatagrid.datagrid('uncheckAll');
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
	*添加carimg
	**/
	function qcglCarImgAdd(){
		//添加节点
		addCarImgDialog = $('<div/>').dialog({
			title:'增加汽车图片',
			width:500,
			height:100,
			modal:true,
			href:'${pageContext.request.contextPath}/admins/cars/qcgl_addcarimgdialog.jsp',
			onClose:function(){
				//删除以前的节点
				$(this).dialog('destroy');
				addCarImgDialog = undefined;
			},
			onOpen:function(){
			},
			onLoad:function(){
				//初始化dialog及其内部标签
				/* addForm = $('#admins_qxgl_editdialog_addForm'); */
				/* addDialog = $('#admins_qxgl_editdialog_addDialog'); */
			}
		});
	}
	/**
	*设置图片为主要
	*/
	function qcglCarImgSetMain(){
		//选择的需要设置的行
		var checkedRows = carImgDatagrid.datagrid('getChecked');
		
		//判断是否选择行 
		if(checkedRows.length!=1){
			$.messager.show({
				title:'提示',
				msg:'请勾选一张需要设置为主要的图片！'
			});
		}else{
			//询问是否确认设置
			$.messager.confirm('提示','确认设置这'+checkedRows.length+'行？',function(r){
				if(r){
					var id = checkedRows[0].id;
					//链接服务器设置
					zkAjax("/carImgsAction!setMainImg.action?id="+id,function(data){
						
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
							carImgDatagrid.datagrid('reload');
							//取消选择的行
							carImgDatagrid.datagrid('unselectAll');
							carImgDatagrid.datagrid('uncheckAll');
						}else{
							
						}
						
					});
				}else{
					//提示取消删除
					$.messager.show({
						title:'提示',
						msg:'取消！'
					});
				}
			});
		}
	}
</script>	