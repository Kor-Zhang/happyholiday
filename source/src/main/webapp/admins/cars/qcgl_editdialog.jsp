<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- enctype 默认是 application/x-www-form-urlencoded -->  
<form id="admins_qcgl_editdialog_editForm" action="" enctype="multipart/form-data" method="post" >  
     
         <table style="margin: 20px 10px;">
        
        	<!-- 保存id -->
        	<input name="id" type="hidden"/>
        	
        	<!-- <tr>
        		<td align="right">
        			品牌：<input value="" name="carBd" class="easyui-validatebox" data-options="required:true"/>
        			
        		</td>
        		<td  align="right">
        			  车型：<input value="" name="type" class="easyui-validatebox" data-options="required:true"/>
        		</td>
        		
        		
        	</tr> -->
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
        		<td colspan="2" align="center">
        			<!-- 原来地址: -->
      				<input name="address" value="" type="hidden" readonly/>
       			</td>
        	</tr>
        	
        	<tr>
        		<td align="right">
        			年份：<input value="" name="year"type="text" class="easyui-datebox" required="required"></input>  
        		</td>
        		<td  align="right">
        			  座位类型：<input value="" name="seatType" class="easyui-validatebox" data-options="required:true"/>
        		</td>
        	</tr>
        	<tr>
        		<td align="right">
        			座位数量：<input value="" name="seatNumber" type="text" class="easyui-numberbox" value="" data-options="min:1,precision:0"></input>
        			
        		</td>
        		<td  align="right">
        			 燃料类型：<input value="" name="fuelType" class="easyui-validatebox" data-options="required:true"/>
        		</td>
        	</tr>
        	<tr>
        		<td align="right">
        			变速箱：<input value="" name="transmissionType" class="easyui-validatebox" data-options="required:true"/>
        		</td>
        		<td  align="right">
        			  排量：<input value="" name="displacement" type="text" class="easyui-numberbox" value="" data-options="min:1,precision:0"></input>
        		</td>
        	</tr>
       		<tr>
        		<td align="right">
        			驱动模式：<input value="" name="drivingMode" class="easyui-validatebox" data-options="required:true"/>
        		</td>
        		<td  align="right">
        			  发动机进气形式：<input value="" name="engineIntakeForm" class="easyui-validatebox" data-options="required:true"/>
        		</td>
        	</tr>
        	<tr>
        		<td align="right">
        			天窗：<input value="" name="skyWindow" class="easyui-validatebox" data-options="required:true"/>
        		</td>
        		<td  align="right">
        			 汽油容量：<input value="" name="fuelTankage" type="text" class="easyui-numberbox" value="" data-options="min:1,precision:0"></input>
        		</td>
        	</tr>
        	<tr>
        		<td align="right">
        			音响：<input value="" name="soundBox" class="easyui-validatebox" data-options="required:true"/>
        		</td>
        		<td  align="right">
        			倒车雷达：<input value="" name="reverseSensor" class="easyui-validatebox" data-options="required:true"/>
        		</td>
        	</tr>
        	<tr>
        		<td align="right">
        			气囊数量：<input value="" name="airSacNumber" type="text" class="easyui-numberbox" value="" data-options="min:1,precision:0"></input>
        		</td>
        		<td  align="right">
        			 dvd：<input value="" name="dvd" class="easyui-validatebox" data-options="required:true"/>
        		</td>
        	</tr>
        	<tr>
        		<td align="right">
        			gps：<input value="" name="gps" class="easyui-validatebox" data-options="required:true"/>
        		</td>
        		<td  align="right">
        			车系：<input value="" name="carLine" type="text" class="easyui-validatebox" value="" data-options="required:true"></input> 
        		</td>
        	</tr>
        	<tr>
        		
        		<td  align="right">
        			 导游价格：<input value="" name="guidePrice" type="text" class="easyui-numberbox" value="" data-options="min:1,precision:0"></input> 
        		</td>
        		<td  align="right">
        			 价格：<input value="" name="price" type="text" class="easyui-numberbox" value="" data-options="min:1,precision:0"></input> 
        		</td>
        		
        	</tr>
        	<tr>
        		<td align="right">
        			数量：<input value="" name="number" type="text" class="easyui-numberbox" value="" data-options="min:1,precision:0"></input>
        		</td>
        		<td align="right">
        			创建时间：<input value="" name="createTime" type="text" readonly></input>
        		</td>
        		
        	</tr>
        	<tr>
        		<td width="380px" align="center">
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
        		<td>
					<a href="javascript:laodDefaultSelectValue();" class="easyui-linkbutton"
						style="float:right;margin-right: 20px;"
						data-options="iconCls:'icon-add',">使用原来地址</a>
        			<a href="javascript:showNation('1');" class="easyui-linkbutton"
						style="float:right;margin-right: 20px;"
						data-options="iconCls:'icon-add',">点击修改地址</a>
						
				</td>
        	</tr>
        </table>
            
        <a class="easyui-linkbutton"
		style="float:right;margin-right: 20px;"
		href="javascript:void(0);"
		data-options="iconCls:'icon-add',
		onClick:function(){
			qcglAddForm = $('#admins_qcgl_editdialog_editForm').form('submit',{
				url:'${pageContext.request.contextPath}/carsAction!updateCar.action',
				success:function(data){
					console.info(data);
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
						qcglDatagrid.datagrid('reload');
						qcglEditDialog.dialog('close');
					}
				},onSubmit: function(param){
					 //整合国家，省，市，县，店面参数
					 $('input[name=address]').remove();
			         param.address = groupSelect([nationSelect,provinceSelect,citySelect,countySelect,storeSelect]);
			         
			    },  
			 });
		}">提交</a>
