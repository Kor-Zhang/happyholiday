<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="easyui-panel" data-options="fit:true,border:false">
	<div class="easyui-layout" data-options="fit:true,border:false">
		<div class="" data-options="region:'north',title:'筛选',border:false" style="height:210px;">
			<form id="admins_syqctjgl_adddialog_searchForm" style="display: inline-block;" method="post">
				<table width="100%">
					<tr>
						<th>
							品牌：
						</th>
						<td>
							<input type="text" name="searchCarBd" placeholder="检索品牌(可模糊查询)"/>	
						</td>
					
						<th>
							车型：
						</th>
						<td>
							<input type="text" name="searchType" placeholder="检索车型(可模糊查询)"/>	
						</td>
						<th>
							车系：
						</th>
						<td>
							<input type="text" name="searchCarLine" placeholder="检索车系(可模糊查询)"/>	
						</td>
						<th>
							地点：
						</th>
						<td>
							<input type="text" name="searchAddress" placeholder="检索地点(可模糊查询)"/>
							
						</td>
					</tr>
					<tr>
						<th>
							天窗：
						</th>
						<td>
							<input type="text" name="searchSkyWindow" placeholder="检索天窗(可模糊查询)"/>
							
						</td>
					
						<th>
							汽油容量：
						</th>
						<td>
							<input type="text" name="searchFuelTankage" placeholder="检索汽油容量可模糊查询)"/>
							
						</td><th>
							音响：
						</th>
						<td>
							<input type="text" name="searchSoundBox" placeholder="检索音响(可模糊查询)"/>
							
						</td>
						<th>
							倒车雷达：
						</th>
						<td>
							<input type="text" name="searchReverseSensor" placeholder="检索雷达(可模糊查询)"/>
							
						</td>
						
					</tr>
					<tr>
						<th>
							dvd：
						</th>
						<td>
							<input type="text" name="searchDvd" placeholder="检索dvd(可模糊查询)"/>
							
						</td>
						<th>
							gps：
						</th>
						<td>
							<input type="text" name="searchGps" placeholder="检索gps(可模糊查询)"/>
							
						</td>
						
						
					</tr>
					<tr>
						<th>
							价格：
						</th>
						<td>
							<input type="text" name="minPrice" placeholder="请输入最小值"/>
							
						</td>
						<th>
						</th>
						<td>
							<input type="text" name="maxPrice" placeholder="请输入最大值"/>
						</td>
					</tr>
					<tr>
						<th>
							数量：
						</th>
						<td>
							<input type="text" name="minNumber" placeholder="请输入最小值"/>
							
						</td>
						<th>
						</th>
						<td>
							<input type="text" name="maxNumber" placeholder="请输入最大值"/>
						</td>
					</tr>
					<tr>
						
						<th>
							 创建时间：
						</th>
						<td>
							<input name="minYear" style=";" class="easyui-datetimebox" data-options="editable:false"/>-
							
						</td>
						<th>
						</th>
						<td>
							<input name="maxYear" style=";" class="easyui-datetimebox" data-options="editable:false"/>
							
						</td>
						
						<td>
							<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onClick="qcglSearchFun();">查询</a>
							<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true" onClick="qcglClearFun();">清空</a>
						</td>
						
					</tr>
				</table>
			</form>
		</div>	
		<div class="" data-options="region:'center'">
			<table id="admins_syqctjgl_adddialog_datagrid" data-options="fit:true,border:false">
	
			</table>	
		</div>
	</div>

</div>

