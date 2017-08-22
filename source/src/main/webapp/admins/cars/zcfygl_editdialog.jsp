<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form id="admins_zcfygl_editdialog_editForm"  method="post" action="" enctype="multipart/form-data">
	<input type="hidden" name="id"/>
	<table>
		<tr>
			<th>费用名称：</th>
			
			<td>
				<input class="easyui-validatebox" data-options="required:true" name="name"/>
			</td>
			<th>单份价格：</th>
			
			<td>
				<input name="price" class="easyui-numberbox" data-options="required:true,min:1,precision:0"/>
			</td>
		</tr>
		<tr>
			<th>介绍：</th>
			
			<td>
				<input class="easyui-validatebox" name="introduction" data-options="required:true,validType:'length[0,255]'" name="password"/>
			</td>
			
			
		
	</table>
	<a class="easyui-linkbutton"
		style="margin-left:190px;margin-top: 20px;"
		href="javascript:void(0);"
		data-options="iconCls:'icon-add',
		onClick:function(){
			zcfyglEditForm.form('submit',{
				url:'${pageContext.request.contextPath}/costAction!editCost.action',
				success:function(data){
					data = $.parseJSON(data);
					console.info(data);
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
						zcfyglEditDialog.dialog('close');
						zcfyglDataGrid.datagrid('reload');
					}
				}
			 });
		}">提交</a>
</form>