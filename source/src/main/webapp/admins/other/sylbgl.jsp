<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div class="" data-options="region:'north',title:'筛选',border:false,collapsed:true" style="height:100px;">
		<form id="admins_sylbgl_searchForm" style="display: inline-block;" method="post">
			<tr>
				<th>
					 提交时间：
				</th>
				<td>
					<input name="minCreateTime" style=";" class="easyui-datetimebox" data-options="editable:false"/>-
					
				</td>
				<td>
					<input name="maxCreateTime" style=";" class="easyui-datetimebox" data-options="editable:false"/>
					
				</td>
			</tr>
			<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onClick="sylbglSearchFun();">查询</a>
			<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true" onClick="sylbglClearFun();">清空</a>
		</form>
	</div>	
	<div class="" data-options="region:'center'">
		<table id="admins_sylbgl_datagrid" data-options="fit:true,border:false">

		</table>	
	</div>
</div>


<script type="text/javascript" src="<c:url value='/jslib/zkutil.js'/>"></script>
<script type="text/javascript">
	//添加轮播图片的dialog
	var sylbglAddImgDialog = undefined;
	//添加轮播图片的form
	var sylbglAddImgForm = undefined;
	var sylbglDatagrid = undefined;
	$(function($) {
		sylbglDatagrid = $('#admins_sylbgl_datagrid').datagrid({
			
			url :'${pageContext.request.contextPath}/indexCarouselsAction!getCarouselsDatagrid.action',
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
					var carImg = "<span  style='width:250px;' title=''><img style='width:250px;' src='${pageContext.request.contextPath}/indexCarouselsAction!getCarouselByImgName.action?imgName="+value+"&t="+new Date().getTime()+"'/></span>";
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
				handler: function(){
					sylbglAdd();
				}
			},'-',{
				text:'删除',
				iconCls: 'icon-remove',
				handler: function(){
					sylbglRemove();
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
	
	/**
	*查询
	**/
	function sylbglSearchFun(){
		//获取查询的form参数
		var params = serializeObject($('#admins_sylbgl_searchForm'));
		sylbglDatagrid.datagrid('load', params);
	}
	/**
	*清空
	**/
	function sylbglClearFun(){
		//清空input
		$('#admins_sylbgl_searchForm input').val("");
		//select选择第一个option
		firstOption("admins_sylbgl_searchForm");
		//重新加载
		sylbglDatagrid.datagrid('load', {});
		
	}
	/**
	*添加
	*/
	function sylbglAdd(){
		
		//添加节点
		sylbglAddImgDialog = $('<div/>').dialog({
			title:'增加',
			width:400,
			height:120,
			modal:true,
			href:'${pageContext.request.contextPath}/admins/other/sylbgl_addimg.jsp',
			onClose:function(){
				//删除以前的节点
				$(this).dialog('destroy');
				sylbglAddImgDialog = undefined;
			},
			onOpen:function(){
			},
			onLoad:function(){
				//初始化dialog及其内部标签
				sylbglAddImgForm = $('#admins_sylbgl_addcarimgdialog');
				/* addDialog = $('#admins_qxgl_editdialog_addDialog'); */
			}
		});
	}
	
	/**
	*删除
	*/
	function sylbglRemove(){
		//选择的需要删除的行
		var checkedRows = sylbglDatagrid.datagrid('getChecked');
		
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
					var ids = [];
					for(var i = 0;i<checkedRows.length;i++){
						ids.push(checkedRows[i].id);
					}
					//链接服务器删除
					zkAjax("/indexCarouselsAction!deleteIndexCarouselImgs.action?deleteIds="+ids.join(','),function(data){
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
							sylbglDatagrid.datagrid('load');
							//取消选择的行
							sylbglDatagrid.datagrid('unselectAll');
							sylbglDatagrid.datagrid('uncheckAll');
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


