<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div class="" data-options="region:'north',title:'筛选',border:false,collapsed:true" style="height:240px;">
		<form id="admins_qcgl_searchForm" style="display: inline-block;" method="post">
			<table width="100%">
				<tr>
					<th>
						品牌：
					</th>
					<td>
						<input type="text" name="searchCarBd" placeholder="检索品牌(可模糊查询)"/>	
					</td>
				
					<th>
						车型：
					</th>
					<td>
						<input type="text" name="searchType" placeholder="检索车型(可模糊查询)"/>	
					</td>
					<th>
						车系：
					</th>
					<td>
						<input type="text" name="searchCarLine" placeholder="检索车系(可模糊查询)"/>	
					</td>
					<th>
						地点：
					</th>
					<td>
						<input type="text" name="searchAddress" placeholder="检索地点(可模糊查询)"/>
						
					</td>
				</tr>
				<tr>
					<th>
						天窗：
					</th>
					<td>
						<input type="text" name="searchSkyWindow" placeholder="检索天窗(可模糊查询)"/>
						
					</td>
				
					<th>
						汽油容量：
					</th>
					<td>
						<input type="text" name="searchFuelTankage" placeholder="检索汽油容量可模糊查询)"/>
						
					</td>
					<th>
						音响：
					</th>
					<td>
						<input type="text" name="searchSoundBox" placeholder="检索音响(可模糊查询)"/>
						
					</td>
					<th>
						倒车雷达：
					</th>
					<td>
						<input type="text" name="searchReverseSensor" placeholder="检索雷达(可模糊查询)"/>
						
					</td>
					
				</tr>
				<tr>
					<th>
						dvd：
					</th>
					<td>
						<input type="text" name="searchDvd" placeholder="检索dvd(可模糊查询)"/>
						
					</td>
					<th>
						gps：
					</th>
					<td>
						<input type="text" name="searchGps" placeholder="检索gps(可模糊查询)"/>
						
					</td>
					
					
				</tr>
				<tr>
					<th>
						价格：
					</th>
					<td>
						<input type="text" name="minPrice" placeholder="请输入最小值"/>
						
					</td>
					<th>
					</th>
					<td>
						<input type="text" name="maxPrice" placeholder="请输入最大值"/>
					</td>
				</tr>
				<tr>
					<th>
						导游价格：
					</th>
					<td>
						<input type="text" name="minGuidePrice" placeholder="请输入最小值"/>
						
					</td>
					<th>
					</th>
					<td>
						<input type="text" name="maxGuidePrice" placeholder="请输入最大值"/>
					</td>
				</tr>
				<tr>
					<th>
						数量：
					</th>
					<td>
						<input type="text" name="minNumber" placeholder="请输入最小值"/>
						
					</td>
					<th>
					</th>
					<td>
						<input type="text" name="maxNumber" placeholder="请输入最大值"/>
					</td>
				</tr>
				<tr>
					
					<th>
						 创建时间：
					</th>
					<td>
						<input name="minYear" style=";" class="easyui-datetimebox" data-options="editable:false"/>
						
					</td>
					<th>
					</th>
					<td>
						<input name="maxYear" style=";" class="easyui-datetimebox" data-options="editable:false"/>
						
					</td>
					
					
				</tr>
				<tr>
					
					<td>
						
					</td>
					<td>
						<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onClick="qcglSearchFun();">查询</a>
						<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true" onClick="qcglClearFun();">清空</a>
					</td>
				</tr>
			</table>
		</form>
	</div>	
	<div class="" data-options="region:'center'">
		<table id="admins_qcgl_datagrid" data-options="fit:true,border:false">

		</table>	
	</div>
</div>



