<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div class="" data-options="region:'north',title:'筛选',border:false,collapsed:true" style="height:130px;">
		<form id="admins_yhgl_searchForm" style="display: inline-block;" method="post">
			<table width="100%">
				<tr>
					<th>
						检索手机：
					</th>
					<td>
						<input type="text" name="searchPhone" placeholder="检索手机(可模糊查询)"/>	
					</td>
				
					<th>
						检索昵称：
					</th>
					<td>
						<input type="text" name="searchUserName" placeholder="检索昵称(可模糊查询)"/>	
					</td>
					<th>
						检索真实姓名：
					</th>
					<td>
						<input type="text" name="searchRealName" placeholder="检索真实姓名(可模糊查询)"/>	
					</td>
				</tr>
				<tr>
					<th>
						检索email：
					</th>
					<td>
						<input type="text" name="searchEmail" placeholder="检索邮箱(可模糊查询)"/>	
					</td>
				
					<th>
						检索状态：
					</th>
					<td>
						<select name="searchStatus">
							<option value="">全部</option>
							<option value="1">激活</option>
							<option value="0">冻结</option>
						</select>		
					</td>
					<th>
						检索证件类型：
					</th>
					<td>
						<select name="searchCardClazz">
							<option value="">全部</option>
							<option value="身份证">身份证</option>
							<option value="台湾同胞证">台湾同胞证</option>
							<option value="null">无证件</option>
						</select>		
					</td>
					
				</tr>
				<tr>
					
					<th>
						检索证件号：
					</th>
					<td>
						<input type="text" name="searchCardNumber" placeholder="检索证件号(可模糊查询)"/>	
					</td>
					<th>
						角色：
					</th>
					<td>
						<select name="eqRole">
							<option value="">全部</option>
							<option value="0">普通用户</option>
							<option value="1">申请导游资格</option>
							<option value="-1">申请导游资格被拒</option>
							<option value="2">导游</option>
						</select>			
					</td>
					<th>
						
					</th>
					<td>
						<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onClick="searchFun();">查询</a>
						<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true" onClick="clearFun();">清空</a>
					</td>
					<th>
						
					</th>
					<td>
							
					</td>
				</tr>
			</table>
		</form>
	</div>	
	<div class="" data-options="region:'center'">
		<table id="admins_yhgl_datagrid" data-options="fit:true,border:false">

		</table>	
	</div>
</div>

<!-- 增加弹出框 
<div id="admins_yhgl_addDialog" class="easyui-dialog" data-options="title:'添加',modal:true,closed:true" style="width:500px;height:360px;">
	
		
</div>
 -->

