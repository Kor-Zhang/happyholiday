<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form id="editViewIntroForm" action="" method="post" >
	<table cellpadding="5"> 
		<tbody>
			<input name="id" type="text" style="display:none"/>
			
			<tr>
				<td width="100px">特色简介1:</td>
				<td width="400px"><input type="text" name="textDescription" id="textDescription" style="width:300px" placeholder="该项必填"/></td>
			</tr>
			<tr>
				<td width="100px">特色简介2:</td>
				<td width="400px"><input type="text" name="textDescriptionTwo" id="textDescriptionTwo" style="width:300px"/></td>
			</tr>
			<tr>
				<td width="100px">特色简介3:</td>
				<td width="400px"><input type="text" name="textDescriptionThree" id="textDescriptionThree" style="width:300px"/></td>
			</tr>
			<tr >
				<td width="100px" ><span>景区详情 1:</span></td>
				<td width="400px"><textarea cols="40" rows="7" placeholder="该项必填" style="resize:none;" name="introduction"></textarea></td>
			</tr>
			<tr>
				<td width="100px">景区详情 2:</td>
				<td width="400px"><textarea cols="40" rows="7"  style="resize:none;" name="introductionTwo"></textarea></td>
			</tr>
			<tr>
				<td width="100px">景区详情 3:</td>
				<td width="400px"><textarea cols="40" rows="7"  style="resize:none;" name="introductionThree"></textarea></td>
			</tr>
			<tr>
				<td width="100px"></td>
				<td width="400px" id="msgIntro"></td>
			</tr>
		</tbody>
	</table>
		<a id="updateIntro" class="easyui-linkbutton" style="float:right; margin-bottom:30px;margin-right:50px"
	data-options="iconCls:'icon-save',onClick:function(){
				editViewIntroForm= $('#editViewIntroForm').form('submit',{
						url:'${pageContext.request.contextPath}/viewIntorsAction!updateViewIntro.action',
						success:function(data){
							data = $.parseJSON(data);
							console.info(data);
							var msg = data.msg;
							var success = data.success;
							<!-- 提示信息 -->
							$('#addMsg').html(msg);
							$.messager.show({
								title:'提示',
								msg:msg
							});
							if(success){
								editViewIntroDialog.dialog('close');
								viewIntroDataDialog.datagrid('reload');
							}
						}
					})
				}">提交</a>
</form>
