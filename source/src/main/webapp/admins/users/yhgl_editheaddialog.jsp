<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form id="admins_yhgl_editHeadForm" method="post" enctype="multipart/form-data" style="display: inline-block;">
	<input name="uploadFile" class="easyui-filebox" data-options="buttonText: '选择文件',buttonAlign: 'right' "/>
	<a class="easyui-linkbutton"
		style="float:right;"
		href="javascript:void(0);"
		data-options="iconCls:'icon-add',
		onClick:function(){
			yhglEditHeadForm.form('submit',{
				url:'${pageContext.request.contextPath}/usersUploadHeadAction!uploadHead.action?id='+currtEditHeadUserId+'&t='+new Date().getTime(),
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
						yhglDatagrid.datagrid('reload');
						yhglEditHeadDialog.dialog('close');
					}
					
				}
			 });
		}">提交</a>
</form>
