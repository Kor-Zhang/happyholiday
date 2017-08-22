<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- enctype 默认是 application/x-www-form-urlencoded -->  
<form id="admins_ddgl_editnotedialog_editsnoteForm" method="post" >  
	<!-- 存放属性 -->
	<input name="id" type="hidden"/>
	<table >
		<tr>
			
			<td>
				备注：<textarea name="adminNote" style="resize: none;width:450px;height:90px;font-size: 12px;"></textarea>
			</td>
		</tr>
		
		
	</table>
	     
	 <a class="easyui-linkbutton"
		style="float:right;margin-right: 20px;"
		href="javascript:void(0);"
		data-options="iconCls:'icon-add',
		onClick:function(){
			ddglStatusEditForm = $('#admins_ddgl_editnotedialog_editsnoteForm').form('submit',{
				url:'${pageContext.request.contextPath}/ordersAction!updateOrdersAdminNote.action',
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
						ddglEidtNoteDialog.dialog('close');
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