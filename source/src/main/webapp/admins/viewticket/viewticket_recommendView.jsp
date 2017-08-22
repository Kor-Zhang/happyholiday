<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="easyui-layout" data-options="fit:true,border:false">	
	<div class="" data-options="region:'center'">
		<table id="recommendView" data-options="fit:true,border:false">

		</table>	
	</div>
</div>


<script type="text/javascript" src="<c:url value='/jslib/zkutil.js'/>"></script>
<script type="text/javascript">
	//添加轮播图片的dialog
	var recommendViewAddDialog = undefined;
	//添加轮播图片的form
	var recommendViewAddImgForm = undefined;
	var recommendViewDatagrid = undefined;
	$(function($) {
		recommendViewDatagrid = $('#recommendView').datagrid({
			
			url :'${pageContext.request.contextPath}/recommendViewAction!getDatagird.action',
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
					var viewImg = "<span  style='width:250px;' title=''><img style='width:250px;height:126px' src='${pageContext.request.contextPath}/recommendViewAction!getRecommendViewImgName.action?imgName="+value+"&t="+new Date().getTime()+"'/></span>";
					
					return viewImg;
				}
			} ,{
				field : 'viewId',
				title : '查看景区',
				sortable:true,
				formatter: function(value,row,index){
					
					var btn = "<a href=javascript:checkView('"+value+"');>查看景区</a>";
					return btn;
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
				handler: function(){
					RecommendViewAdd();
				}
			},'-',{
				text:'删除',
				iconCls: 'icon-remove',
				handler: function(){
					RecommendViewDel();
				}
			},/*'-',{
				text:'修改',
				iconCls: 'icon-edit',
				handler: function(){
					editPwd();
				}
			},'-',*/{
				text:'帮助',
				iconCls: 'icon-help',
				handler: function(){
					help();
				}
			}],
			onLoadSuccess:function(data){
				showMsg(data);
				//判断管理员是否在线
				var online = data.online;
				if(!online){
					loginDialog.dialog('open');
					return;
				}
				
			}


		});
		
		
	});
	
	function RecommendViewAdd(){
		//添加节点
		recommendViewAddDialog = $('<div/>').dialog({
			title:'增加',
			width:980,
			height:600,
			maximizable:true,
			modal:true,
			href:'${pageContext.request.contextPath}/admins/viewticket/viewticket_recommendView_add.jsp',
			onClose:function(){
				//删除以前的节点
				$(this).dialog('destroy');
				recommendViewAddDialog = undefined;
			},
			onOpen:function(){
			},
			onLoad:function(){
			}
		});
	}
	
	function RecommendViewDel(){
		//选择的需要删除的行
		var checkedRow = recommendViewDatagrid.datagrid('getChecked');
		
		//判断是否选择行 
		if(checkedRow.length<1){
			$.messager.show({
				title:'提示',
				msg:'请勾选需要删除的记录！'
			});
		}else{
			//询问是否确认删除
			$.messager.confirm('提示','确认删除这'+checkedRow.length+'行？',function(r){
				if(r){
					var id = checkedRow[0].id;
					
					//链接服务器删除
					zkAjax("/recommendViewAction!deleteRecommendView.action?deleteIds="+id,function(data){
						var success = data.success;
						//提示结果
						showMsg(data);
						try{
							//判断是否在线
							isOnline(data);
						}catch(e){
							return;
						}
						if(success){
							//重新加载
							recommendViewDatagrid.datagrid('load');
							//取消选择的行
							recommendViewDatagrid.datagrid('unselectAll');
							recommendViewDatagrid.datagrid('uncheckAll');
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


