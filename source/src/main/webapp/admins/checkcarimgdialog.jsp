<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table id="admins_ddgl_carimgdialog_datagrid">
	
</table>

<script type="text/javascript">
	
	$('#admins_ddgl_carimgdialog_datagrid').datagrid({
		url :'${pageContext.request.contextPath}/carsAction!getCarsImgDatagridByCarId.action?id='+currtCheckCarImgsId,
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
		columns:[[
        {
			field : 'id',
			hidden:true
		},{
			field : 'imgName',
			title : '图片',
			width:300,
			formatter: function(value,row,index){
				var carImg = "<span style='width:300px;'><img style='width:300px;' src='${pageContext.request.contextPath}/carsAction!getCarsImgByCarImgName.action?imgName="+value+"&t="+new Date().getTime()+"'/></span>";
				return carImg;
			}
		},{
			field : 'main',
			title : '主要图片',
			width:300,
			formatter: function(value,row,index){
				
				if(value){
					return "<font style='color:green;'>是</font>";
				}
				return "<font style='color:red;'>否</font>";
			}
		}] ],
		onLoadSuccess:function(data){
			showMsg(data);
			//判断管理员是否在线
			try{
				//判断是否在线
				isOnline(data);
			}catch(e){
				return;
			}
			
		}


	});
	
</script>	