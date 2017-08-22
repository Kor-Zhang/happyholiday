<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form id="addViewForm" action="" method="post"
	enctype="multipart/form-data">
	<table cellpadding="5">
		<tbody>
			<tr id="uploadFileDom">
				<td width="75px">景区图片</td>
				<td width="150px">
					<div style='width:150px;overflow:hidden;'>
						<input type="file" name="uploadFile">
					</div>
				</td>
				<td width="75px"></td>
				<td width="150px"><input name="mainNumber" type="radio"
					value="0" />设为主要</td>
			</tr>
			<tr>
				<td width="75px"></td>
				<td width="150px"></td>
				<td width="75px"></td>
				<td width="150px"><a class="easyui-linkbutton"
					href="javascript:void(0);"
					data-options="onClick:function(){
        			  	//添加新镇的图片上传框
        			  	var tr = $('<tr/>');
        			  	//复制上传框
        			  	var viewImgDom = $('#uploadFileDom').html();
        			  	//记录旧的节点的数字代码
        			  	var oldMainNumber = $(viewImgDom).find('input[name=mainNumber]').val();
        			  	
        			  	//添加节点
        			  	tr.append(viewImgDom);
        			  	var newDom = $('#uploadFileDom').before(tr);
        			  	//修改新的节点的编号
        			  	oldMainNumber = Number(oldMainNumber)+1;
        			  	newDom.find('input[name=mainNumber]').val(oldMainNumber);
        			  }">新增图片</a>
				</td>
			</tr>
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

				</select></td>
				<td width="75px" align="right">详细地址:</td>
				<td width="150px"><input class="easyui-textbox" type="text"
					name="address" id="address" value="" /></td>

			</tr>
			<tr>
				<td width="75px" align="right">城市:</td>
				<td width="150px"><select id="city" name="city"
					style="width: 100px;">

				</select></td>
				<td width="75px" align="right">评价:</td>
				<td width="150px"><input class="easyui-textbox" type="text"
					name="feature" id="feature" value="" /></td>

			</tr>
			<tr>
				<td width="75px" align="right">景区星级:</td>
				<td width="150px"><select id="grade" class="easyui-combobox"
					name="grade" style="width: 100px;">
						<option value="0">请选择</option>
				</select></td>
				<td width="75px" align="right">开放时间:</td>
				<td width="150px"><input class="easyui-textbox" type="text"
					name="opentime" id="opentime" value="" /></td>

			</tr>
			<tr>
				<td width="75px"></td>
				<td width="150px" id="addMsg" style="color:red"></td>
				<td width="75px" align="right">结束时间:</td>
				<td width="150px"><input class="easyui-textbox" type="text"
					name="endtime" id="endtime" value="" /></td>
			</tr>
		</tbody>
	</table>
	<a id="save" class="easyui-linkbutton"
		data-options="iconCls:'icon-save',onClick:function(){
				addViewForm	= $('#addViewForm').form('submit',{
						url:'${pageContext.request.contextPath}/viewsUploadAction.action',
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
								viewAddDialog.dialog('close');
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
	
	$(function(){
		showCountry(5);
    })
	
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
				citySelect.append("<option  value="+rows[i].text+">"+rows[i].text+"</option>");
			}
		});	
	}
	//清除select内容，并且影藏
	function clearAddressSelect(select){
		select.html("");
		select.hide();
	}
</script>