<script type="text/javascript" src="<c:url value='/jslib/zkutil.js'/>"></script>
<script type="text/javascript">

	var yhglDatagrid = undefined;
	//记录当前修改head的用户id
	var currtEditHeadUserId = undefined;
	//修改head的dialog
	var yhglEditHeadDialog = undefined;
	//修改head的form
	var yhglEditHeadForm = undefined;
	//修改user信息的dialog
	var yhglEditDialog = undefined;
	//修改user信息的form
	var yhglEditForm = undefined;
	//修改密码的dialog
	var yhglEditPwdDialog = undefined;
	//添加user的dialog
	var yhglAddDialog = undefined;
	//修改密码的dialog
	var yhglAddForm = undefined;
	//当前查看的导游证的用户的id
	var yhglCheckGuideImgUserId = undefined;
	//当前查看的导游证的用户的dialog
	var yhglCheckguideimgDialog = undefined;
	$(function($) {
		yhglDatagrid = $('#admins_yhgl_datagrid').datagrid({
			
			url :'${pageContext.request.contextPath}/usersAction!getUsersDatagrid.action',
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
			frozenColumns:[[
         	]],
			columns : [ [ 
 			{
				field : 'checkbox',
				checkbox:true
			},{
				field : 'id',
				title : '账户',
				hidden:true
			}, {
				field : 'head',
				title : '头像',
				sortable:true,
				width:50,
				height:50,
				formatter: function(value,row,index){
					var carImg = "<span  onClick=editHead('"+row.id+"') style='width:50px;' title='点击更新头像'><img style='width:50px;' src='${pageContext.request.contextPath}/usersAction!getUserHead.action?head="+value+"&t="+new Date().getTime()+"'/></span>";
					return carImg;
				}
			} , {
				field : 'phone',
				title : '电话',
				sortable:true
			}, {
				field : 'userName',
				sortable:true,
				width:50,
				title : '昵称'
			} , {
				field : 'realName',
				title : '真实姓名',
				sortable:true
			}, {
				field : 'password',
				title : '密码',
				sortable:true
			} , {
				field : 'status',
				title : '状态',
				sortable:true,
				formatter: function(value,row,index){
					if(value){
						return "<font style='color:green;'>激活</font>";
					}
					return "<font style='color:red;'>冻结</font>";
				}
			}, {
				field : 'role',
				title : '角色',
				sortable:true,
				formatter: function(value,row,index){
					if(value==2){
						return "<font style='color:green;'>导游</font>";
					}
					if(value==1){
						return "<a href=javascript:yhglCheckGuideImg('"+row.id+"');><font style='color:rgb(233,20,65);'>申请导游资格</font></a>";
					}
					if(value<=0){
						if(value==-1){
							return "<font style='color:red;'>普通用户（申请导游资格被拒绝）</font>";
						}
						if(value==0){
							return "<font style='color:black;'>普通用户</font>";
						}
					}
					
				}
			}, {
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
			} ] ],toolbar: [{
				text:'添加',
				iconCls: 'icon-add',
				handler: function(){
					yhglAdd();
				}
			},'-',{
				text:'删除',
				iconCls: 'icon-remove',
				handler: function(){
					yhglRemove();
				}
			},'-',{
				text:'编辑基本信息',
				iconCls: 'icon-edit',
				handler: function(){
					yhglEdit();
				}
			},'-',{
				text:'修改密码',
				iconCls: 'icon-edit',
				handler: function(){
					editPwd();
				}
			},'-',{
				text:'帮助',
				iconCls: 'icon-help',
				handler: function(){
					help();
				}
			}],
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
		/* //点击回车查询
		$('#admins_yhgl_searchId').keyup(function(e){
			if(e.keyCode==13){
				searchFun();
			}
		}); */
		
	});
	
	/**
	* 更新头像
	*/
	function editHead(userId){
		//记录当前修改头像的userid
		currtEditHeadUserId = userId;
		//添加节点
		yhglEditHeadDialog = $('<div/>').dialog({
			title:'修改头像',
			width:280,
			height:100,
			modal:true,
			href:'${pageContext.request.contextPath}/admins/users/yhgl_editheaddialog.jsp',
			onClose:function(){
				//删除以前的节点
				$(this).dialog('destroy');
				yhglEditHeadDialog = undefined;
			},
			onOpen:function(){
			},
			onLoad:function(){
				yhglEditHeadForm = $('#admins_yhgl_editHeadForm');
			}
		});
	}
	/**
	*查询
	**/
	function searchFun(){
		//获取查询的form参数
		var params = serializeObject($('#admins_yhgl_searchForm'));
		yhglDatagrid.datagrid('load', params);
	}
	/**
	*清空
	**/
	function clearFun(){
		$('#admins_yhgl_searchForm input').val("");
		//select选择第一个option
		firstOption("admins_yhgl_searchForm");
		
		yhglDatagrid.datagrid('load', {});
		
	}
	
	
	/**
	*编辑
	**/
	function yhglEdit(){
		
		var checkedRow = yhglDatagrid.datagrid('getChecked');
		//是否选择一行
		if(checkedRow.length==1){
			
			//添加节点
			yhglEditDialog = $('<div/>').dialog({
				title:'编辑',
				width:500,
				height:300,
				modal:true,
				href:'${pageContext.request.contextPath}/admins/users/yhgl_editdialog.jsp',
				onClose:function(){
					//删除以前的节点
					$(this).dialog('destroy');
					yhglEditDialog = undefined;
				},
				onOpen:function(){
					
					
				},
				onLoad:function(){
					//初始化dialog及其内部标签
					yhglEditForm = $('#admins_yhgl_editdialog_editForm');
					yhglEditForm.form('load',checkedRow[0]);
					
				}
			});
			
			
		}else{
			//提示是否选择一行
			$.messager.show({
				title:'提示',
				msg:'只能同时操作一行'
			});
		}
		
		
	}
	/* 
	修改密码
	
	function editPwd(){
		var checkedRow = yhglDatagrid.datagrid('getChecked');
		//是否选择一行
		if(checkedRow.length==1){
			//添加节点
			editPwdDialog = $('<div/>').dialog({
				title:'编辑密码',
				width:500,
				height:100,
				modal:true,
				href:'${pageContext.request.contextPath}/admins/yhgl_editpwddialog.jsp',
				onClose:function(){
					//删除以前的节点
					$(this).dialog('destroy');
					editPwdDialog = undefined;
				},
				onOpen:function(){
					
					
				},
				onLoad:function(){
					//初始化dialog及其内部标签
					editPwdForm = $('#admins_yhgl_adddialog_editPwdForm'); 
					editDialog = $('#admins_yhgl_editdialog_editDialog'); 
					//加载文本信息
					editPwdForm.form('load',checkedRow[0]);
					//设置密码显示
					editPwdForm.find("#adminPwd").val('');
				}
			});
		}else{
			//提示是否选择一行
			$.messager.show({
				title:'提示',
				msg:'只能同时操作一行'
			});
		}
	}
	 */
	/**
	*点击删除数据
	**/
	function yhglRemove(){
		//选择的需要删除的行
		var checkedRows = yhglDatagrid.datagrid('getChecked');
		
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
					zkAjax("/usersAction!deleteUsers.action?deleteIds="+ids.join(','),function(data){
						var msg = data.msg;
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
							yhglDatagrid.datagrid('load');
							//取消选择的行
							yhglDatagrid.datagrid('unselectAll');
							yhglDatagrid.datagrid('uncheckAll');
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
	
	/**
	*修改密码
	**/
	function editPwd(){
		var checkedRow = yhglDatagrid.datagrid('getChecked');
		//是否选择一行
		if(checkedRow.length==1){
			//添加节点
			yhglEditPwdDialog = $('<div/>').dialog({
				title:'编辑密码',
				width:500,
				height:100,
				modal:true,
				href:'${pageContext.request.contextPath}/admins/users/yhgl_editpwddialog.jsp',
				onClose:function(){
					//删除以前的节点
					$(this).dialog('destroy');
					yhglEditPwdDialog = undefined;
				},
				onOpen:function(){
					
					
				},
				onLoad:function(){
					yhglEditPwdForm = $('#admins_yhgl_editpwddialog_editPwdForm');
					
					//加载文本信息
					yhglEditPwdForm.form('load',checkedRow[0]);
					yhglEditPwdForm.find('input[name=password]').val('');
				}
			});
		}else{
			//提示是否选择一行
			$.messager.show({
				title:'提示',
				msg:'只能同时操作一行'
			});
		}
	}
	
	/**
	*点击增加按钮，弹出dialog
	**/
	function yhglAdd(){
		//添加节点
		yhglAddDialog = $('<div/>').dialog({
			title:'增加',
			width:500,
			height:360,
			modal:true,
			href:'${pageContext.request.contextPath}/admins/users/yhgl_adddialog.jsp',
			onClose:function(){
				//删除以前的节点
				$(this).dialog('destroy');
				yhglAddDialog = undefined;
			},
			onOpen:function(){
			},
			onLoad:function(){
				//初始化dialog及其内部标签
				yhglAddForm = $('#admins_yhgl_adddialog_addForm');
				/* addDialog = $('#admins_qxgl_editdialog_addDialog'); */
			}
		});
	}
	/**
	*查看导游的证件
	*/
	function yhglCheckGuideImg(userid){
		yhglCheckGuideImgUserId = userid;
		//添加节点
		yhglCheckguideimgDialog = $('<div/>').dialog({
			title:'查看导游证',
			width:400,
			height:500,
			/* maximizable:true, */
			modal:true,
			href:'${pageContext.request.contextPath}/admins/users/yhgl_checkguideimgdialog.jsp',
			onClose:function(){
				//删除以前的节点
				$(this).dialog('destroy');
				yhglCheckguideimgDialog = undefined;
			},
			onOpen:function(){
			},
			onLoad:function(){
			}
		});
	}
</script>