<script type="text/javascript" src="<c:url value='/jslib/zkutil.js'/>"></script>
<script type="text/javascript">
	//汽车图片的datagrid
	var carImgDatagrid = undefined;
	//汽车图片的dialog
	var carImgDialog = undefined;
	//当前查看图片的carid
	var currtCarId = undefined;
	//汽车的datagrid
	var qcglDatagrid = undefined;
	var qcglAddDialog = undefined;
	var qcglAddForm = undefined;
	//编辑汽车dialog
	var qcglEditDialog = undefined;
	//编辑汽车form
	var qcglEditForm = undefined;
	var editDialog = undefined;
	var editForm = undefined;
	var editPwdForm = undefined;
	var editPwdDialog = undefined;
	
	$(function($) {
		qcglDatagrid = $('#admins_qcgl_datagrid').datagrid({
			
			url :'${pageContext.request.contextPath}/carsAction!getCarsDatagrid.action',
			pagination:true,
			fit:true,
			idField:'createTime',
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
				hidden:true
			},{
				field : 'showImg',
				title : '图片',
				formatter: function(value,row,index){
					var carId = row.id;
					/* var carImg = "<span style='width:30px;' title='点击更新图片'><img style='width:30px;' src='${pageContext.request.contextPath}/carsAction!getCarsImg.action?id="+value+"'/></span>"; */
					var checkImgBtn = "<a href=javascript:showCarImgDialog('"+carId+"')>点击查看图片</a>";
					return checkImgBtn;
				}
			},{
				field : 'carBd',
				title : '品牌',
				sortable:true
			}, {
				field : 'type',
				title : '车型',
				sortable:true
			} , {
				field : 'carLine',
				title : '车系',
				sortable:true
			} , {
				field : 'address',
				title : '地点',
				sortable:true
			}
         	]],
			columns : [ [  {
				field : 'year',
				title : '年份',
				sortable:true
			}, {
				field : 'seatType',
				title : '座椅类型',
				sortable:true
			}, {
				field : 'seatNumber',
				title : '座椅数量',
				sortable:true
			}, {
				field : 'fuelType',
				title : '燃油类型',
				sortable:true
			}, {
				field : 'transmissionType',
				title : '变速箱类型',
				sortable:true
			}, {
				field : 'displacement',
				title : '排量',
				sortable:true
			}, {
				field : 'drivingMode',
				title : '驱动模式',
				sortable:true
			}, {
				field : 'engineIntakeForm',
				title : '发动机进气形式',
				sortable:true
			}, {
				field : 'skyWindow',
				title : '天窗',
				sortable:true
			}, {
				field : 'fuelTankage',
				title : '汽油容量',
				sortable:true
			}, {
				field : 'SoundBox',
				title : '音响',
				sortable:true
			}, {
				field : 'reverseSensor',
				title : '倒车雷达',
				sortable:true
			}, {
				field : 'airSacNumber',
				title : '气囊数量',
				sortable:true
			}, {
				field : 'dvd',
				title : 'dvd',
				sortable:true
			}, {
				field : 'gps',
				title : 'gps定位',
				sortable:true
			}, {
				field : 'price',
				title : '价格',
				sortable:true
			}, {
				field : 'guidePrice',
				title : '导游价格',
				sortable:true
			}, {
				field : 'number',
				title : '数量',
				sortable:true,
				formatter: function(value,row,index){
					if(value>0){
						return "<font style='color:green;'>"+value+"</font>";
					}
					return "<font style='color:red;'>"+value+"</font>";
				}
			}, {
				field : 'createTime',
				title : '创建时间',
				sortable:true
			}] ],toolbar: [{
				text:'添加',
				iconCls: 'icon-add',
				handler: function(){
					qcglAdd();
				}
			},'-',{
				text:'删除',
				iconCls: 'icon-remove',
				handler: function(){
					qcglRemove();
				}
			},'-',{
				text:'编辑',
				iconCls: 'icon-edit',
				handler: function(){
					qcglEdit();
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
				var online = data.online;
				if(!online){
					loginDialog.dialog('open');
					return;
				}
				
			}


		});
		/* //点击回车查询
		$('#admins_qcgl_searchId').keyup(function(e){
			if(e.keyCode==13){
				searchFun();
			}
		}); */
		
	});
	/**
	*查询
	**/
	function qcglSearchFun(){
		//获取查询的form参数
		var params = serializeObject($('#admins_qcgl_searchForm'));
		qcglDatagrid.datagrid('load', params);
	}
	/**
	*清空
	**/
	function qcglClearFun(){
		//清空input
		$('#admins_qcgl_searchForm input').val("");
		//select选择第一个option
		firstOption("admins_qcgl_searchForm");
		//重新加载
		qcglDatagrid.datagrid('load', {});
		
	}
	
	/**
	*点击增加按钮，弹出dialog
	**/
	function qcglAdd(){
		//添加节点
		qcglAddDialog = $('<div/>').dialog({
			title:'增加',
			width:700,
			height:600,
			maximizable:true,
			modal:true,
			href:'${pageContext.request.contextPath}/admins/cars/qcgl_adddialog.jsp',
			onClose:function(){
				//删除以前的节点
				$(this).dialog('destroy');
				qcglAddDialog = undefined;
			},
			onOpen:function(){
			},
			onLoad:function(){
				//初始化dialog及其内部标签
				qcglAddForm = $('#admins_qcgl_adddialog_addForm');
			}
		});
	}
	/**
	*点击删除数据
	**/
	function qcglRemove(){
		//选择的需要删除的行
		var checkedRows = qcglDatagrid.datagrid('getChecked');
		
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
					zkAjax("/adminsAction!deleteAdmins.action?deleteIds="+ids.join(','),function(data){
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
							qcglDatagrid.datagrid('load');
							//取消选择的行
							qcglDatagrid.datagrid('unselectAll');
							qcglDatagrid.datagrid('uncheckAll');
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
	function qcglEdit(){
		
		var checkedRow = qcglDatagrid.datagrid('getChecked');
		//是否选择一行
		if(checkedRow.length==1){
			
			//添加节点
			editDialog = $('<div/>').dialog({
				title:'编辑',
				width:500,
				height:300,
				modal:true,
				href:'${pageContext.request.contextPath}/admins/cars/qxgl_editdialog.jsp',
				onClose:function(){
					//删除以前的节点
					$(this).dialog('destroy');
					editDialog = undefined;
				},
				onOpen:function(){
					
					
				},
				onLoad:function(){
					//初始化dialog及其内部标签
					editForm = $('#admins_qcgl_editdialog_editForm');/* 
					editDialog = $('#admins_qcgl_editdialog_editDialog'); */
					//加载文本信息
					editForm.form('load',checkedRow[0]);
					//设置密码显示
					editForm.find("#adminPwd").textbox('setText','**********');
					//加载select
					loadSelect(editForm,checkedRow[0]);
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
	/*修改密码
	function qcglEditPwd(){
		var checkedRow = qcglDatagrid.datagrid('getChecked');
		//是否选择一行
		if(checkedRow.length==1){
			//添加节点
			editPwdDialog = $('<div/>').dialog({
				title:'编辑密码',
				width:500,
				height:100,
				modal:true,
				href:'${pageContext.request.contextPath}/admins/qxgl_editpwddialog.jsp',
				onClose:function(){
					//删除以前的节点
					$(this).dialog('destroy');
					editPwdDialog = undefined;
				},
				onOpen:function(){
					
					
				},
				onLoad:function(){
					//初始化dialog及其内部标签
					editPwdForm = $('#admins_qcgl_adddialog_editPwdForm');
					//加载文本信息
					editPwdForm.form('load',checkedRow[0]);
					//设置密码显示
					editPwdForm.find("#adminPwd").val('');
				}
			});
		}else{
			//提示是否选择一行
			$.messager.show({
				title:'提示',
				msg:'只能同时操作一行'
			});
		}
	} */
	/**
	*显示汽车图片的dialog
	**/
	function showCarImgDialog(carId){
		//记录下carid
		currtCarId = carId;
		//添加节点
		carImgDialog = $('<div/>').dialog({
			title:'查看并管理汽车图片',
			width:600,
			height:400,
			resizable:true,
			minimizable:true,
			maximizable:true,
			modal:true,
			href:'${pageContext.request.contextPath}/admins/cars/qcgl_carimgdialog.jsp',
			onClose:function(){
				//删除以前的节点
				$(this).dialog('destroy');
				carImgDialog = undefined;
			},
			onOpen:function(){
				
			},
			onLoad:function(){
				/* carImgDatagrid = $('#admins_qcgl_carimgdialog_datagrid'); */
			}
		});
	}
	/**
	*删除car
	**/
	function qcglRemove(){
		//选择的需要删除的行
		var checkedRows = qcglDatagrid.datagrid('getChecked');
		
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
					zkAjax("/carsAction!deleteCars.action?deleteIds="+ids.join(','),function(data){
						
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
							qcglDatagrid.datagrid('load');
							//取消选择的行
							qcglDatagrid.datagrid('unselectAll');
							qcglDatagrid.datagrid('uncheckAll');
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
	*/
	function qcglEdit(){
		var checkedRow = qcglDatagrid.datagrid('getChecked');
		//是否选择一行
		if(checkedRow.length==1){
			//添加节点
			qcglEditDialog = $('<div/>').dialog({
				title:'编辑汽车基本信息',
				width:900,
				height:600,
				maximizable:true,
				modal:true,
				href:'${pageContext.request.contextPath}/admins/cars/qcgl_editdialog.jsp',
				onClose:function(){
					//删除以前的节点
					$(this).dialog('destroy');
					qcglEditDialog = undefined;
				},
				onOpen:function(){
					
					
				},
				onLoad:function(){
					//初始化dialog及其内部标签
					qcglEditForm = $('#admins_qcgl_editdialog_editForm');
					
					//加载文本信息
					qcglEditForm.form('load',checkedRow[0]);
					
					
					
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


