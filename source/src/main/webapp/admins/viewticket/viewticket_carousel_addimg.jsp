<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form id="addCarouselForm" method="post" action="" enctype="multipart/form-data">
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
				addCarouselForm = $('#addCarouselForm').form('submit',{
				url:'${pageContext.request.contextPath}/viewCarouselUploadAction!addCarousel.action',
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
						viewCarouselDatagrid.datagrid('load');
						addCarouselDatagrid.dialog('close');
					}
				}
			 });
		}">提交</a>
</form>