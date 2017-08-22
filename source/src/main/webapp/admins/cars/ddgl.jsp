<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div class="" data-options="region:'north',title:'筛选',border:false,collapsed:true" style="height:240px;">
		<form id="admins_ddgl_searchForm" style="display: inline-block;" method="post">
			<table width="100%">
				<tr>
					<th>
						取车地点：
					</th>
					<td>
						<input type="text" name="searchGetCarAddress" placeholder="检索取车地点(可模糊查询)"/>	
					</td>
				
					<th>
						 取车时间：
					</th>
					<td>
						<input name="minGetCarTime" style=";" class="easyui-datetimebox" data-options="editable:false"/>-
						
					</td>
					<td>
						<input name="maxGetCarTime" style=";" class="easyui-datetimebox" data-options="editable:false"/>
						
					</td>
				</tr>
				<!-- 权限 -->
				<tr>
					<th>
						还车地点：
					</th>
					<td>
						<input type="text" name="searchReturnCarAddresss" placeholder="检索取车地点(可模糊查询)"/>	
					</td>
				
					<th>
						 还车时间：
					</th>
					<td>
						<input name="minReturnCarTime" style=";" class="easyui-datetimebox" data-options="editable:false"/>-
						
					</td>
					<td>
						<input name="maxReturnCarTime" style=";" class="easyui-datetimebox" data-options="editable:false"/>
						
					</td>
					
				</tr>
				
				
				<tr>
					<th>
						真是取车地点：
					</th>
					<td>
						<input type="text" name="searchRealGetCarAddress" placeholder="检索管理员备注(可模糊查询)"/>	
					</td>
					<th>
						 真实取车时间：
					</th>
					<td>
						<input name="minRealGetCarTime" style=";" class="easyui-datetimebox" data-options="editable:false"/>-
						
					</td>
					<td>
						<input name="maxRealGetCarTime" style=";" class="easyui-datetimebox" data-options="editable:false"/>
						
					</td>
					
				</tr>
				<tr>
					<th>
						真是还车地点：
					</th>
					<td>
						<input type="text" name="searchReturnGetCarAddress" placeholder="检索管理员备注(可模糊查询)"/>	
					</td>
					<th>
						 真实还车时间：
					</th>
					<td>
						<input name="minRealReturnCarTime" style=";" class="easyui-datetimebox" data-options="editable:false"/>-
						
					</td>
					<td>
						<input name="maxRealReturnCarTime" style=";" class="easyui-datetimebox" data-options="editable:false"/>
						
					</td>
					
				</tr>
				<tr>
					<th>
						管理员备注：
					</th>
					<td>
						<input type="text" name="searchAdminNote" placeholder="检索管理员备注(可模糊查询)"/>	
					</td>
					<th>
						 提交时间：
					</th>
					<td>
						<input name="minSubmitTime" style=";" class="easyui-datetimebox" data-options="editable:false"/>-
						
					</td>
					<td>
						<input name="maxSubmitTime" style=";" class="easyui-datetimebox" data-options="editable:false"/>
						
					</td>
					
				</tr>
				<tr>
					<th>
						用户备注：
					</th>
					<td>
						<input type="text" name="searchUserNote" placeholder="检索用户备注(可模糊查询)"/>	
					</td>
					
					<th>
						总价：
					</th>
					<td>
						<input type="text" name="minTotalPrice" placeholder="检索最小总价"/>
					</td>
					<td>
						<input type="text" name="maxTotalPrice" placeholder="检索最大总价"/>	
					</td>
				</tr>
				<tr>
					<th>
						状态：
					</th>
					<td>
						<select name="searchStatus">
							<option value="">全部</option>
							<option value="0">未提车</option>
							<option value="1">租赁中</option>
							<option value="2">已还车</option>
							<option value="-1">用户取消</option>
							<option value="-2">管理员拒绝</option>
						</select>	
					</td>
					<td>
						<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onClick="ddglSearchFun();">查询</a>
						<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true" onClick="ddglClearFun();">清空</a>
					</td> 
					<!-- <th>
						汽车每日价格：
					</th>
					<td>
						<input type="text" name="minCarPrice" placeholder="检索最小汽车每日价格"/>
					</td>
					<td>
						<input type="text" name="maxCarPrice" placeholder="检索最大汽车每日价格"/>	
					</td> -->
					
				</tr>
				<tr>
					<!-- <th>
						租车期限：
					</th>
					<td>
						<input type="text" name="minRentDayNumber" placeholder="检索最小租车期限"/>
					</td>
					<td>
						<input type="text" name="maxRentDayNumber" placeholder="检索最大租车期限"/>	
					</td>
					-->
				</tr>
				<tr>
					
					
				</tr>
				
			</table>
		</form>
	</div>	
	<div class="" data-options="region:'center'">
		<table id="admins_ddgl_datagrid" data-options="fit:true,border:false">

		</table>	
	</div>
