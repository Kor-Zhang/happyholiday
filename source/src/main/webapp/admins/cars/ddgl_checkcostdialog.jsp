<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="easyui-layout" data-options="fit:true,border:false">
	<form id="admins_ddgl_checkcostdialog_form">
		<div class="" data-options="region:'north',title:'基本租车价格'" style="height:80px;">
			
				<table>
					<tr>
						<td>
							单日汽车价格：<input name="carPrice" readonly/>
						</td>
						<td>
							租借天数：<input name="rentDayNumber" readonly/>
						</td>
						
					</tr>
					
				</table>
			
		</div>	
		<div class="" data-options="region:'center',title:'保险等其他费用'">
			<table id="admins_ddgl_checkcostdialog_datagrid" data-options="border:false">
	
			</table>
		</div>
		<div class="" data-options="region:'east',title:'总价'" style="width:180px;">
			<table>
				<tr>
					<td>
						<font style="color:red;">总价（包含保险等其他费用）：</font><input name="totalPrice" readonly/>
					</td>
				</tr>
				
			</table>
			
		</div>	
	
	</form>
</div>
	



<script type="text/javascript" src="<c:url value='/jslib/zkutil.js'/>"></script>
<script type="text/javascript">
	$(function($) {
		ddglCheckCostDatagrid = $('#admins_ddgl_checkcostdialog_datagrid').datagrid({
			
			url :'${pageContext.request.contextPath}/ordersAction!getCostDatagridByOrderId.action?id='+currtCheckCostOrderId,
			fit:true,
			pagination:true,
			idField:'id',
			sortName:'id',
			sortOrder:'desc',
			multiSort:false,
			/* remoteSort:true, */
			selectOnCheck:true,
			checkOnSelect:true,
			singleSelect:true,
			fitColumns:true,
			frozenColumns:[[
			{
				field : 'id',
				title : '账户',
				hidden:true
			} 
         	]],
			columns : [ [  {
				field : 'costName',
				title : '费用名',
				sortable:true
			},{
				field : 'costIntroduction',
				title : '费用说明',
				sortable:true
			} , {
				field : 'number',
				title : '数量',
				sortable:true
			}, {
				field : 'price',
				title : '单价',
				sortable:true
			} , {
				field : '55',
				title : '合计',
				sortable:true,
				formatter: function(value,row,index){
					var total = row.price*row.number;
					return total;
				}
			}  ] ],
			onLoadSuccess:function(data){
				showMsg(data);
				try{
					//判断是否在线
					isOnline(data);
				}catch(e){
					ddglCheckCostDialog.dialog('close');
					return;
				}
				if(data.success){
					$('#admins_ddgl_checkcostdialog_form').form('load',data.obj);
				}
				
			}


		});
		
		
	});
	
</script>


