<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="<c:url value='/jslib/kindeditor-4.1.10/themes/default/default.css'/>" />
<link rel="stylesheet" href="<c:url value='/jslib/kindeditor-4.1.10/plugins/code/prettify.css'/>" />
<form id="admins_gwywgl_adddialog_addForm"  method="post" action="" enctype="multipart/form-data">
	<table>
		<tr><th>标题：</th></tr>
		<tr>
			<td>
				<input style="width:90%;" placeholder="请输入标题" class="easyui-validatebox" data-options="required:true" name="title"/>
			</td>
			
		</tr>
		<tr>
			<th>内容：</th>
		</tr>
		<tr>
			
			<td>
				<textarea name="text" style="width:100%; height:420px;">请输入内容</textarea> 
				
			</td>
			
		</tr>
		<tr>
			<th>展示/不展示：</th>
		</tr>
		<tr>
			
			<td>
				<select name="status">
					<option value="1">展示</option>
					<option value="0">不展示</option>
				</select>
			</td>
		</tr>
	</table>
	<a class="easyui-linkbutton"
		style="margin-left:10px;margin-top: 20px;"
		href="javascript:void(0);"
		data-options="iconCls:'icon-add',
		onClick:function(){
			$('#admins_gwywgl_adddialog_addForm').form('submit',{
				url:'${pageContext.request.contextPath}'+owBackNamespace+'/owServiceBackAction!uploadTextService.action',
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
						gwywglAddDialog.dialog('close');
						gwywglDatagrid.datagrid('reload');
					}
				}
			 });
		}">提交</a>
</form>








<script type="text/javascript" charset="utf-8" src="<c:url value='/jslib/kindeditor-4.1.10/kindeditor.js'/>"></script>
<script type="text/javascript" charset="utf-8" src="<c:url value='/jslib/kindeditor-4.1.10/lang/zh_CN.js'/>"></script>
<script type="text/javascript" charset="utf-8" src="<c:url value='/jslib/kindeditor-4.1.10/plugins/code/prettify.js'/>"></script>
<script type="text/javascript" charset="utf-8">
	var editor = undefined;
	$(function() {
		//设置编辑框的宽度为填充父节点
		$('textarea[name="text"]').width($('html').width()-80);
	});
	//初始化kingeditor
	editor = KindEditor.create('textarea[name="text"]', {
		filterMode: false,//是否开启过滤模式
		allowFileManager : true,
		resizeType : 0,  //文本框不可拖动
		uploadJson : '${pageContext.request.contextPath}' + owBackNamespace
				+ '/owServiceUploadBackAction!uploadServiceTextImg.action',
		/* fileManagerJson : '../../KindEditor/asp.net/file_manager_json.ashx' */
		urlType : 'absolute',
		items : [ "source", "|", "undo", "redo", "|", "preview", "print",
						"template", "code", "cut", "copy", "paste", "plainpaste",
						"wordpaste", "|", "justifyleft", "justifycenter",
						"justifyright", "justifyfull", "insertorderedlist",
						"insertunorderedlist", "indent", "outdent", "subscript",
						"superscript", "clearhtml", "quickformat", "selectall", "|",
						/* "fullscreen" */, "/", "formatblock", "fontname", "fontsize", "|",
						"forecolor", "hilitecolor", "bold", "italic", "underline",
						"strikethrough", "lineheight", "removeformat", "|", "image",
						"multiimage", "flash", "media", "insertfile", "table", "hr",
						"emoticons", "baidumap", "pagebreak", "anchor", "link",
						"unlink", "|", "about" ],
		afterCreate : function(){ //kindeditor创建后，将编辑器的内容设置到原来的textarea控件里
		      this.sync();  
		},
		afterChange: function(){ //编辑器内容发生变化后，将编辑器的内容设置到原来的textarea控件里
		      this.sync();  
		},
		afterBlur : function(){ //编辑器聚焦后，将编辑器的内容设置到原来的textarea控件里
		   this.sync();
		}  ,
	});
	
</script>