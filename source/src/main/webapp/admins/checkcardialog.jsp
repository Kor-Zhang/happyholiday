<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table id="admins_qcgl_checkcardatagrid" data-options="fit:true,border:false">

</table>	




<script type="text/javascript" src="<c:url value='/jslib/zkutil.js'/>"></script>
<script type="text/javascript">
	
	$(function($) {
		$('#admins_qcgl_checkcardatagrid').datagrid({
			
			url :'${pageContext.request.contextPath}/carsAction!getSingleCarDatagridById.action?id='+currtCheckCarId,
			fit:true,
			idField:'carBd',
			sortName:'carBd',
			sortOrder:'desc',
			multiSort:false,
			/* remoteSort:true, */
			selectOnCheck:true,
			checkOnSelect:true,
			singleSelect:true,
			frozenColumns:[[
			{
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
				field : 'carLine',
				sortable:true,
				title : '车系'
			} , {
				field : 'type',
				title : '款式',
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
				sortable:true
			}, {
				field : 'createTime',
				title : '创建时间',
				sortable:true
			}] ],
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
	*显示汽车图片的dialog
	**/
	function ddglShowCarImgDialog(carId){
		//记录下carid
		_currtCarId = carId;
		//添加节点
		ddglCarImgDialog = $('<div/>').dialog({
			title:'查看汽车图片',
			width:600,
			height:400,
			resizable:true,
			minimizable:true,
			maximizable:true,
			modal:true,
			href:'${pageContext.request.contextPath}/admins/ddgl_checkcarimgdialog.jsp',
			onClose:function(){
				//删除以前的节点
				$(this).dialog('destroy');
				ddglCarImgDialog = undefined;
			},
			onOpen:function(){
				
			},
			onLoad:function(){
				/* carImgDatagrid = $('#admins_qcgl_carimgdialog_datagrid'); */
			}
		});
	}
</script>


