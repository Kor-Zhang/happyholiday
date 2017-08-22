$(function(){

	var pattern = "[\u4E00-\u9FA5]{2,4}"; //名字正则表达式
	var user = getUserInfo();
	
	$("#change").bind('click',function(){
		//发送请求获取 证件下拉框数据
	    var clazz = getCardClazz();
	    console.info(clazz)
		
		$("#userName-content").html("<input name='userName' id='userName' type='text' class='form-control' placeholder='请输入昵称'/> ");
		if(user.userName!="null"){
			$("#userName").val(user.userName);	
		}
		$("#realName-content").html("<input name='realName' id='realName' type='text' class='form-control' placeholder='请输入真实姓名'/>");
		$("#realName").val(user.realName);
		$("#cardClazz-content").html("<select class='form-control' name='cardClazz' id='cardClazz'>+'<option onselect='true' value=''>请选择</option>'+</selcet>");
		
		//加载数据库里面的 证件结点
		for(var i =0;i<clazz.length;i++){
			$("#cardClazz").append("<option value="+clazz[i].text+">"+clazz[i].text+"</option>");
		}
		
		if(user.cardClazz!="null"){
			$("#cardClazz").val(user.cardClazz)
		}
		$("#cardNumber-content").html("<input name='cardNumber' id='cardNumber' type='text' class='form-control' placeholder='请输入证件号'/>");
		if(user.cardNumber!="null"){
			$("#cardNumber").val(user.cardNumber);	
		}
		$("#change").css('display', 'none');
		$("#save").css('display', 'block');
		//表单事件
		outFocus();
	});
	
	
	$("#save").click(function(){
		if ($("#userName").val() == '') {
			$("#userName_Tips").html("<font color='red'>请输入昵称</font>");
			return false;
		}
		if ($("#realName").val() == '') {
			$("#realName_Tips").html("<font color='red'>请输入真实姓名</font>");
			return false;
		}else{
			if (!$("#realName").val().match(pattern)) {
				$("#realName_Tips").html("<font color='red'>名字必须是汉字</font>");
				return false;
			}
		}
		if ($('#cardClazz').val() == '') {
			$("#cardClazz_Tips").html("<font color='red'>请选择证件类型</font>");
			return false;
		}
		if ($('#cardNumber').val() == '') {
			$("#cardNumber_Tips").html("<font color='red'>请输入证件号</font>");
			return false;
		} 
		var data ={
			"userName":$("#userName").val(),
			"realName":$("#realName").val(),
			"cardClazz":$("#cardClazz").val(),
			"cardNumber":$("#cardNumber").val()
		}
		$.ajax({
			type:'post',
			url : getWebProjectName() + '/frontUsersAction!updateInfo.action',
			dataType:'json',
			data:data,
			async : false,
			success : function(data) {
				window.location.href=getWebProjectName()+"/users/personal_success.jsp";
			}
		});
	})
	
});


function outFocus(){
	$("#realName").bind("blur", function() {
		if ($(this).val() == '') {
			$("#realName_Tips").html("<font color='red'>请输入真实姓名</font>");
		} else {
			if ($(this).val().match(pattern)) {
				$("#realName_Tips").html("");
			} else {
				$("#realName_Tips").html("<font color='red'>名字必须是汉字</font>");
			}

		}
	})
	$("#userName").bind("blur", function() {
		if ($(this).val() == '') {
			$("#userName_Tips").html("<font color='red'>请输入昵称</font>");
		} else {
			$("#userName_Tips").html("");
		}
	})
	$("#cardClazz").bind("blur", function() {
		if ($(this).val() == '') {
			$("#cardClazz_Tips").html("<font color='red'>请选择证件类型</font>");
		} else {
			$("#cardClazz_Tips").html("");
		}
	})
}

/**
 * 从数据库里面 读取用户信息
 * @returns 返回用户信息
 */
function getUserInfo(){
	var d = undefined;
	$.ajax({
		url : getWebProjectName() + '/frontUsersAction!getUserInfo.action',
		dataType:'json',
		async : false,
		success : function(data) {
			data = JSON.parse(data);
			d = data;
		}
	});
	return d;
	
}	
function getCardClazz(){
	var d = undefined;
	$.ajax({
		url : getWebProjectName() + '//frontSystemddlAction!getSystemddlByParentId.action?id='+4,
		dataType:'json',
		async : false,
		success : function(data) {
			
			d = data;
		}
	});
	return d;
}

/**
 * 得到当前项目名称
 */
function getWebProjectName(){
	var webProjectName = undefined;
	//获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
    var pathName=window.document.location.pathname;
	//获取带"/"的项目名，如：/uimcardprj
    webProjectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    
	return webProjectName;
}