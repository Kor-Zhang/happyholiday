<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form id="addViewImg" method="post" action="" enctype="multipart/form-data">
	<table>
		<tr>
			<th>选择新图片：</th>
			<td><input name="uploadFile" class="easyui-filebox"/></td>
		</tr>
		
	</table>
	<a class="easyui-linkbutton"
		style="margin-right:20px;float:right;"
		href="javascript:void(0);"
		data-options="iconCls:'icon-add',
		onClick:function(){ 
				addViewImgForm = $('#addViewImg').form('submit',{
				url:'${pageContext.request.contextPath}/viewImgUploadAction!addViewImg.action?id='+currentViewId,
				success:function(data){
					data = $.parseJSON(data);
					console.info(data);
					var msg = data.msg;
					var success = data.success;
					<!-- 提示信息 -->
					$.messager.show({
								title:'提示',
								msg:msg
					});
					
					if(success){
						viewImgDatagrid.datagrid('load');
						addViewImgDialog.dialog('close');
					}
				}
			 });
		}">提交</a>
</form>