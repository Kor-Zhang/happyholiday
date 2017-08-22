<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- enctype 默认是 application/x-www-form-urlencoded -->  
<form id="admins_ddgl_editdorderstatusialog_editstatusForm" method="post" >  
	<!-- 存放属性 -->
	<input name="getCarAddress" type="hidden"/>
	<input name="returnCarAddress" type="hidden"/>
	<input name="getCarTime" type="hidden"/>
	<input name="returnCarTime" type="hidden"/>
	
	<table style="margin: 20px 10px;">
		<tr>
			
			订单号：<input type="text" name="id" readonly="true" style="display: block;width:80%;border:none;"/>
		</tr>
		
		<tr>
			
			<td align="right">
				状态：
				
				
			</td>
			<td align="left">
				
				<select name="status" onChange="showOptions();">
					<option value="0">待提车</option>
					<option value="1">已提车</option>
					<option value="2">已还车</option>
					<option value="-2">拒绝接单</option>
				</select>
				
			</td>
		</tr>
		<!-- ---------------------取车----------------------------------->
		<tr class="realgetcar">
			<td align="right">
				取车时间：
			</td>
			<td align="left">
				<input id="id_realGetCarTime" name="realGetCarTime" class="easyui-datetimebox" data-options=""/>
			</td>
			<td align="right">
			</td>
			<td align="left">
				<a href="javascript:setTime('id_realGetCarTime','getCarTime');" class="easyui-linkbutton" data-options="">使用原定时间</a>
			</td>
			
		</tr>
		<tr class="realgetcar">
			
			<td align="right">
				取车地点：
			</td>
			<td align="left">
				<input name="realGetCarAddress" class="easyui-validatebox" data-options=""/>
			</td>
			<td align="right">
			</td>
			<td align="left">
				<a href="javascript:setAddress('realGetCarAddress','getCarAddress');" class="easyui-linkbutton" data-options="">使用原定地点</a>
			</td>
		</tr>
		
		<!-- ---------------------还车--------------------------------- -->
		
		<tr class="realreturncar">
			<td align="right">
				还车时间：
			</td>
			<td align="left">
				<input id="id_realReturnCarTime" name="realReturnCarTime" class="easyui-datetimebox" data-options=""/>
			</td>
			<td align="right">
			</td>
			<td align="left">
				<a href="javascript:setTime('id_realReturnCarTime','returnCarTime');"  class="easyui-linkbutton" data-options="">使用原定时间</a>
			</td>
			
		</tr>
		
		
		
		
		<tr class="realreturncar">
			<td align="right">
				还车地点：
			</td>
			<td align="left">
				<input value="" name="realReturnCarAddress" class="easyui-validatebox" data-options=""/>
			</td>
			<td align="right">
			</td>
			<td align="left">
				<a href="javascript:setAddress('realReturnCarAddress','returnCarAddress');"  class="easyui-linkbutton" data-options="">使用原定地点</a>
			</td>
		</tr>
	</table>
	     
	 <a class="easyui-linkbutton"
		style="float:right;margin-right: 20px;"
		href="javascript:void(0);"
		data-options="iconCls:'icon-add',
		onClick:function(){
			ddglStatusEditForm = $('#admins_ddgl_editdorderstatusialog_editstatusForm').form('submit',{
				url:'${pageContext.request.contextPath}/ordersAction!updateOrdersStatus.action',
				success:function(data){
					data = $.parseJSON(data);
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
						ddglDatagrid.datagrid('reload');
						ddglStatusEditDialog.dialog('close');
					}
				}
			 });
		}">提交</a>
  
</form>  

<script type="text/javascript">
	$(function($){
		
		
	});
	/**
	*更具select的值，设置是否显示其他选项
	*/
	function showOptions(){
		//1代表已取车，2代表已还车
		//隐藏多于选项
		$('.realgetcar').hide();
		$('.realreturncar').hide();
		//获取用户的选项
		var val = $('select[name=status]').val();
		if(val==1){
			$('.realgetcar').show();
		}else if(val==2){
			$('.realreturncar').show();
		}
	}
	/**
	*将原本的车辆归还和租借的时间信息填写到name为‘real’的input中
	*/
	function setTime(realId,old){
		var val = $("input[name='"+old+"']").val();
		$("#"+realId).datetimebox('setValue',val);
		
	}
	/**
	*将原本的车辆归还和租借的地址信息填写到name为‘real’的input中
	*/
	function setAddress(real,old){
		var val = $("input[name='"+old+"']").val();
		$('input[name='+real+']').val(val);
		
	}
</script>