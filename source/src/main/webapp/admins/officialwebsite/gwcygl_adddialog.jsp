<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form id="admins_gwcygl_adddialog_addForm"  method="post" action="" enctype="multipart/form-data">
	<table>
		<tr>
			<th>图片：</th>
			
			<td>
				<input class="easyui-filebox" data-options="required:true" name="uploadFile"/>
			</td>
			
		</tr>
	
		<tr>
			<th>名字：</th>
			<td>
				<input class="easyui-validatebox" data-options="required:true" name="name"/>
			</td>
		</tr>
		<tr>
			<th>职位：</th>
			<td>
				<input class="easyui-validatebox" data-options="required:true" name="position"/>
			</td>
		</tr>
		<tr>
			<th>介绍/说明：</th>
			<td>
				
				<textarea name="introduction"></textarea>
			</td>
			
		</tr>
		<tr>
			<th>展示/不展示：</th>
			<td>
				<select name="status">
					<option value="1">展示</option>
					<option value="0">不展示</option>
				</select>
			</td>
		</tr>
	</table>
	<a class="easyui-linkbutton"
		style="margin-left:190px;margin-top: 20px;"
		href="javascript:void(0);"
		data-options="iconCls:'icon-add',
		onClick:function(){
			$('#admins_gwcygl_adddialog_addForm').form('submit',{
				url:'${pageContext.request.contextPath}'+owBackNamespace+'/owMembersUploadBackAction!uploadMembers.action',
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
						gwcyglAddDialog.dialog('close');
						gwcyglDatagrid.datagrid('reload');
					}
				}
			 });
		}">提交</a>
</form>