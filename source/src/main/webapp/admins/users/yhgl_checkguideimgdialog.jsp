<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="easyui-panel" data-options="fit:true,border:false">
	<img id="admins_yhgl_checkguideimg_img"
		style="width:380px;height:400px;" src="" /> <a
		class="easyui-linkbutton" href="javascript:void(0);"
		data-options="onClick:function(){
        	zkAjax('/usersAction!confirmGuideRole.action?id='+yhglCheckGuideImgUserId,function(data){
			showMsg(data);
			try{
				isOnline(data);
			}catch(e){
				openLoginDialog();
				return;
			}
			if(data.success){
				yhglDatagrid.datagrid('reload');
				yhglCheckguideimgDialog.dialog('close');
			}
		});
        			  }">认证成功</a>

	<a class="easyui-linkbutton" href="javascript:void(0);"
		data-options="onClick:function(){
		zkAjax('/usersAction!refuseGuideRole.action?id='+yhglCheckGuideImgUserId,function(data){
			showMsg(data);
			try{
				isOnline(data);
			}catch(e){
				openLoginDialog();
				return;
			}
			if(data.success){
				yhglDatagrid.datagrid('reload');
				yhglCheckguideimgDialog.dialog('close');
			}
		});
			
        			  }">拒绝认证</a>
</div>




<script type="text/javascript" src="<c:url value='/jslib/zkutil.js'/>"></script>
<script type="text/javascript">
	var guideImg = undefined;
	
	$(function($) {
		//检测用户是否在线，然后加载图片
		zkAjax("/adminsAction!isAdminOnline.action",function(data){
			var online = data.online;
			//如果在线
			if(online==false){
				yhglCheckguideimgDialog.dialog('close');
				//不在线，显示登陆dialog
				openLoginDialog();
				//显示提示信息
				showMsg(data);
				
			}else{
				//加载导游证图片
				guideImg = $("#admins_yhgl_checkguideimg_img").attr('src',
				'${pageContext.request.contextPath}/usersAction!getGuideImgByUserId.action?id='+yhglCheckGuideImgUserId);;
			}
			
		});
		
		
	});
	
</script>