</form>  

<script type="text/javascript">
/*******************************联级加载国家，省，市，县，店面**********************************/
var nationSelect = undefined;
var provinceSelect = undefined;
var citySelect = undefined;
var countySelect = undefined;
var storeSelect = undefined;


var nationSelectVal = undefined;
var provinceSelectVal = undefined;
var citySelectVal = undefined;
var countySelectVal = undefined;
var storeSelectVal = undefined;
$(function($){
	nationSelect = $("select[name=nation]").hide();
	provinceSelect = $("select[name=province]").hide();
	citySelect = $("select[name=city]").hide();
	countySelect = $("select[name=county]").hide();
	storeSelect = $("select[name=store]").hide();
	

	//保留select原值
	setTimeout(function(){
		//保存地址原值，便于编辑时加载地址
		
		console.info($('input[name=address]').val());
		var address = $('input[name=address]').val().split('/');
		try{
			nationSelectVal = address[0];
			provinceSelectVal = address[1];
			citySelectVal = address[2];
			countySelectVal = address[3];
			storeSelectVal = address[4];
			
		}catch(e){
			
		}
		
		
	}, 0);
	
	
	
	
	/* var id = "1";
	//加载地址
	showNation(id); */
	//加载车型
	loadType();
	//加载品牌
	loadBrand();
	
	//加载select的原值
	laodDefaultSelectValue();
});
/**
 * 加载select的原值
 */
function laodDefaultSelectValue(){
	setTimeout(function(){
		/* console.info(nationSelectVal);
		console.info(provinceSelectVal);
		console.info(citySelectVal);
		console.info(countySelectVal);
		console.info(storeSelectVal); */
		clearAddressSelect(nationSelect);
		clearAddressSelect(provinceSelect);
		clearAddressSelect(citySelect);
		clearAddressSelect(countySelect);
		clearAddressSelect(storeSelect);
		if(nationSelectVal){
			nationSelect.show();
			var opt = $("<option value='"+nationSelectVal+"'>"+nationSelectVal+"</option>");
			addAndselectOpt(opt,nationSelect);
		}
		
		if(provinceSelectVal){
			provinceSelect.show();
			opt = $("<option value='"+provinceSelectVal+"'>"+provinceSelectVal+"</option>");
			addAndselectOpt(opt,provinceSelect);
			
		}
		if(citySelectVal){
			citySelect.show();
			opt = $("<option value='"+citySelectVal+"'>"+citySelectVal+"</option>");
			addAndselectOpt(opt,citySelect);
		}

		if(countySelectVal){
			countySelect.show();
			opt = $("<option value='"+countySelectVal+"'>"+countySelectVal+"</option>");
			addAndselectOpt(opt,countySelect);
		}

		if(storeSelectVal){
			storeSelect.show();
			opt = $("<option value='"+storeSelectVal+"'>"+storeSelectVal+"</option>");
			addAndselectOpt(opt,storeSelect);
		}
	}, 0);
}
/**
 * 为slect添加并且选择添加的opt
 */
function addAndselectOpt(opt,select){
	select.append(opt);
	opt.attr("selectd","selectd");
}











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
*加载车品牌
*/
function loadBrand(){
	var id = "2";
	var brandSelect = $('select[name=carBd]');
	zkAjax("/systemddlAction!getSystemddlByParentId.action?id="+id,function(data){
		//添加数据到addressSelect
		var rows = data.rows;;
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