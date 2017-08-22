<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form id="admins_yhgl_editdialog_editForm" method="post">
	<input type="hidden" name="id"/>
	<table>
		<input name="role" type="hidden"/>
		<tr>
			<th>手机：</th>
			<td>
				<input class="easyui-validatebox" data-options="required:true" name="phone" readonly="true"/>
			</td>
			<th>昵称：</th>
			<td>
				<input class="easyui-validatebox" data-options="" name="userName"/>
			</td>
		</tr>
		<tr>
			<th>真实姓名：</th>
			<td>
				<input class="easyui-validatebox" data-options="" name="realName"/>
			</td>
			<th>状态：</th>
			<td>
				<select name="status">
					<option value="1">激活</option>
					<option value="0">冻结</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>证件类型：</th>
			<td>
				<input class="easyui-validatebox" data-options="" name="cardClazz" readonly="true"/>
			</td>
			<th>证件号：</th>
			<td>
				<input class="easyui-validatebox" data-options="" name="cardNumber"/>
			</td>
		</tr>
		
	</table>
	<a class="easyui-linkbutton"
		style="float:right;margin-right: 20px;"
		href="javascript:void(0);"
		data-options="iconCls:'icon-add',
		onClick:function(){
			yhglEditForm.form('submit',{
				url:'${pageContext.request.contextPath}/usersAction!editUsers.action',
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
						yhglDatagrid.datagrid('reload');
						yhglEditDialog.dialog('close');
					}
					
				}
			 });
		}">提交</a>
</form>
<script type="text/javascript">
</script>