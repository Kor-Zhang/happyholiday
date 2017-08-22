
$(function() {
	
	//选择左边导航 选中事件
	selectNav = function(self) {
		var length = $(".list-group a").length;
		$(".list-group-item").removeClass("checked");
		$(self).addClass("checked");
	}
	
	//iframe加载 自动适应高度
	$("#iframepage").load(function() {
		$(this).height($(this).contents().find("#content").height() + 40);
	});

	$("#oldPassword").bind("blur", function() {
			if ($(this).val() == '') {
				$("#password_Tips1").html("<font color='red'>请输入原密码</font>");
			} else {
				$("#password_Tips1").html("");
			}
		})
		/**
		 * 密码强度事件
		 */
	$("#newPassword").keyup(function() {
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

			} else {
				$("#password_Tips2").removeClass('strong');
				$("#password_Tips2").removeClass('medium');
				$("#password_Tips2").removeClass('enough');
				$("#password_Tips2").addClass('enough');
			}
			return true;
		})
		/**
		 * 修改密码按钮事件
		 */
	$("#frmChangePwd").submit(function() {
		if ($("#oldPassword").val() == "") {
			$("#password_Tips1").html("<font color='red'>请输入原密码</font>");
			return false;
		}
		if ($("#newPassword").val() == "") {
			$("#password_Tips2").html("<font color='red'>请输入新密码</font>");
			return false;
		}
		if ($("#newPassword").val().length < 6) {
			$("#password_Tips2").html("<font color='red'>密码长度最少6位</font>");
			return false;
		}

		if ($("#newPasswordAgain").val() == "") {
			$("#password_Tips3").html("<font color='red'>请确认新密码</font>");
			return false;
		}
		if ($('#newPassword').val() != $("#newPasswordAgain").val()) {
			$("#password_Tips3").html("<font color='red'>两次密码不一致</font>");
			return false;
		}
	})
});

