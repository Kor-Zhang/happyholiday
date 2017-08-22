<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- enctype 默认是 application/x-www-form-urlencoded -->  
<form id="admins_viewOrdereditstatusForm" method="post" >  
	
	<table style="margin: 20px 10px;">
		<tr>
			
			订单号：<input type="text" name="id" readonly="true" style="display: block;width:80%;border:none;"/>
		</tr>
		
		<tr>
			
			<td align="right">
				状态：
				
				
			</td>
			<td align="left">
				
				<select name="status" >
					<option value="2">已付款</option>
					<option value="3">已完成</option>
					<option value="4">未付款</option>
					<option value="0">拒绝接单</option>
				</select>
				
			</td>
		</tr>
		
	</table>
	     
	 <a class="easyui-linkbutton"
		style="float:right;margin-right: 20px;"
		href="javascript:void(0);"
		data-options="iconCls:'icon-add',
		onClick:function(){
			viewOrderStatusEditForm = $('#admins_viewOrdereditstatusForm').form('submit',{
				url:'${pageContext.request.contextPath}/viewOrdersAction!updateOrdersStatus.action',
				success:function(data){
					data = $.parseJSON(data);
					var msg = data.msg;
					var success = data.success;
					var obj = data.obj;
					<!-- 提示信息 -->
					showMsg(data);
					try{
						//判断是否在线
						isOnline(data);
					}catch(e){
						return;
					}
					if(success){
						viewOrderDataDialog.datagrid('reload');
						viewOrderStatusEditDialog.dialog('close');
					}
				}
			 });
		}">提交</a>
  
</form>  

<script type="text/javascript">
	
</script>