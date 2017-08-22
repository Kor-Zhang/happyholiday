var realName_flag = true;
var phone_flag = true;
var word_flag = true;
var password_flag = true;
var pattern = "[\u4E00-\u9FA5]{2,4}"; //名字正则表达式
var reg = "^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$"; //手机正则表达式
var countdown = 60; //短信验证倒计时
var time_flag = true;
/*表单检测*/
$(function() {
	
	
	//复选框点击事件
	$("#agree").bind("click",function(){
		if($(this).val()==1){
			$(this).val(0);
		}else{
			$(this).val(1);
		}
	})

	//解除 按钮的禁用权限
	$("#getWord").removeAttr('disabled');
	//姓名
	$("#realName").bind("blur", function() {
			if ($(this).val() == '') {
				$("#realName_Tips").html("请输入真实姓名");
			} else {
				if ($(this).val().match(pattern)) {
					$("#realName_Tips").html("");
					realName_flag = true;
				} else {
					$("#realName_Tips").html("名字必须是汉字");
					realName_flag = false;
				}

			}
		})
		//手机
	$("#phone").bind("blur", function() {
			if ($(this).val() == '') {
				$("#phone_Tips").html("请输入手机号码");
				phone_flag = false;
			} else {
				$("#phone_Tips").html("");
				phone_flag = true;
			}
		})
		//验证码

	$("#word").bind("blur", function() {
			if ($(this).val() == '') {
				$("#word_Tips").html("请输入短信动态码");
				word_flag = false;
			} else {
				$("#word_Tips").html("");
				word_flag = true;
			}
		})
		//密码
	$("#password").bind("input", function() {
		if ($(this).val() == '') {
			$("#password_Tips").html("请输入密码");
		} else {
			if ($(this).val().length < 6) {
				$("#password_Tips").html("密码长度至少6位");
				password_flag = false;
			} else {
				$("#password_Tips").html("");
				password_flag = true;
			}
		}
	})
	//验证码
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
					url :  getWebProjectName() + '/carUsersAction!getSMS.action',
				});
			} else {
				$("#phone_Tips").html("手机号格式不正确");
				phone_flag = false;
			}
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

	/**
	 * 注册时的表单验证
	 */
	$('#frmRegister').submit(function() {
		//全部为空时 不能提交
		if ($('#realName').val() == '') {
			$("#realName_Tips").html("姓名不能为空");
			return false;
		}
		if ($('#password').val() == '') {
			$("#password_Tips").html("密码不能为空");
			return false;
		}
		if ($('#phone').val() == '') {
			$("#phone_Tips").html("手机号不能为空");
			return false;
		}
		if ($('#word').val() == '') {
			$("#word_Tips").html("");
			return false;
		}
		if($('#agree').val()==0){
			$("#agree_Tips").html("请同意服务条款");
			return false;
		}
		if(realName_flag!=true||phone_flag!=true||word_flag!=true||password_flag!=true){
			$("#agree_Tips").html("请按照要求填写");
			return false;
		}
	});
});

function GetRandomNum(Min,Max)
{   
var Range = Max - Min;   
var Rand = Math.random();   
return(Min + Math.round(Rand * Range));   
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