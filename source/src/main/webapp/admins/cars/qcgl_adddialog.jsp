<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- enctype 默认是 application/x-www-form-urlencoded -->  
<form id="admins_qcgl_adddialog_addForm" action="" enctype="multipart/form-data" method="post" >  
        <table style="margin: 20px 10px;">
        
        
        	<tr id="uploadFileDom">
        		
        		<td align="right">
        			
        			<div style='width:150px;overflow:hidden;'>
        				<input type="file" name="uploadFile">
        			</div>
        		</td>
        		
        		<td align="left">
        			
        			<label>
        				<input name="mainNumber" type="radio" value="0" />设为主要 
        			</label> 

        		</td>
        	</tr>
        	
        	<tr>
        		<td  align="right"></td>
        		<td  align="left">
        			  <a class="easyui-linkbutton" href="javascript:void(0);"
        			  data-options="onClick:function(){
        			  	//添加新镇的图片上传框
        			  	var tr = $('<tr/>');
        			  	//复制上传框
        			  	var carImgDom = $('#uploadFileDom').html();
        			  	//记录旧的节点的数字代码
        			  	var oldMainNumber = $(carImgDom).find('input[name=mainNumber]').val();
        			  	
        			  	//添加节点
        			  	tr.append(carImgDom);
        			  	var newDom = $('#uploadFileDom').before(tr);
        			  	//修改新的节点的编号
        			  	oldMainNumber = Number(oldMainNumber)+1;
        			  	newDom.find('input[name=mainNumber]').val(oldMainNumber);
        			  }">新增照片</a>
        		</td>
        	</tr>
        	
        	<tr>
        		<td align="right">
        			品牌：<!-- <input value="本田" name="carBd" class="easyui-validatebox" data-options="required:true"/> -->
        			 <select name="carBd">
        			  	
        			  </select>
        		</td>
        		<td  align="right">
        			  车型：<!-- <input value="本田" name="type" class="easyui-validatebox" data-options="required:true"/> -->
        			  <select name="type">
        			  	
        			  </select>
        		</td>
        		
        		
        	</tr>
        	<tr>
        		<td align="right">
        			车系：<input value="本田" name="carLine" class="easyui-validatebox" data-options="required:true"/>
        			
        		</td>
        		
        		
        		
        	</tr>
        	<tr>
        		<td colspan="2" align="center">
        			  地点：
        			<select name="nation">
        			  	
        	    	</select>
        	    	<select name="province">
        			  	
        	    	</select>
        	    	<select name="city">
        			  	
        	    	</select>
        	    	<select name="county">
        			  	
        	    	</select>
        	    	<select name="store">
        			  	
        	    	</select>
        		</td>
        	</tr>
        	<tr>
        		<td align="right">
        			年份：<input value="本田" name="year"type="text" class="easyui-datebox" required="required"></input>  
        		</td>
        		<td  align="right">
        			  座位类型：<input value="本田" name="seatType" class="easyui-validatebox" data-options="required:true"/>
        		</td>
        	</tr>
        	<tr>
        		<td align="right">
        			座位数量：<input value="本田" name="seatNumber" type="text" class="easyui-numberbox" value="" data-options="min:1,precision:0"></input>
        			
        		</td>
        		<td  align="right">
        			 燃料类型：<input value="本田" name="fuelType" class="easyui-validatebox" data-options="required:true"/>
        		</td>
        	</tr>
        	<tr>
        		<td align="right">
        			变速箱：<input value="本田" name="transmissionType" class="easyui-validatebox" data-options="required:true"/>
        		</td>
        		<td  align="right">
        			  排量：<input value="本田" name="displacement" type="text" class="easyui-numberbox" value="" data-options="min:1,precision:0"></input>
        		</td>
        	</tr>
       		<tr>
        		<td align="right">
        			驱动模式：<input value="本田" name="drivingMode" class="easyui-validatebox" data-options="required:true"/>
        		</td>
        		<td  align="right">
        			  发动机进气形式：<input value="本田" name="engineIntakeForm" class="easyui-validatebox" data-options="required:true"/>
        		</td>
        	</tr>
        	<tr>
        		<td align="right">
        			天窗：<input value="本田" name="skyWindow" class="easyui-validatebox" data-options="required:true"/>
        		</td>
        		<td  align="right">
        			 汽油容量：<input value="本田" name="fuelTankage" type="text" class="easyui-numberbox" value="" data-options="min:1,precision:0"></input>
        		</td>
        	</tr>
        	<tr>
        		<td align="right">
        			音响：<input value="本田" name="soundBox" class="easyui-validatebox" data-options="required:true"/>
        		</td>
        		<td  align="right">
        			倒车雷达：<input value="本田" name="reverseSensor" class="easyui-validatebox" data-options="required:true"/>
        		</td>
        	</tr>
        	<tr>
        		<td align="right">
        			气囊数量：<input value="本田" name="airSacNumber" type="text" class="easyui-numberbox" value="" data-options="min:1,precision:0"></input>
        		</td>
        		<td  align="right">
        			 dvd：<input value="本田" name="dvd" class="easyui-validatebox" data-options="required:true"/>
        		</td>
        	</tr>
        	<tr>
        		<td align="right">
        			gps：<input value="本田" name="gps" class="easyui-validatebox" data-options="required:true"/>
        		</td>
        		<td  align="right">
        			 价格：<input value="本田" name="price" type="text" class="easyui-numberbox" value="" data-options="min:1,precision:0"></input> 
        		</td>
        	</tr>
        	<tr>
        		<td  align="right">
        			 导游价格：<input value="" name="guidePrice" type="text" class="easyui-numberbox" value="" data-options="min:1,precision:0"></input> 
        		</td>
        		<td align="right">
        			数量：<input value="本田" name="number" type="text" class="easyui-numberbox" value="" data-options="min:1,precision:0"></input>
        		</td>
        		
        	</tr>
        </table>
            
        <a class="easyui-linkbutton"
		style="float:right;margin-right: 20px;"
		href="javascript:void(0);"
		data-options="iconCls:'icon-add',
		onClick:function(){
			qcglAddForm = $('#admins_qcgl_adddialog_addForm').form('submit',{
				url:'${pageContext.request.contextPath}/carsUploadAction.action',
				onSubmit: function(param){
					 //整合国家，省，市，县，店面参数
			         param.address = groupSelect([nationSelect,provinceSelect,citySelect,countySelect,storeSelect]);
			         
			    },    
				success:function(data){
					console.info(data);
					data = $.parseJSON(data);
					var msg = data.msg;
					var success = data.success;
					var obj = data.obj;
					<!-- 提示信息 -->
					$.messager.show({
						title:'提示',
						msg:msg
					});
					try{
						//判断是否在线
						isOnline(data);
					}catch(e){
						return;
					}
					if(success){
						qcglAddDialog.dialog('close');
						qcglDatagrid.datagrid('reload');
					}
				}
			 });
		}">提交</a>
  
