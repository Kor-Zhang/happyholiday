var countdown = 60; //短信验证倒计时
var phoneTwo_flag = true;
var word_flag = true;
$(function(){
	//解除 按钮的禁用权限
	$("#getWord").removeAttr('disabled');
	$("#word").bind("blur", function() {
		if ($(this).val() == '') {
			$("#phoneTwo_Tips").html("请输入短信动态码");
			word_flag = false;
		} else {
			$("#phoneTwo_Tips").html("");
			word_flag = true;
		}
	});
	
	//验证码
	$("#getWord").bind('click', function() {
		var tel = $("#phoneTwo").val();
		var time = 20;
		var reg = "^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
		var data = {
				"mobie":tel,
		}
		
		if ($("#phoneTwo").val() == '') {
			$("#phoneTwo_Tips").html("请输入手机号码");
			return false;
		}
		if ($("#phoneTwo").val() != '') {
			$("#phoneTwo_Tips").html("");
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
				$("#phoneTwo_Tips").html("手机号格式不正确");
				phoneTwo_flag = false;
			}
		}

	});
	
	/**
	 * 短信验证倒计时
	 * @param {Object} obj
	 */
	function settime(obj) {
		if (countdown == 0) {
			obj.removeAttribute("disabled");
			obj.value = "获取手机动态码";
			$("#phoneTwo_Tips").html("");
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
	
	
	
	/*提交表单判断事件
	$(".phoneLogin").submit(function() {
		if ($('#phoneTwo').val() == '') {
			$("#phone_Tips").html("手机号不能为空");
			return false;
		}
		if ($('#word').val() == '') {
			$("#phoneTwo_Tips").html("");
			return false;
		}
		if(phoneTwo_flag!=true||word_flag!=true){
			$("#agree_Tips").html("请按照要求填写");
			return false;
		}
		
	})*/
});

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