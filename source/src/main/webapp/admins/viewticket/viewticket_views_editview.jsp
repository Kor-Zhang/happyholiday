<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form id="editViewForm" action="" method="post"
	enctype="multipart/form-data">
	<table cellpadding="5">
		<tbody>
			<!-- 保存一些信息 -->
        	<input name="id" type="text" style="display:none"/>
        	<input id="1" name="country" type="text" style="display:none" />
        	<input id="2" name="province" type="text" style="display:none"/>
        	<input id="3" name="city" type="text" style="display:none"/>
        	<input id="4" name="grade" type="text" style="display:none"/>
        	<input id="5" name="type" type="text" style="display:none"/>
        	<input name="hasIntro" type="text" style="display:none" />
			<tr>
				<td width="75px" align="right">国家:</td>
				<td width="150px"><select id="country" name="country"
					style="width: 100px;">
				</select></td>
				<td width="75px" align="right">景区名称:</td>
				<td width="150px"><input class="easyui-textbox" type="text"
					name="name" id="name" value="" /></td>
			</tr>
			<tr>
				<td width="75px" align="right">省份:</td>
				<td width="150px"><select id="province" name="province"
					style="width: 100px;">
					<option value=""></option>
				</select></td>
				<td width="75px" align="right">详细地址:</td>
				<td width="150px"><input class="easyui-textbox" type="text"
					name="address" id="address" value="" /></td>

			</tr>
			<tr>
				<td width="75px" align="right">城市:</td>
				<td width="150px"><select id="city" name="city"
					style="width: 100px;">
				<option value=""></option>s
				</select></td>
				<td width="75px" align="right">评价:</td>
				<td width="150px"><input class="easyui-textbox" type="text"
					name="feature" id="feature" value="" /></td>
			</tr>
			<tr>
				<td width="75px" align="right">景区星级:</td>
				<td width="150px"><select id="grade" 
					name="grade" style="width: 100px;">
				</select></td>
				<td width="75px" align="right">开放时间:</td>
				<td width="150px"><input class="easyui-textbox" type="text"
					name="opentime" id="opentime" value="" /></td>

			</tr>
			<tr>
				<td width="75px">景区风格</td>
				<td width="150px">
					<select id="type" 
					name="type" style="width: 100px;">
				</select>
				</td>
				<td width="75px" align="right">销量:</td>
				<td width="150px"><input class="easyui-textbox" type="text"
					name="salesNumber" id="salesNumber" value="" readonly="true"/></td>
			</tr>
			<tr>
				<td width="75px"></td>
				<td width="150px" id="addMsg" style="color:red"></td>
				<td width="75px" align="right"></td>
				<td width="150px"></td>
			</tr>
		</tbody>
	</table>
	<a id="save" class="easyui-linkbutton"
		data-options="iconCls:'icon-save',onClick:function(){
				editViewForm= $('#editViewForm').form('submit',{
						url:'${pageContext.request.contextPath}/viewsAction!updateView.action',
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
								viewEidtDialog.dialog('close');
								viewDataDialog.datagrid('reload');
							}
						}
					})
				}">保存</a>
</form>
<script>
  
	var countrySelect = $("#country");
	var provinceSelect = $("#province");
	var citySelect = $("#city");
	var gradeSelect = $("#grade");
	var typeSelect = $("#type");
	
	var currentCountry = undefined;
	var currentProvince = undefined;
	var currentCity = undefined;
	
	var current = undefined;
	
	$(function(){
		showCountry(5);
		showGrade();
		showType();
    })
    
    
	function showGrade(){
		//远程加载下拉框数据
		zkAjax("/frontSystemddlAction!getSystemddlByParentId.action?id=8",function(data){
			//添加数据到addressSelect
			var rows = data;
			for (var i = 0; i < rows.length; i++) {
				gradeSelect.append("<option  value="+rows[i].text+">"+rows[i].text+"</option>");
				if(rows[i].text==$("#4").val()){
					gradeSelect.val(rows[i].text);
				}
			}
		});	
	}
	function showType(){
		//远程加载下拉框数据
		zkAjax("/frontSystemddlAction!getSystemddlByParentId.action?id=9",function(data){
			//添加数据到addressSelect
			var rows = data;
			for (var i = 0; i < rows.length; i++) {
				typeSelect.append("<option  value="+rows[i].text+">"+rows[i].text+"</option>");
				if(rows[i].text==$("#5").val()){
					typeSelect.val($("#5").val());
				}
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
				countrySelect.append("<option id="+rows[i].id+" onClick=showProvince('"+rows[i].id+"') value="+rows[i].text+">"+rows[i].text+"</option>");
				
				if(rows[i].text==$("#1").val()){
					currentCountry = $("#1").val();
					countrySelect.val(currentCountry);
					current = i;
				}
				
			}
			showProvince(rows[current].id);
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
				if(rows[i].text==$("#2").val()){
					currentProvince = $("#2").val();
					provinceSelect.val(currentProvince);
					current = i;
				}
				
			}
			showCity(rows[current].id);
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
				citySelect.append("<option  value="+rows[i].text+">"+rows[i].text+"</option>");
				if(rows[i].text==$("#3").val()){
					currentCity = $("#3").val();
					citySelect.val(currentCity);
				}
			}
			
		});	
	}
	//清除select内容，并且影藏
	function clearAddressSelect(select){
		select.html("");
		select.hide();
	}
</script>