</form>  


<script type="text/javascript">
	var mainNumber = 1;
	
	
	/*******************************联级加载国家，省，市，县，店面**********************************/
	var nationSelect = undefined;
	var provinceSelect = undefined;
	var citySelect = undefined;
	var countySelect = undefined;
	var storeSelect = undefined;
	$(function($){
		nationSelect = $("select[name=nation]").hide();
		provinceSelect = $("select[name=province]").hide();
		citySelect = $("select[name=city]").hide();
		countySelect = $("select[name=county]").hide();
		storeSelect = $("select[name=store]").hide();
		
		var id = "1";
		//加载地址
		showNation(id);
		//加载车型
		loadType();
		//加载品牌
		loadBrand();
	});
	
	/**
	*加载车型
	*/
	function loadType(){
		var id = "3";
		var typeSelect = $('select[name=type]');
		zkAjax("/systemddlAction!getSystemddlByParentId.action?id="+id,function(data){
			//添加数据到addressSelect
			var rows = data.rows;
			for (var i = 0; i < rows.length; i++) {
				typeSelect.show();
				typeSelect.append("<option value="+rows[i].text+">"+rows[i].text+"</option>");
			}
			
		});
	}
	/**
	*加载车型
	*/
	function loadBrand(){
		var id = "2";
		var brandSelect = $('select[name=carBd]');
		zkAjax("/systemddlAction!getSystemddlByParentId.action?id="+id,function(data){
			//添加数据到addressSelect
			var rows = data.rows;
			for (var i = 0; i < rows.length; i++) {
				brandSelect.show();
				brandSelect.append("<option value="+rows[i].text+">"+rows[i].text+"</option>");
			}
			
		});
	}
	
	
	
	
	
	
	
	
	
	//显示国家信息到select
	function showNation(id){
		clearAddressSelect(nationSelect);
		clearAddressSelect(provinceSelect);
		clearAddressSelect(citySelect);
		clearAddressSelect(countySelect);
		clearAddressSelect(storeSelect);
		//远程加载下拉框数据
		zkAjax("/systemddlAction!getSystemddlByParentId.action?id="+id,function(data){
			//添加数据到addressSelect
			var rows = data.rows;
			for (var i = 0; i < rows.length; i++) {
				nationSelect.show();
				nationSelect.append("<option  onClick=showProvinceAddress('"+rows[i].id+"') value="+rows[i].text+">"+rows[i].text+"</option>");
			}
			showProvinceAddress(rows[0].id);
		});
	}
	
	//显示省信息到select
	function showProvinceAddress(id){
		clearAddressSelect(provinceSelect);
		clearAddressSelect(citySelect);
		clearAddressSelect(countySelect);
		clearAddressSelect(storeSelect);
		//远程加载下拉框数据
		zkAjax("/systemddlAction!getSystemddlByParentId.action?id="+id,function(data){
			//添加数据到Select
			var rows = data.rows;
			for (var i = 0; i < rows.length; i++) {
				provinceSelect.show();
				provinceSelect.append("<option  onClick=showCityAddress('"+rows[i].id+"') value="+rows[i].text+">"+rows[i].text+"</option>");
			}
			showCityAddress(rows[0].id);
		});
	}
	//显示市信息到select
	function showCityAddress(id){
		clearAddressSelect(citySelect);
		clearAddressSelect(countySelect);
		clearAddressSelect(storeSelect);
		//远程加载下拉框数据
		zkAjax("/systemddlAction!getSystemddlByParentId.action?id="+id,function(data){
			//添加数据到Select
			var rows = data.rows;
			for (var i = 0; i < rows.length; i++) {
				citySelect.show();
				citySelect.append("<option  onClick=showCountyAddress('"+rows[i].id+"') value="+rows[i].text+">"+rows[i].text+"</option>");
			}
			showCountyAddress(rows[0].id);
		});
	}
	//显示县信息到select
	function showCountyAddress(id){
		clearAddressSelect(countySelect);
		clearAddressSelect(storeSelect);
		//远程加载下拉框数据
		zkAjax("/systemddlAction!getSystemddlByParentId.action?id="+id,function(data){
			//添加数据到Select
			var rows = data.rows;
			for (var i = 0; i < rows.length; i++) {
				countySelect.append("<option  onClick=showStoreAddress('"+rows[i].id+"') value="+rows[i].text+">"+rows[i].text+"</option>");
				countySelect.show();
			}
			showStoreAddress(rows[0].id);
			
		});
	}
	//显示店铺信息到select
	function showStoreAddress(id){
		clearAddressSelect(storeSelect);
		//远程加载下拉框数据
		zkAjax("/systemddlAction!getSystemddlByParentId.action?id="+id,function(data){
			//添加数据到Select
			var rows = data.rows;
			for (var i = 0; i < rows.length; i++) {
				storeSelect.show();
				storeSelect.append("<option  value="+rows[i].text+">"+rows[i].text+"</option>");
			}
		});
	}
	//清除select内容，并且影藏
	function clearAddressSelect(select){
		select.html("");
		select.hide();
	}
</script>