</div>


<script type="text/javascript" src="<c:url value='/jslib/zkutil.js'/>"></script>
<script type="text/javascript">
	//订单datagrid
	var ddglDatagrid = undefined;
	//订单添加dialog
	var ddglAddDialog = undefined;
	//订单编辑dialog
	var ddglEditDialog = undefined;
	//订单添加form
	var ddglAddForm = undefined;
	//订单编辑form
	var ddglEditForm = undefined;
	//编辑订单状态form
	var ddglStatusEditForm = undefined;
	//编辑订单状态dialog
	var ddglStatusEditDialog = undefined;
	//记录下当前下单者的id
	var currtUserId = undefined;
	//下单用户查询dialog
	var ddglUserDialog = undefined;
	//记录下当前订单车辆id
	var currtCarId = undefined;
	//当前订单车辆的查询dialog
	var ddglCarDialog = undefined;
	//编辑note的dialog
	var ddglEidtNoteDialog = undefined;
	//编辑note的form
	var ddglStatusEditForm = undefined;
	//储存租车人id
	var currtRentCarUserId = undefined;
	//编辑租车人的dialog
	var ddglRentCarUserDialog = undefined;
	//编辑租车人的form
	var ddglRentCarUserForm = undefined;
	
	//当前需要查询费用的订单号
	var currtCheckCostOrderId = undefined;
	//当前需要查询费用的订单号的dialog
	var ddglCheckCostDialog = undefined;
	//当前需要查询费用的订单号的Datagrid
	var ddglCheckCostDatagrid = undefined;
	$(function($) {
		ddglDatagrid = $('#admins_ddgl_datagrid').datagrid({
			
			url :'${pageContext.request.contextPath}/ordersAction!getOrdersDatagrid.action',
			pagination:true,
			fit:true,
			idField:'status',
			sortName:'status',
			sortOrder:'asc',
			multiSort:false,
			/* remoteSort:true, */
			selectOnCheck:true,
			checkOnSelect:true,
			singleSelect:true,
			frozenColumns:[[
			{
				field : 'checkbox',
				checkbox:true
			}, {
				field : 'status',
				title : '订单状态',
				sortable:true,
				formatter: function(value,row,index){
					
					//如果订单未取消
					var status = "<font style='color:red'>错误状态</font>";
					if(value==0){
						status = "<font style='color:black'>等待提车</font>";
					}
					if(value==1){
						status = "<font style='color:green'>租赁中</font>";
					}
					if(value==2){
						status = "<font style='color:gray'>已还车</font>";
					}
					//用户取消
					if(value==-1){
						status = "<font style='color:red'>用户取消</font>";
					}
					if(value==-2){
						status = "<font style='color:red'>管理员拒绝</font>";
					}
					var btn = undefined;
					if(value!=-1){
						btn = "<a href=javascript:editOrdersStatus('"+index+"');>"+status+"</a>";	
					}else{
						btn = status;
					}
					
					return btn;
				}
			} ,{
				field : 'id',
				title : '订单号',
				sortable:true,
				width:270
			} ,{
				field : 'carId',
				title : '查看汽车',
				sortable:true,
				formatter: function(value,row,index){
					
					var btn = "<a href=javascript:checkCar('"+value+"');>查看汽车</a>";
					return btn;
				}
			} /* ,{
				field : 'rentCarUersId',
				title : '查看租车人',
				sortable:true,
				formatter: function(value,row,index){
					
					var btn = "<a href=javascript:checkRentCarUser('"+value+"');>查看租车人</a>";
					return btn;
				}
			} *//* ,{
				field : 'ckzcfy',
				title : '查看租车费用',
				sortable:true,
				formatter: function(value,row,index){
					var orderId = row.id;
					var btn = "<a href=javascript:ddglCheckCost('"+orderId+"');>查看租车费用</a>";
					return btn;
				}
			} */,{
				field : 'userId',
				title : '查看下单账户',
				sortable:true,
				formatter: function(value,row,index){
					
					var btn = "<a href=javascript:checkUser('"+value+"');>查看下单账户</a>";
					return btn;
				}
			}, {
				field : 'totalPrice',
				title : '总价',
				sortable:true,
				formatter: function(value,row,index){
					var orderId = row.id;
					var btn = "<a href=javascript:ddglCheckCost('"+orderId+"');>"+value+"</a>";
					return btn;
				}
			}
         	]],
			columns : [ [  {
				field : 'submitTime',
				title : '提交时间',
				sortable:true
			}, {
				field : 'getCarAddress',
				sortable:true,
				title : '取车地点'
			} , {
				field : 'returnCarAddress',
				title : '还车地点',
				sortable:true
			}, {
				field : 'getCarTime',
				title : '取车时间',
				sortable:true
			} , {
				field : 'returnCarTime',
				title : '还车时间',
				sortable:true
			}, {
				field : 'realGetCarAddress',
				title : '真实取车地点',
				sortable:true
			}, {
				field : 'realGetCarTime',
				title : '真实取车时间',
				sortable:true
			},  {
				field : 'realReturnCarAddress',
				title : '真实还车地点',
				sortable:true
			} ,{
				field : 'realReturnCarTime',
				title : '真实还车时间',
				sortable:true
			},{
				field : 'adminNote',
				title : '管理员备注',
				sortable:true
			} ,{
				field : 'userNote',
				title : '用户备注',
				sortable:true
			}, {
				field : 'rentDayNumber',
				title : '租期',
				sortable:true
			}/* , {
				field : 'carPrice',
				title : '每日价格',
				sortable:true
			}  */] ],toolbar: [ {
				text:'编辑备注',
				iconCls: 'icon-add',
				handler: function(){
					editNote();
				}
			},'-', /*{
				text:'删除',
				iconCls: 'icon-remove',
				handler: function(){
					remove();
				}
			},'-',{
				text:'编辑',
				iconCls: 'icon-edit',
				handler: function(){
					edit();
				}
			},'-',{
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
				$.messager.show({
					title:'提示',
					msg:data.msg
					
				});
				console.info(data);
				//判断管理员是否在线
				var online = data.online;
				if(!online){
					loginDialog.dialog('open');
					return;
				}
				
			}


		});
		/* //点击回车查询
		$('#admins_ddgl_searchId').keyup(function(e){
			if(e.keyCode==13){
				searchFun();
			}
		}); */
		
	});
	/**
	*查询
	**/
	function ddglSearchFun(){
		//获取查询的form参数
		var params = serializeObject($('#admins_ddgl_searchForm'));
		ddglDatagrid.datagrid('load', params);
	}
	/**
	*清空
	**/
	function ddglClearFun(){
		//清空input
		$('#admins_ddgl_searchForm input').val("");
		//select选择第一个option
		firstOption("admins_ddgl_searchForm");
		//重新加载
		ddglDatagrid.datagrid('load', {});
		
	}
	
	/**
	*点击设置订单状态
	*index：当前行的索引
	**/
	function editOrdersStatus(index){
		//当前操作的行
		var row = ddglDatagrid.datagrid('getRows')[index];
		//添加节点
		ddglStatusEditDialog = $('<div/>').dialog({
			title:'编辑',
			width:500,
			height:250,
			modal:true,
			href:'${pageContext.request.contextPath}/admins/cars/ddgl_editorderstatusdialog.jsp',
			onClose:function(){
				//删除以前的节点
				$(this).dialog('destroy');
				ddglStatusEditDialog = undefined;
			},
			onOpen:function(){
			},
			onLoad:function(){
				//初始化dialog及其内部标签
				ddglStatusEditForm = $('#admins_ddgl_editdorderstatusialog_editstatusForm');
				ddglStatusEditForm.form('load',row);
				//根据status的select值判断是否显示其他选项
				showOptions();
				/* addDialog = $('#admins_ddgl_editdialog_addDialog'); */
			}
		});
	}
	
	/*
	*查看订单的车辆
	
	function checkCar(carId){
		currtCarId = carId;
		//添加节点
		ddglCarDialog = $('<div/>').dialog({
			title:'查看',
			width:700,
			height:250,
			resizable:true,
			maximizable:true,
			modal:true,
			href:'${pageContext.request.contextPath}/admins/ddgl_checkcardialog.jsp',
			onClose:function(){
				//删除以前的节点
				$(this).dialog('destroy');
				ddglCarDialog = undefined;
			},
			onOpen:function(){
			},
			onLoad:function(){
			}
		});
	} */
	/**
	*编辑备注
	*/
	function editNote(){
		var checkedRow = ddglDatagrid.datagrid('getChecked');
		//是否选择一行
		if(checkedRow.length==1){
			//添加节点
			ddglEidtNoteDialog = $('<div/>').dialog({
				title:'编辑备注',
				width:500,
				height:200,
				modal:true,
				href:'${pageContext.request.contextPath}/admins/cars/ddgl_editnotedialog.jsp',
				onClose:function(){
					//删除以前的节点
					$(this).dialog('destroy');
					ddglEidtNoteDialog = undefined;
				},
				onOpen:function(){
				},
				onLoad:function(){
					ddglStatusEditForm = $('#admins_ddgl_editnotedialog_editsnoteForm').form('load',checkedRow[0]);
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
	/* 
	*查看租车者
	function checkRentCarUser(rentCarUserId){
		currtRentCarUserId = rentCarUserId;
		//添加节点
		ddglRentCarUserDialog = $('<div/>').dialog({
			title:'查看',
			width:700,
			height:250,
			resizable:true,
			maximizable:true,
			modal:true,
			href:'${pageContext.request.contextPath}/admins/ddgl_checkrentcaruserdialog.jsp',
			onClose:function(){
				//删除以前的节点
				$(this).dialog('destroy');
				ddglRentCarUserDialog = undefined;
			},
			onOpen:function(){
			},
			onLoad:function(){
			}
		});
	} */
	/*
	*查看租车者
	*/
	function ddglCheckCost(checkCostOrderId){
		currtCheckCostOrderId = checkCostOrderId;
		//添加节点
		ddglCheckCostDialog = $('<div/>').dialog({
			title:'查看',
			width:550,
			height:400,
			resizable:true,
			maximizable:true,
			modal:true,
			href:'${pageContext.request.contextPath}/admins/cars/ddgl_checkcostdialog.jsp',
			onClose:function(){
				//删除以前的节点
				$(this).dialog('destroy');
				ddglCheckCostDialog = undefined;
			},
			onOpen:function(){
			},
			onLoad:function(){
			}
		});
	} 
</script>


