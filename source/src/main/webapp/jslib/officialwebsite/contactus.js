var submitFormBtn = undefined;
var msgForm = undefined;
$(function($){
	submitFormBtn = $('#officialwebsite_contactus_displayArea_sendmsg_form input[type=button]');
	msgForm = $('#officialwebsite_contactus_displayArea_sendmsg_form');
	//提交意见
	submitFormBtn.click(function(){
		//获取提交信息
		var formData = serializeObject(msgForm);
		//验证信息
		//验证邮件
		var email = formData.email;
		var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		if (!filter.test(email)){

			popMsg("请填写正确的邮箱格式");
			return;
		};
		if(formData.personOrOrg==""){
			popMsg("请填写您的姓名/企业");
			return;
		}
		if(formData.msg==""){
			popMsg("请填写您的留言");
			return;
		}
		zkAjaxData("/ow/owContactUsAction!saveContactUsMsg.action",formData,function(data){
			if(data.success){
				msgForm.find('input[type=text]').val("");
				msgForm.find('textarea').val("");
				
				
			}
			//显示信息
			popMsg(data.msg);
		});
	});
});