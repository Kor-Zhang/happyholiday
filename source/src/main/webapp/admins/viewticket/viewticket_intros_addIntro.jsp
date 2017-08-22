<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form id="addViewIntroForm" action="" method="post" >
	<table cellpadding="5"> 
		<tbody>
			<tr>
				<td width="100px"align="right">景区区域:</td>
				<td width="400px"><select id="country" name="country"style="width: 100px;"></select>
								  <select id="province" name="province"style="width: 100px;"></select>
								  <select id="city" name="city"	style="width: 100px;"></select>
				</td>
			</tr>
			<tr>
				<td width="100px"align="right">景区名:</td>
				<td width="400px" id="viewNameMsg">
				<font style="color:red;display:none" id="tips" >该区域暂时没有景区或已经添加景区介绍</font>
				 <select id="hehe" name="viewName"	style="width: 200px;"></select></td>
			</tr>
			<tr>
				<td width="100px">特色简介1:</td>
				<td width="400px"><input type="text" name="textDescription" id="textDescription" style="width:300px" placeholder="该项必填"/></td>
			</tr>
			<tr>
				<td width="100px">特色简介2:</td>
				<td width="400px"><input type="text" name="textDescriptionTwo" id="textDescriptionTwo" style="width:300px"/></td>
			</tr>
			<tr>
				<td width="100px">特色简介3:</td>
				<td width="400px"><input type="text" name="textDescriptionThree" id="textDescriptionThree" style="width:300px"/></td>
			</tr>
			<tr >
				<td width="100px" ><span>景区详情 1:</span></td>
				<td width="400px"><textarea cols="40" rows="7" placeholder="该项必填" style="resize:none;" name="introduction"></textarea></td>
			</tr>
			<tr>
				<td width="100px">景区详情 2:</td>
				<td width="400px"><textarea cols="40" rows="7"  style="resize:none;" name="introductionTwo"></textarea></td>
			</tr>
			<tr>
				<td width="100px">景区详情 3:</td>
				<td width="400px"><textarea cols="40" rows="7"  style="resize:none;" name="introductionThree"></textarea></td>
			</tr>
			<tr>
				<td width="100px"></td>
				<td width="400px" id="msgIntro"></td>
			</tr>
		</tbody>
	</table>
		<a id="saveIntro" class="easyui-linkbutton" style="float:right; margin-bottom:30px;margin-right:50px"
	data-options="iconCls:'icon-save',onClick:function(){
				addViewIntroForm	= $('#addViewIntroForm').form('submit',{
						url:'${pageContext.request.contextPath}/viewIntorsAction!addViewIntro.action',
						success:function(data){
							data = $.parseJSON(data);
							console.info(data);
							var msg = data.msg;
							var success = data.success;
							<!-- 提示信息 -->
							$('#addMsg').html(msg);
							$.messager.show({
								title:'提示',
								msg:msg
							});
							if(success){
								addViewIntroDialog.dialog('close');
								viewIntroDataDialog.datagrid('reload');
							}
						}
					})
				}">提交</a>
</form>
<script>
	var viewNameSelect = $("#hehe");
	var countrySelect = $("#country");
	var provinceSelect = $("#province");
	var citySelect = $("#city");
	$(function(){
		showCountry(5);
	})
	function showName(city){
		clearAddressSelect(viewNameSelect);
		//远程加载下拉框数据
		zkAjax("/viewsAction!getViewsName.action?city="+encodeURI(encodeURI(city)),function(data){
			if(data.total==0){
				$("#tips").css('display','block');
			}else{
				$("#tips").css('display','none');
			}
			for (var i = 0; i < data.rows.length; i++) {
				viewNameSelect.show();
				viewNameSelect.append("<option  value="+data.rows[i]+">"+data.rows[i]+"</option>");
			}
		});	
	}
	function showCountry(id){
		clearAddressSelect(countrySelect);
		clearAddressSelect(provinceSelect);
		clearAddressSelect(citySelect);
		//远程加载下拉框数据
		zkAjax("/frontSystemddlAction!getSystemddlByParentId.action?id="+id,function(data){
			//添加数据到addressSelect
			var rows = data;
			for (var i = 0; i < rows.length; i++) {
				countrySelect.show();
				countrySelect.append("<option  onClick=showProvince('"+rows[i].id+"') value="+rows[i].text+">"+rows[i].text+"</option>");
			}
			showProvince(rows[0].id);
		});	
	}
	function showProvince(id){
		clearAddressSelect(provinceSelect);
		clearAddressSelect(citySelect);
		//远程加载下拉框数据
		zkAjax("/frontSystemddlAction!getSystemddlByParentId.action?id="+id,function(data){
			//添加数据到addressSelect
			var rows = data;
			for (var i = 0; i < rows.length; i++) {
				provinceSelect.show();
				provinceSelect.append("<option  onClick=showCity('"+rows[i].id+"') value="+rows[i].text+">"+rows[i].text+"</option>");
			}
			showCity(rows[0].id);
		});	
	}
	function showCity(id){
		clearAddressSelect(citySelect);
		//远程加载下拉框数据
		zkAjax("/frontSystemddlAction!getSystemddlByParentId.action?id="+id,function(data){
			//添加数据到addressSelect
			var rows = data;
			for (var i = 0; i < rows.length; i++) {
				citySelect.show();
				citySelect.append("<option onClick=showName('"+rows[i].text+"')  value="+rows[i].text+">"+rows[i].text+"</option>");
			}
			showName(rows[0].text);
		});	
	}
	//清除select内容，并且影藏
	function clearAddressSelect(select){
		select.html("");
		select.hide();
	}
	
	
	
	
	
</script>