var reg = "^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$"; //手机正则表达式
var countdown = 60; //短信验证倒计时
$(function(){
	$("#getWord").removeAttr('disabled');
	$("#phone").bind("blur", function() {
			if ($(this).val() == '') {
				$("#phone_Tips").html("请输入手机号码");
			} else {
				$("#phone_Tips").html("");
			}
		})
		//验证码

	$("#word").bind("blur", function() {
			if ($(this).val() == '') {
				$("#word_Tips").html("请输入短信动态码");
			} else {
				$("#word_Tips").html("");
			}
		})
	
	/**
	 * 短信验证倒计时
	 * @param {Object} obj
	 */
	function settime(obj) {
		if (countdown == 0) {
			obj.removeAttribute("disabled");
			obj.value = "获取手机动态码";
			$("#word_Tips").html("");
			countdown = 60;
			return;
		} else {
			obj.setAttribute("disabled", true);
			obj.value = "重新发送(" + countdown + ")";
			countdown--;
		}
		setTimeout(function() {
			settime(obj)
		}, 1000)
	}
	$("#getWord").bind('click', function() {
		var tel = $("#phone").val();
		var time = 20;
		var reg = "^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
		var data = {
				"mobie":tel,
		}
		
		if ($("#phone").val() == '') {
			$("#phone_Tips").html("请输入手机号码");
			return false;
		}
		if ($("#phone").val() != '') {
			$("#phone_Tips").html("");
			if (tel.match(reg)) {
				$("#word_Tips").html("验证码已经发送");
				settime(this);
				$.ajax({
					type:'post',
					data:data,
					dataType:'json',
					url :  getWebProjectName() + '/frontUsersAction!getSMS.action',
				});
			} else {
				$("#phone_Tips").html("手机号格式不正确");
				phone_flag = false;
			}
		}
	})
	$("#newPassword").keyup(function(){
		var strongRegex = new RegExp("^(?=.{14,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g"); 
		var mediumRegex = new RegExp("^(?=.{10,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g"); 
		var enoughRegex = new RegExp("(?=.{6,}).*", "g"); 
		if (false == enoughRegex.test($(this).val())) {
					$("#password_Tips2").html("<span class='safe_1'>弱</span><span class='safe_1'>中</span><span class='safe_1'>强");
					$("#password_Tips2").removeClass('strong');
					$("#password_Tips2").removeClass('medium');
					$("#password_Tips2").removeClass('enough');
					$("#password_Tips2").addClass('default');	
				} else if (strongRegex.test($(this).val())) {
					$("#password_Tips2").removeClass('medium');
					$("#password_Tips2").removeClass('enough');
					$("#password_Tips2").removeClass('strong');
					$("#password_Tips2").addClass('strong');
					
				} else if (mediumRegex.test($(this).val())) {
					$("#password_Tips2").removeClass('strong');
					$("#password_Tips2").removeClass('enough');
					$("#password_Tips2").removeClass('medium');
					$("#password_Tips2").addClass('medium');
						
				}else{
					$("#password_Tips2").removeClass('strong');
					$("#password_Tips2").removeClass('medium');
					$("#password_Tips2").removeClass('enough');
					$("#password_Tips2").addClass('enough');	
				}
				return true;
	})
	
	$('#frmPwd').submit(function(){
		var tel = $("#phone").val();
		if($("#phone").val()==''){
			$("#phone_Tips").html("请输入手机号码");
			return false;
		}else{
			if (!tel.match(reg)) {
				$("#phone_Tips").html("手机号格式不正确");
				return false;
			}
			if($("#word").val()==""){
				$("#word_Tips").html("请输入短信动态码");
				return false;
			}	
		}
		if ($("#newPassword").val() == "") {
			$("#password_Tips2").html("<font color='red'>请输入新密码</font>");
			return false;
		}
		if ($("#newPassword").val().length<6) {
			$("#password_Tips2").html("<font color='red'>密码长度最少6位</font>");
			return false;
		}

		if ($("#newPasswordAgain").val() == "") {
			$("#password_Tips3").html("<font color='red'>请确认新密码</font>");
			return false;
		}
		if($('#newPassword').val()!=$("#newPasswordAgain").val()){
			$("#password_Tips3").html("<font color='red'>两次密码不一致</font>");
			return false;
		}
	})
})
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