<script type="text/javascript" src="<c:url value='/jslib/zkutil.js'/>"></script>
<script type="text/javascript">
	//汽车图片的datagrid
	var carImgDatagrid = undefined;
	//汽车图片的dialog
	var carImgDialog = undefined;
	//当前查看图片的carid
	var currtCarId = undefined;
	//汽车的datagrid
	var syqctjglCarDatagrid = undefined;
	var qcglAddDialog = undefined;
	var qcglAddForm = undefined;
	//编辑汽车dialog
	var qcglEditDialog = undefined;
	//编辑汽车form
	var qcglEditForm = undefined;
	var editDialog = undefined;
	var editForm = undefined;
	var editPwdForm = undefined;
	var editPwdDialog = undefined;
	$(function($) {
		syqctjglCarDatagrid = $('#admins_syqctjgl_adddialog_datagrid').datagrid({
			
			url :'${pageContext.request.contextPath}/carsAction!getCarsDatagrid.action',
			pagination:true,
			fit:true,
			idField:'createTime',
			sortName:'createTime',
			sortOrder:'desc',
			multiSort:false,
			/* remoteSort:true, */
			selectOnCheck:true,
			checkOnSelect:true,
			singleSelect:true,
			frozenColumns:[[
			{
				field : 'checkbox',
				checkbox:true
			},{
				field : 'id',
				hidden:true
			},{
				field : 'showImg',
				title : '图片',
				formatter: function(value,row,index){
					var carId = row.id;
					/* var carImg = "<span style='width:30px;' title='点击更新图片'><img style='width:30px;' src='${pageContext.request.contextPath}/carsAction!getCarsImg.action?id="+value+"'/></span>"; */
					var checkImgBtn = "<a href=javascript:checkCarImg('"+carId+"')>点击查看图片</a>";
					return checkImgBtn;
				}
			},{
				field : 'carBd',
				title : '品牌',
				sortable:true
			}, {
				field : 'type',
				title : '车型',
				sortable:true
			} , {
				field : 'carLine',
				title : '车系',
				sortable:true
			} , {
				field : 'address',
				title : '地点',
				sortable:true
			}
         	]],
			columns : [ [  {
				field : 'year',
				title : '年份',
				sortable:true
			}, {
				field : 'seatType',
				title : '座椅类型',
				sortable:true
			}, {
				field : 'seatNumber',
				title : '座椅数量',
				sortable:true
			}, {
				field : 'fuelType',
				title : '燃油类型',
				sortable:true
			}, {
				field : 'transmissionType',
				title : '变速箱类型',
				sortable:true
			}, {
				field : 'displacement',
				title : '排量',
				sortable:true
			}, {
				field : 'drivingMode',
				title : '驱动模式',
				sortable:true
			}, {
				field : 'engineIntakeForm',
				title : '发动机进气形式',
				sortable:true
			}, {
				field : 'skyWindow',
				title : '天窗',
				sortable:true
			}, {
				field : 'fuelTankage',
				title : '汽油容量',
				sortable:true
			}, {
				field : 'SoundBox',
				title : '音响',
				sortable:true
			}, {
				field : 'reverseSensor',
				title : '倒车雷达',
				sortable:true
			}, {
				field : 'airSacNumber',
				title : '气囊数量',
				sortable:true
			}, {
				field : 'dvd',
				title : 'dvd',
				sortable:true
			}, {
				field : 'gps',
				title : 'gps定位',
				sortable:true
			}, {
				field : 'price',
				title : '价格',
				sortable:true
			}, {
				field : 'number',
				title : '数量',
				sortable:true,
				formatter: function(value,row,index){
					if(value>0){
						return "<font style='color:green;'>"+value+"</font>";
					}
					return "<font style='color:red;'>"+value+"</font>";
				}
			}, {
				field : 'createTime',
				title : '创建时间',
				sortable:true
			}] ],toolbar: [{
				text:'设置为推荐',
				iconCls: 'icon-add',
				handler: function(){
					qcglAdd();
				}
			}/* ,'-',{
				text:'删除',
				iconCls: 'icon-remove',
				handler: function(){
					qcglRemove();
				}
			},'-',{
				text:'编辑',
				iconCls: 'icon-edit',
				handler: function(){
					qcglEdit();
				}
			},'-',{
				text:'帮助',
				iconCls: 'icon-help',
				handler: function(){
					help();
				}
			} */],
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
		/* //点击回车查询
		$('#admins_syqctjgl_adddialog_searchId').keyup(function(e){
			if(e.keyCode==13){
				searchFun();
			}
		}); */
		
	});
	/**
	*查询
	**/
	function qcglSearchFun(){
		//获取查询的form参数
		var params = serializeObject($('#admins_syqctjgl_adddialog_searchForm'));
		syqctjglCarDatagrid.datagrid('load', params);
	}
	/**
	*清空
	**/
	function qcglClearFun(){
		//清空input
		$('#admins_syqctjgl_adddialog_searchForm input').val("");
		//select选择第一个option
		firstOption("admins_syqctjgl_adddialog_searchForm");
		//重新加载
		syqctjglCarDatagrid.datagrid('load', {});
		
	}
	
	/**
	*点击增加按钮，弹出dialog
	**/
	function qcglAdd(){
		var checkedRow = syqctjglCarDatagrid.datagrid('getChecked');
		//是否选择一行
		if(checkedRow.length==1){
			var carId = checkedRow[0].id;
			zkAjax("/recommendCarsAction!addRecommendCar.action?carId="+carId,function(data){
				showMsg(data);
				try{
					isOnline(data);
				}catch(e){
					return;
				}
				if(data.success){
					syqctjglDatagrid.datagrid('reload');
					syqctjglAddDialog.dialog('close');
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
	
</script>


