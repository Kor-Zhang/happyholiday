<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 注册dialog -->
<div class="easyui-dialog" id="index_registDialog"
	data-options="title:'注册',modal:true,closable:false,closed:true,
			buttons:[{
				text:'注册',
				handler:function(){
					<!-- 直接调用form的submit -->
					$('#index_registForm').form('submit', {    
					    url:'${pageContext.request.contextPath}/adminsAction!adminRegist.action',    
					    success:function(data){    
					    	<!-- 处理注册的返回信息 -->
					    	data = $.parseJSON(data);
					    	console.info(data);
					    	var msg = data.msg;
					    	var success = data.success;
					    	if(success){
					    		$('#index_registDialog').dialog('close');
					    	}
					    	$.messager.show({
					    		title:'提示',
					    		msg:msg
					    	});
					    	
					    }    
					}); 
				}
			},{
				text:'返回登录',
				handler:function(){
					$('#index_registDialog').dialog('close');
					
				}
			}]">
	<form id="index_registForm" method="post">
		<table>
			<tr>
				<th align="center">用户名</th>
				<td><input name="id" class="easyui-validatebox"
					data-options="required:true" /></td>
			</tr>
			<tr>
				<th align="center">密码</th>
				<td><input name="password" id="pwd" type="password"
					class="easyui-validatebox" data-options="required:true" /></td>
			</tr>
			<tr>
				<th align="center">再次输入密码</th>
				<td><input id="rePwd" type="password" class="easyui-validatebox"
					data-options="required:true,validType:'eqTwoInput[\'#pwd\']'" /></td>
			</tr>
		</table>
	</form>
</div>

