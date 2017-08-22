<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form id="admins_yhgl_editpwddialog_editPwdForm" method="post">
	<input type="hidden" name="id"/>
	<table>
		<tr>
			<th>账户：</th>
			<td><input readonly="true" name="phone"/></td>
			<th>输入新密码：</th>
			<td>
				<input class="easyui-validatebox" data-options="required:true,validType:'length[6,16]'" type="password" name="password" id="adminPwd"/>
			</td>
		</tr>
		
	</table>
	<a class="easyui-linkbutton"
		style="float:right;margin-right: 20px;"
		href="javascript:void(0);"
		data-options="iconCls:'icon-add',
		onClick:function(){
			yhglEditPwdForm.form('submit',{
				url:'${pageContext.request.contextPath}/usersAction!editUsersPwd.action',
				success:function(data){
					data = $.parseJSON(data);
					var msg = data.msg;
					var success = data.success;
					var obj = data.obj;
					showMsg(data);
					try{
						//判断是否在线
						isOnline(data);
					}catch(e){
						return;
					}
					if(success){
						yhglEditPwdDialog.dialog('close');
						yhglDatagrid.datagrid('reload');
					}
					
				}
			 });
		}">提交</a>
</form>