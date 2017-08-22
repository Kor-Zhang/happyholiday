<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   	<div class="easyui-layout" data-options="fit:true,border:false">
		<div class="" data-options="region:'center'">
			<table id="viewticket_intros" data-options="fit:true,border:false">

			</table>
		</div>
	</div>
  </body>

<script type="text/javascript">
		//景区介绍的dialog
		var  viewIntroDataDialog = undefined;
		var  addViewIntroDialog = undefined;
		var  addViewIntroForm = undefined;
		var  editViewIntroDialog = undefined;
		var editViewIntroForm = undefined;
		/* //查看景区
		var  checkViewDialog = undefined;
		var currentCheckViewId = undefined; */
		/* var checkViewImgDialog = undefined; */
	
		$(function(){
				//views表格
	 viewIntroDataDialog = 	$('#viewticket_intros')
				.datagrid(
						{	
							url:'${pageContext.request.contextPath}/viewIntorsAction!getViewIntrosDatagrid.action',
							title : '景区特色介绍列表',
							singleSelect : true,
							pagination : true,
							rownumbers : true,
							//表头设计
							frozenColumns : [ [
									{
										field : 'id',
										hidden : true
									},
									{
										field : 'viewId',
										title : '查看景区',
										formatter : function(value, row, index) {
										   	var btn = "<a href=javascript:checkView('"+value+"');>查看景区</a>";
											return btn;
										}

									},
									
									{
										field : 'viewName',
										title : '景区名',
										sortable : true
									

									},{
										field : 'textDescription',
										title : '特色简介 1',
										sortable : true,
										width:70,
									}, {
										field : 'textDescriptionTwo',
										title : '特色简介 2',
										sortable : true,
										width:70,
									}, {
										field : 'textDescriptionThree',
										title : '特色简介 3',
										sortable : true,
										width:70,
									}, {
										field : 'introduction',
										title : '景区详情 1',
										sortable : true,
										width:100,
									}, {
										field : 'introductionTwo',
										title : '景区详情 2',
										sortable : true,
										width:100,
									}, {
										field : 'introductionThree',
										title : '景区详情 3',
										sortable : true,
										width:100,
									}, {
										field : 'createTime',
										title : '创建时间',
										sortable : true
									} ] ],
							/* columns : [ [ {
								field : 'grade',
								title : '等级',
								sortable : true
							}, ] ] */

							// 工具栏设计
							toolbar : [ {
								text : '添加',
								iconCls : 'icon-add',
								handler : addIntro
							}, {
								text : '删除',
								iconCls : 'icon-remove',
								handler : deleteIntro
							}, {
								text : '编辑',
								iconCls : 'icon-edit',
								handler : editIntro
							},{
			text : "景区名<input type='text' placeholder='检索景区名 ' id='viewName' name='viewName' style='width:100px;'/>"
		}, {
			text : '查询',
			iconCls : 'icon-search',
			handler:function(){
				selectViewIntro();
			}
			
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
						
						});
		})
		
		function addIntro(){
			addViewIntroDialog =  $('<div/>').dialog({
			title:'增加',
			width:650,
			height:500, 
			modal:true,
			href:'${pageContext.request.contextPath}/admins/viewticket/viewticket_intros_addIntro.jsp',
			onClose:function(){
				//删除以前的节点
				$(this).dialog('destroy');
				addViewIntroDialog = undefined;
			},
			onOpen:function(){
			},
			onLoad:function(){
				//初始化dialog及其内部标签
				addViewIntroForm = $('#addViewIntroForm');
			}
		});
			
			
		}
		function deleteIntro(){
				var checkedRows = viewIntroDataDialog.datagrid('getChecked');
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
					zkAjax("/viewIntorsAction!deleteViewIntro.action?id="+id,function(data){
						
						var success = data.success;
						var msg = data.msg;
						//提示结果
						$.messager.show({
								title:'提示',
								msg:msg
						});
						
						if(success){
							//重新加载
							viewIntroDataDialog.datagrid('reload');
							//取消选择的行
							viewIntroDataDialog.datagrid('unselectAll');
							viewIntroDataDialog.datagrid('uncheckAll');
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
		function editIntro(){
				var checkedRow = viewIntroDataDialog.datagrid('getChecked');
			if(checkedRow.length<1){
				$.messager.show({
					title:'提示',
					msg:'请选择要编辑的记录！'
				});
			}else{
				
				editViewIntroDialog =  $('<div/>').dialog({
				title:'编辑',
				width:650,
				height:500, 
				modal:true,
				href:'${pageContext.request.contextPath}/admins/viewticket/viewticket_intros_editIntro.jsp',
				onClose:function(){
					//删除以前的节点
					$(this).dialog('destroy');
					editViewIntroDialog = undefined;
				},
				onOpen:function(){
				},
				onLoad:function(){
					//初始化dialog及其内部标签
					editViewIntroForm = $('#editViewIntroForm');
					editViewIntroForm.form('load',checkedRow[0]);
				
				}
			});
				
			}
		}
		
		/* function checkView(id){
			currentCheckViewId = id;
		//添加节点
			checkViewDialog = $('<div/>').dialog({
				title:'景区信息',
				width:700,
				height:200,
				modal:true,
				href:'${pageContext.request.contextPath}/admins/viewticket/viewticket_intros_checkView.jsp',
				onClose:function(){
					//删除以前的节点
					$(this).dialog('destroy');
					checkViewDialog = undefined;
				},
				onOpen:function(){
				},
				onLoad:function(){
				}
			});
		} */
		
		function selectViewIntro(){
			var params = {
				"searchViewName":$("#viewName").val(),
			}
			viewIntroDataDialog.datagrid('load', params);
		}
</script>
</html>
