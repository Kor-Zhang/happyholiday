<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form id="addViewTicketForm" action="" method="post" >
	<table cellpadding="5"> 
		<tbody>
			<tr>
				<td width="100px"align="right">景区区域:</td>
				<td width="400px"><select id="country" name="country"style="width: 100px;"></select>
								  <select id="province" name="province"style="width: 100px;"></select>
								  <select id="city" name="city"	style="width: 100px;"></select>
				</td>
			</tr>
			<tr>
				<td width="100px"align="right">景区名:</td>
				<td width="400px" id="viewNameMsg">
				<font style="color:red;display:none" id="tips" >该区域暂时没有景区。请先添加景区</font>
				<select id="viewName" name="viewName" style="width:200px"></select></td>
			</tr>
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
				addViewTicketForm	= $('#addViewTicketForm').form('submit',{
						url:'${pageContext.request.contextPath}/viewTicketsAction!addViewTicket.action',
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
								addViewTicketDialog.dialog('close');
								$('#viewticket_tickets').datagrid('reload');
							}
						}
					})
				}">提交</a>
</form>
<script>
	var viewNameSelect = $("#viewName");
	var countrySelect = $("#country");
	var provinceSelect = $("#province");
	var citySelect = $("#city");
	var typeSelect = $("#type");
	var styleSelect = $("#style");
	var payTypeSelect = $("#payType")
	
	$(function(){
		showCountry(5);
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
			}
		});	
	}
	
	function showName(city){
		clearAddressSelect(viewNameSelect);
		//远程加载下拉框数据
		zkAjax("/viewsAction!getViewsAllName.action?city="+encodeURI(encodeURI(city)),function(data){
			if(data.total==0){
				$("#tips").css('display','block');
			}else{
				$("#tips").css('display','none');
			}
			for (var i = 0; i < data.rows.length; i++) {
				viewNameSelect.show();
				viewNameSelect.append("<option  value="+data.rows[i]+">"+data.rows[i]+"</option>");
			}
		});	
	}
	function showCountry(id){
		clearAddressSelect(countrySelect);
		clearAddressSelect(provinceSelect);
		clearAddressSelect(citySelect);
		//远程加载下拉框数据
		zkAjax("/frontSystemddlAction!getSystemddlByParentId.action?id="+id,function(data){
			//添加数据到addressSelect
			var rows = data;
			for (var i = 0; i < rows.length; i++) {
				countrySelect.show();
				countrySelect.append("<option  onClick=showProvince('"+rows[i].id+"') value="+rows[i].text+">"+rows[i].text+"</option>");
			}
			showProvince(rows[0].id);
		});	
	}
	function showProvince(id){
		clearAddressSelect(provinceSelect);
		clearAddressSelect(citySelect);
		//远程加载下拉框数据
		zkAjax("/frontSystemddlAction!getSystemddlByParentId.action?id="+id,function(data){
			//添加数据到addressSelect
			var rows = data;
			for (var i = 0; i < rows.length; i++) {
				provinceSelect.show();
				provinceSelect.append("<option  onClick=showCity('"+rows[i].id+"') value="+rows[i].text+">"+rows[i].text+"</option>");
			}
			showCity(rows[0].id);
		});	
	}
	function showCity(id){
		clearAddressSelect(citySelect);
		//远程加载下拉框数据
		zkAjax("/frontSystemddlAction!getSystemddlByParentId.action?id="+id,function(data){
			//添加数据到addressSelect
			var rows = data;
			for (var i = 0; i < rows.length; i++) {
				citySelect.show();
				citySelect.append("<option onClick=showName('"+rows[i].text+"')  value="+rows[i].text+">"+rows[i].text+"</option>");
			}
			showName(rows[0].text);
		});	
	}
	//清除select内容，并且影藏
	function clearAddressSelect(select){
		select.html("");
		select.hide();
	}
	
	
	
	
	
</script>