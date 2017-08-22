<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table id="viewImgs">
	
</table>
<script>
	$(function(){
		 $("#viewImgs").datagrid({
		url :'${pageContext.request.contextPath}/viewsAction!getViewImgsDatagridById.action?id='+currentCheckViewId,
		pagination:true,
		fit:true,
		idField:'id',
		sortName:'id',
		sortOrder:'desc',
		multiSort:false,
		/* remoteSort:true, */
		columns:[[
		{
			field : 'id',
			hidden:true
		},{
			field : 'imgName',
			title : '图片',
			width:200,
			height:150,
			formatter: function(value,row,index){
				var viewImg = "<span style='width:200px;height:150px'><img style='width:200px;height:150px' src='${pageContext.request.contextPath}/viewsAction!getViewImgsByImgName.action?imgName="+value+"&t="+new Date().getTime()+"'/></span>";
				return viewImg;
			}
		},{
			field : 'main',
			title : '主要图片',
			width:200,
			formatter: function(value,row,index){
				if(value){
					return "<font style='color:green;'>是</font>";
				}
				return "<font style='color:red;'>否</font>";
			}
		}] ]
		});
	
	})
</script>