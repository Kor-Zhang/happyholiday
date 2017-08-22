<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
	
<table id="admins_ddgl_checkrentcaruserdialog_datagrid" data-options="fit:true,border:false">

</table>	



<script type="text/javascript" src="<c:url value='/jslib/zkutil.js'/>"></script>
<script type="text/javascript">
	$(function($) {
		ddglRentCarUserDialog = $('#admins_ddgl_checkrentcaruserdialog_datagrid').datagrid({
			
			url :'${pageContext.request.contextPath}/rentCarUsersAction!getSingleRentCarUserDatagridById.action?id='+currtRentCarUserId,
			fit:true,
			idField:'id',
			sortName:'id',
			sortOrder:'desc',
			multiSort:false,
			/* remoteSort:true, */
			selectOnCheck:true,
			checkOnSelect:true,
			singleSelect:true,
			fitColumns:true,
			frozenColumns:[[
			{
				field : 'id',
				title : '账户',
				hidden:true
			} , {
				field : 'phone',
				title : '电话',
				sortable:true
			}
         	]],
			columns : [ [  {
				field : 'realName',
				title : '真实姓名',
				sortable:true
			},{
				field : 'email',
				title : '邮件',
				sortable:true
			} , {
				field : 'cardClazz',
				title : '证件类型',
				sortable:true
			}, {
				field : 'cardNumber',
				title : '证件号',
				sortable:true
			} ] ],
			onLoadSuccess:function(data){
				showMsg(data);
				console.info(data);
				try{
					//判断是否在线
					isOnline(data);
				}catch(e){
					return;
				}
				
			}


		});
		
		
	});
	
</script>


