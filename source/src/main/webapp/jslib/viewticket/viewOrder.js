var pattern = "[\u4E00-\u9FA5]{2,4}"; //名字正则表达式
var reg = "^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$"; //手机正则表达式
var realName_flag = undefined;
var phone_flag = undefined;
$(function(){
	/*********************前台JS判断事件***************************/
	/*门票  数量 加*/
	$('.num-add').bind('click',function(){
		var value = $('.num-input').val();
		if(value>=1&&value<99){
			value= value*1 + 1; 
			$('.num-input').val(value);	
		}
		if(value==99){
			$('.num-add').addClass('disabled')
		}
		if(value>1){
			$('.num-cut').removeClass('disabled')
		}
		totalPrice(value)
	})
	/*门票 数量 减*/
	$('.num-cut').bind('click',function(){
		var value = $('.num-input').val();
		if(value<=99&&value>1){
			value= value*1 - 1; 
			$('.num-input').val(value);
			$('.num-add').removeClass('disabled')
		}
		if(value==1){
			$('.num-cut').addClass('disabled')
		}
		totalPrice(value)
	})
	/*门票数量框 变动事件*/
	$('.num-input').bind('keyup',function(){
		var reg = new RegExp("^[0-9]*$");  
		var value = $(this).val();
		//如果没有清空
		if(value!=''){
			changeDisable(value)
			//改变两个按钮
			if(value<1||value>99){
				$(this).val(1);
				changeDisable(1)
				totalPrice(1)
				return true;
			}
			if(!reg.test(value)&&value!=''){
	       		$(this).val(1);
	       		changeDisable(1)
	       		totalPrice(1);
	       		return true;
	    	} 
	    	totalPrice(value)
		}
	})
	$('.num-input').bind('change',function(){
			var value = $(this).val();
			if(value==''){
				$(this).val(1);
				totalPrice(1)	
			}
	});
	/*取票人信息判断*/
	$('#realName').bind('keyup',function(){
		var value = $(this).val();
		if(value == ''){
			$('#realName-tips').html('姓名不能为空');
			realName_flag = false;
		}else{
			if(value.match(pattern)) {
				$("#realName-tips").html("");
				realName_flag = true;
			} else {
				$("#realName-tips").html("名字必须是汉字");
				realName_flag = false;
			}
		}
	})
	$('#phone').bind('keyup',function(){
		var value = $(this).val();
		if(value == ''){
			$('#phone-tips').html('手机号不能为空');
			phone_flag = false;
		}else{
			if(value.match(reg)) {
				$("#phone-tips").html("");
				phone_flag = true;
			} else {
				$("#phone-tips").html("手机号格式不正确");
				phone_flag = false;
			}
		}
	})
	/****************    后台AJAX事件    **********************/
	/*支付提交事件*/
	$('#onlinePay').bind('click',function(){
		var time = $('#datetimepicker').val();
		var realName = $('#realName').val();
		var phone = $('#phone').val();
		var ticketId = $("#ticketId").html();
		var price = $(".singlePrice").html();
		var totalPrice = $(".totalPrice").html();
		var number = $("#number").val();
		
		var cbk = document.getElementById('agree');
		if(!cbk.checked){
			$("#agree-tips").html("请同意服务条款")
			return false;
		}
		$("#agree-tips").html("");
		//检验值
		if(checkTime(time)&&checkName(realName)&&checkPhone(phone)){
			var data ={
				travelTime:time,
				getTicketName:realName,
				getTicketPhone:phone,
				ticketId:ticketId,
				price:price,
				totalPrice:totalPrice,
				number:number,
			}
			console.info(data);	
			/*执行后台操作*/
			 $.ajax({
				 type:"post",
				 datatype:'json',
				 data:data,
				 url : getWebProjectName() + '/frontViewOrderAction!addTicket.action',
				 success:function(data){
					
				 }
			 });
			
			
		}
	})
})

/*计算总价*/
function totalPrice(value){
	var  price = $('.singlePrice').html();
	price =price * value * 1;
	$('.totalPrice').html(price);
}
function changeDisable(value){
	if(value==1){
		$('.num-cut').addClass('disabled')
	}
	if(value>1){
		$('.num-cut').removeClass('disabled')
	}
	if(value<=99&&value>1){
		$('.num-add').removeClass('disabled')
	}
	if(value==99){
		$('.num-add').addClass('disabled')
	}
}

/*提交订单时的 检验*/
function checkTime(value){
	if(value==''){
		$('#datetimepicker').focus();
		return false;
	}else{
		return true;
	}
}
function checkName(value){
	if(value==''){
		$('#realName-tips').html('姓名不能为空');
		$("#realName").focus();
		return false;
	}
	if(realName_flag!=true){
		return false;
	}else{
		return true;
	}
}
function checkPhone(value){
	if(value==''){
		$('#phone-tips').html('手机号不能为空');
		$("#phone").focus();
		return false;
	}
	if(phone_flag!=true){
		return  false;
	}else{
		return true;
	}
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
