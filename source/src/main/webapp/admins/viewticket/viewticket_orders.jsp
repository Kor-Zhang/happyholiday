<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="easyui-layout" data-options="fit:true,border:false">
	<div class="" data-options="region:'center'">
		<table id="viewticket_orders" data-options="fit:true,border:false">

		</table>
	</div>
</div>

<script>
	var viewOrderDataDialog = undefined;
	//编辑订单状态form
	var viewOrderStatusEditForm = undefined;
	//编辑订单状态dialog
	var viewOrderStatusEditDialog = undefined;
	$(function() {
		//views表格
		viewOrderDataDialog = $('#viewticket_orders').datagrid({
			url:'${pageContext.request.contextPath}/viewOrdersAction!getViewOrdersDatagrid.action',
			title : '景区门票订单表',
			singleSelect : true,
			pagination : true,
			rownumbers : true,
			fitColumns : true,
			//表头设计
			frozenColumns : [ [ {
				field : 'status',
				title : '订单状态',
					formatter: function(value,row,index){
					
					//如果订单未取消
					var status = "<font style='color:red'>错误状态</font>";
					if(value==4){
						status = "<font style='color:black'>未付款</font>";
					}
					if(value==3){
						status = "<font style='color:green'>已完成</font>";
					}
					if(value==2){
						status = "<font style='color:orange'>已付款</font>";
					}
					//用户取消
					if(value==1){
						status = "<font style='color:red'>用户取消</font>";
					}
					if(value==0){
						status = "<font style='color:red'>管理员拒绝</font>";
					}
					var btn = undefined;
					if(value!=1){
						btn = "<a href=javascript:editViewOrdersStatus('"+index+"');>"+status+"</a>";	
					}else{
						btn = status;
					}
					
					return btn;
				},
				sortable : true
			}, {
				field : 'id',
				title : '订单号',
				sortable : true
			}, {
				field : 'ticketId',
				title : '门票信息',
				formatter : function(value, row, index) {
				   	var btn = "<a href=javascript:checkViewTicket('"+value+"');>查看门票</a>";
					return btn;
				}
			}, {
				field : 'userId',
				title : '下单用户',
				formatter : function(value, row, index) {
				   	var btn = "<a href=javascript:checkUser('"+value+"');>查看下单用户</a>";
					return btn;
				}
			}, {
				field : 'totalPrice',
				title : '总价',
				sortable : true
			}, {
				field : 'number',
				title : '数量',
				sortable : true
			}, {
				field : 'travelTime',
				title : '出行时间',
				sortable : true
			},

			] ],
			columns : [ [ {
				field : 'getTicketName',
				title : '取票人姓名',
				sortable : true
			}, {
				field : 'getTicketPhone',
				title : '取票人电话',
				sortable : true
			}, {
				field : 'createTime',
				title : '创建时间',
				sortable : true
			} ] ],
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

		/* // 工具栏设计
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
		} ], */

		})
	});
	
	/**
	*点击设置订单状态
	*index：当前行的索引
	**/
	function editViewOrdersStatus(index){
		//当前操作的行
		var row = viewOrderDataDialog.datagrid('getRows')[index];
		//添加节点
		viewOrderStatusEditDialog = $('<div/>').dialog({
			title:'编辑',
			width:500,
			height:250,
			modal:true,
			href:'${pageContext.request.contextPath}/admins/viewticket/viewticket_order_editStatus.jsp',
			onClose:function(){
				//删除以前的节点
				$(this).dialog('destroy');
				viewOrderStatusEditDialog = undefined;
			},
			onOpen:function(){
			},
			onLoad:function(){
				//初始化dialog及其内部标签
				viewOrderStatusEditForm = $('#admins_viewOrdereditstatusForm');
				viewOrderStatusEditForm.form('load',row);
				//根据status的select值判断是否显示其他选项
			
				/* addDialog = $('#admins_ddgl_editdialog_addDialog'); */
			}
		});
	}
</script>
