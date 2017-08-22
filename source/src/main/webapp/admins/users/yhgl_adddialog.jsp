<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form id="admins_yhgl_adddialog_addForm"  method="post" action="" enctype="multipart/form-data">
	<table>
		<tr>
			<th>头像：</th>
			
			<td>
				<input class="easyui-filebox" data-options="required:true" name="uploadFile"/>
			</td>
			
		</tr>
		<tr>
			<th>密码：</th>
			
			<td>
				<input class="easyui-validatebox" data-options="required:true,validType:'length[10,15]'" name="password"/>
			</td>
			<th>邮件：</th>
			
			<td>
				<input class="easyui-validatebox" data-options="validType:'email'" name="email"/>
			</td>
			
		</tr>
		
		<tr>
			<th>手机：</th>
			<td>
				<input class="easyui-validatebox" data-options="required:true,validType:'length[11,11]'" name="phone"/>
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
					<option value="true">激活</option>
					<option value="false">冻结</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>证件类型：</th>
			<td>
				<input class="easyui-validatebox" data-options="" name="cardClazz"/>
			</td>
			<th>证件号：</th>
			<td>
				<input class="easyui-validatebox" data-options="" name="cardNumber"/>
			</td>
		</tr>
	</table>
	<a class="easyui-linkbutton"
		style="margin-left:190px;margin-top: 20px;"
		href="javascript:void(0);"
		data-options="iconCls:'icon-add',
		onClick:function(){
			yhglAddForm.form('submit',{
				url:'${pageContext.request.contextPath}/usersUploadAction!usersUpload.action',
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
						yhglAddDialog.dialog('close');
						yhglDatagrid.datagrid('reload');
					}
				}
			 });
		}">提交</a>
</form>