<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form id="editViewTicketForm" action="" method="post" >
	<table cellpadding="5"> 
		<tbody>
			<input name="id" type="text" style="display:none"/>
			<input id="1" name="type" type="text" style="display:none"/>
			<input id="2" name="style" type="text" style="display:none"/>
			<input id="3" name="payType" type="text" style="display:none"/>
			<tr>
				<td width="100px"align="right">门票名:</td>
				<td width="400px"><input type="text" name="name" id="name" style="width:300px" /></td>
			</tr>
			<tr>
				<td width="100px"align="right">票种:</td>
				<td width="400px"> <select id="type" name="type"	style="width: 100px;"></select></td>
			</tr>
			<tr>
				<td width="100px"align="right">票型:</td>
				<td width="400px"> <select id="style" name="style"	style="width: 100px;"></select></td>
			</tr>
			<tr >
				<td width="100px" align="right"><span>提前预定时间:</span></td>
				<td width="400px"><input type="text" name="orderTime" id="orderTime" style="width:100px" /></td>
			</tr>
			<tr>
				<td width="100px"align="right"> 市场价:</td>
				<td width="400px"><input type="text" name="marketPrice" id="marketPrice" style="width:100px" /></td>
			</tr>
			<tr>
				<td width="100px"align="right">幸福价 :</td>
				<td width="400px"><input type="text" name="happyPrice" id="happyPrice" style="width:100px" /></td>
			</tr>
			<tr>
				<td width="100px"align="right">支付方式:</td>
				<td width="400px"><select id="payType" name="payType" style="width: 100px;"></select></td>
			</tr>
		</tbody>
	</table>
		<a id="saveIntro" class="easyui-linkbutton" style="float:right; margin-bottom:30px;margin-right:50px"
	data-options="iconCls:'icon-add',onClick:function(){
				editViewTicketForm	= $('#editViewTicketForm').form('submit',{
						url:'${pageContext.request.contextPath}/viewTicketsAction!updateViewTicket.action',
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
							 	editViewTicketDialog.dialog('close');
								$('#viewticket_tickets').datagrid('reload');
							}
						}
					})
				}">提交</a>
</form>
<script>

	var typeSelect = $("#type");
	var styleSelect = $("#style");
	var payTypeSelect = $("#payType")
	
	$(function(){
		
		showType();
		showStyle();
		showpayType();
	})
	//显示票种
	function  showType(){
		//远程加载下拉框数据
		zkAjax("/frontSystemddlAction!getSystemddlByParentId.action?id=7",function(data){
		
			var rows = data;
			for (var i = 0; i < rows.length; i++) {
				typeSelect.show();
				typeSelect.append("<option value="+rows[i].text+">"+rows[i].text+"</option>");
				if($("#1").val()==rows[i].text){
					typeSelect.val(rows[i].text)
				}
			}
		});	
	}
	
	//显示票型
	function showStyle(){
		//远程加载下拉框数据
		zkAjax("/frontSystemddlAction!getSystemddlByParentId.action?id=6",function(data){
			
			var rows = data;
			for (var i = 0; i < rows.length; i++) {
				styleSelect.show();
				styleSelect.append("<option value="+rows[i].text+">"+rows[i].text+"</option>");
				if($("#2").val()==rows[i].text){
					styleSelect.val(rows[i].text)
				}
			}
		});	
		
	}
	//显示支付方式
	function showpayType(){
		//远程加载下拉框数据
		zkAjax("/frontSystemddlAction!getSystemddlByParentId.action?id=10",function(data){
			
			var rows = data;
			for (var i = 0; i < rows.length; i++) {
				payTypeSelect.show();
				payTypeSelect.append("<option value="+rows[i].text+">"+rows[i].text+"</option>");
				if($("#3").val()==rows[i].text){
					payTypeSelect.val(rows[i].text)
				}
			}
		});	
	}
	
	
	
	
	
	
</script>