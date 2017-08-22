<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="easyui-layout" data-options="fit:true,border:false">

	
	<div class="" data-options="region:'center'">
		<table id="viewCarousel" data-options="fit:true,border:false">

		</table>	
	</div>
</div>
<script type="text/javascript">
	var viewCarouselDatagrid =$('#viewCarousel');
	//添加轮播图片的form
	var addCarouselForm = undefined;
	var addCarouselDatagrid = undefined;
	$(function($) {
		viewCarouselDatagrid = $('#viewCarousel').datagrid({
			
			url :'${pageContext.request.contextPath}/viewCarouselAction!getDatagird.action',
			pagination:true,
			fit:true,
			idField:'id',
			sortName:'id',
			sortOrder:'desc',
			multiSort:false,
			/* remoteSort:true, */
			selectOnCheck:true,
			checkOnSelect:true,
			singleSelect:true,
			columns : [ [  {
				field : 'id',
				title : 'id',
				hidden:true
			}, {
				field : 'imgName',
				sortable:true,
				title : '图片',
				width:250,
				height:250,
				formatter: function(value,row,index){
					var carImg = "<span  style='width:250px;' title=''><img style='width:250px;' src='${pageContext.request.contextPath}/viewCarouselAction!getCarouselByImgName.action?imgName="+value+"&t="+new Date().getTime()+"'/></span>";
					return carImg;
				}
			} , {
				field : 'introduction',
				title : '备注',
				sortable:true,
				hidden:true
			}, {
				field : 'createTime',
				title : '创建时间'
			}] ],toolbar: [ {
				text:'添加',
				iconCls: 'icon-add',
				handler:addCarousel
				
			},'-',{
				text:'删除',
				iconCls: 'icon-remove',
				handler : deleteCarousel
				
			}],
			onLoadSuccess:function(data){
				showMsg(data);
				console.info(data);
				//判断管理员是否在线
				try{
					isOnline(data);
				}catch(e){
					return;
				}
			}
			/* onLoadSuccess:function(data){
				showMsg(data);
				//判断管理员是否在线
				var online = data.online;
				if(!online){
					loginDialog.dialog('open');
					return;
				}
				
			} */


		});
		
		
	});
	
	
	/**
	*添加
	*/
	function addCarousel(){
		
		//添加节点
		addCarouselDatagrid = $('<div/>').dialog({
			title:'增加',
			width:400,
			height:120,
			modal:true,
			href:'${pageContext.request.contextPath}/admins/viewticket/viewticket_carousel_addimg.jsp',
			onClose:function(){
				//删除以前的节点
				$(this).dialog('destroy');
				addCarouselDatagrid = undefined;
			},
			onOpen:function(){
			},
			onLoad:function(){
				//初始化dialog及其内部标签
				addCarouselForm = $('#addCarouselForm');
				/* addDialog = $('#admins_qxgl_editdialog_addDialog'); */
			}
		});
	}
	
	/**
	*删除
	*/
	function deleteCarousel(){
		//选择的需要删除的行
		var checkedRows = viewCarouselDatagrid.datagrid('getChecked');
		
		//判断是否选择行 
		if(checkedRows.length<1){
			$.messager.show({
				title:'提示',
				msg:'请勾选需要删除的记录！'
			});
		}else{
			//询问是否确认删除
			$.messager.confirm('提示','确认删除这'+checkedRows.length+'行？',function(r){
				if(r){
					var id = checkedRows[0].id;
					
					//链接服务器删除
					zkAjax("/viewCarouselAction!deleteCarousel.action?id="+id,function(data){
						var success = data.success;
						//提示结果
						$.messager.show({
							title:'提示',
							msg:data.msg
						});
					
						if(success){
							//重新加载
							viewCarouselDatagrid.datagrid('load');
							//取消选择的行
							viewCarouselDatagrid.datagrid('unselectAll');
							viewCarouselDatagrid.datagrid('uncheckAll');
						}else{
							
						}
						
					});
				}else{
					//提示取消删除
					$.messager.show({
						title:'提示',
						msg:'取消删除！'
					});
				}
			});
		}
	}
</script>


