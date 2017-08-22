<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'viewticket.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--导入  -->
	<link rel="stylesheet" type="text/css"
		href="<c:url value='/jslib/jquery-easyui-1.4.1/themes/bootstrap/easyui.css'/>">
	<link rel="stylesheet" type="text/css"
		href="<c:url value='/jslib/jquery-easyui-1.4.1/themes/icon.css'/>">
  </head>
  
  <body class="easyui-Layout" id='divLayout'>
<!--  	<div data-options="region:'north',title:'North Title',split:true" style="height:100px;"></div>   --> 
 <!--    <div data-options="region:'south',title:'South Title',split:true" style="height:100px;"></div>   
    <div data-options="region:'east',iconCls:'icon-reload',title:'East',split:true" style="width:100px;"></div>    -->
    <div data-options="region:'west',title:'菜单',split:true" style="width:100px;">
    	<ul class="easyui-tree">
			<li><span>景点管理</span>
				<ul>
					<li><a href="#"  onclick="addTabs('景点列表','viewticket_views.jsp')"><span>景点列表</span></a></li>
				</ul>
			</li>
			<li><span>门票管理</span>
			</li>
		</ul>
    </div>   
    <div data-options="region:'center'" style="padding:5px;background:#eee;">
    	<div id="main" class="easyui-tabs" style="width: 100%; hegith: 30px;"
			data-options="fit:true">
			<div title="后台管理首页" iconCls="icon-reload">
				<iframe src="#" width="100%" height="100%" style="border:none"> </iframe>
			</div>
		</div>
    </div>   
  </body>
  <script type="text/javascript"
	src="<c:url value='/jslib/jquery-easyui-1.4.1/jquery.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/jslib/jquery-easyui-1.4.1/jquery.easyui.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/jslib/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js'/>"></script>
<script type="text/javascript">
function addTabs(title, url) {
	if ($('#main').tabs('exists', title)) {
		$('#main').tabs('select', title);
	} else {
		var content = '<iframe src="' + url
				+ '" width="100%" height="100%" style="border:none"></iframe>'
		$('#main').tabs('add', {
			title : title,
			content : content,
			closable : true,
			iconCls : "icon-help"
		});
	}
}
</script>
</html>
