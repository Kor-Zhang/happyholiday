var pattern = "[\u4E00-\u9FA5]{2,4}"; //名字正则表达式
var reg = "^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$"; //手机正则表达式
var realName_flag = undefined;
var phone_flag = undefined;
$(function(){
	//初始化
	InitStyle();
	//动态加载 下拉框
	getCity();
	
	
	//取车日期和换车日期控件  触发改动 租期事件
	$('#getCarTime').datetimepicker({
		lang:'ch',
	  	timepicker: true,
		format:'Y-m-d H:i:s',
		minDate: '-1970/01/01',
		onClose:calRentDay
	});
	$('#backCarTime').datetimepicker({
		lang:'ch',
	  	timepicker: true,
		format:'Y-m-d H:i:s',
		minDate: '-1970/01/01',
		onClose:calRentDay
	});
	$('#geticon').bind('click',function(){
		$('#getCarTime').focus();
	})
	$('#backicon').bind('click',function(){
		$('#backCarTime').focus();
	})
	
	//填写取车人信息的 判断事件
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
	/*****************下订单**********************/
	$("#subOrder").bind("click",function(){
		//收集数据 进行封装
		var carId = $("#carId").html();
		var getTime = $('#getCarTime').val();
		var backTime = $("#backCarTime").val();
		var totalPrice = $("#SumPrice").html();
		var carPrice   = $("#carPrice").html();
		var realName = $('#realName').val();
		var phone = $('#phone').val();
		var rentDay  = $("#rentDay").html();
		var getAddress = $("#getCarAddress").html();
		var backAddress  = getAddress;
		if($("#backCarNation").val()!=null){
			backAddress =$("#backCarNation").val();
		}
		if($("#backCarProvince").val()!=null){
			backAddress=backAddress+"/"+$("#backCarProvince").val();
		}
		if($("#backCarCity").val()!=null){
			backAddress=backAddress+"/"+$("#backCarCity").val();
		}
		if($("#backCarCounty").val()!=null){
			backAddress=backAddress+"/"+$("#backCarCounty").val();
		}
		if($("#backCarStore").val()!=null){
			backAddress=backAddress+"/"+$("#backCarStore").val();
		}
		if(backAddress==undefined){
			backAddress= address;
		}
		var order = {
				"carId":carId,
				"getCarAddress":getAddress,
				"returnCarAddress":backAddress,
				"totalPrice":totalPrice,
				"rentDayNumber":rentDay,
				"carPrice":carPrice,
				getCarTime:getTime,
				returnCarTime:backTime,
		}
		console.info(order)
		if(checkGetTime(getTime)&&checkBackTime(backTime)&&checkName(realName)&&checkPhone(phone)){
			$.ajax({
				url : getWebProjectName() + '/frontCarOrderAction!saveOrder.action',
				dataType:'json',
				data:order,
				type:'post',
				success : function(data) {
					data = JSON.parse(data);
					saveCost(data.orderId);
					if(data.status==1){
						window.location.href=getWebProjectName()+'/cars/car-order-success.jsp'
					}
				}
			});
		}
		
	})
})
/*******下订单的同时 保存订单的费用信息****/
function saveCost(Id){
	var length = $("#length").html();
	for(var i =0;i<length;i++){
		var orderId = Id;
		var costId = $("#costId"+i).html();
		var price = $("#costPrice"+i).html();
		var number = $("#rentDay").html();
		var data = {
				orderId:orderId,
				costId:costId,
				price:price,
				number:number,
		}
		console.info(data)
		$.ajax({
			url : getWebProjectName() + '/frontRentCarCostAction!saveCarCost.action',
			dataType:'json',
			data:data,
			type:'post',
		});
	}	
}

/**打开基本保险费提示*/
openTip = function(self) {
		$(self).children(".float-box").css("display", "inline-block");
	}
	/**关闭基本保险费提示*/
closeTip = function(self) {
	$(self).children(".float-box").css("display", "none");
}
/********************日期计算天数******************************/
function DateDiff(dt1,dt2) {  
 	var hours  = getHoursDiff(dt1,dt2); //计算相差多少小时
 	var iDays = 0;
 	if(hours<24){ //不满一天按照一天计算天数
 		iDays = 1;  
 	}else{
 		iDays = parseInt(hours/24);  //获取整数天数 
 		ihours = hours%24; //获取剩余的小时
 	/*	console.info("剩余小时"+ihours)*/
 	}
    return iDays;  //返回相差天数
}
function getHoursDiff(dt1,dt2){
	var startDate= new Date(dt1); 
	var endDate= new Date(dt2); 
	var df=(endDate.getTime()-startDate.getTime()); 
	return df/3600000;
}
function calRentDay(){
    //判断开始时间和结束时间
    var strStartTime = $("#getCarTime").val(); 
    var endTime = $("#backCarTime").val();
    //获取汽车价格
    var carPrice = $("#carPrice").html();
    console.info(strStartTime+" "+endTime+" "+carPrice)
    if (strStartTime == "" || endTime == "") {
        $("#rentDay").html(0);
        $("#totalPrice").html(0*carPrice);
    }else{
		var startNum = parseInt(strStartTime.replace(/-/g, ''), 10);
	    var endNum = parseInt(endTime.replace(/-/g, ''), 10);
	    console.info("开始天数"+startNum+" "+endNum)
	 	if (startNum > endNum) {
	       alert("结束时间不能在开始时间之前！");
	       $("#rentDay").html(0);
	       $("#totalPrice").html(0*carPrice);
	    }else {
	        $("#rentDay").html(DateDiff(strStartTime, endTime));
	        $("#totalPrice").html(DateDiff(strStartTime, endTime)*carPrice);
	        $("#price0").html(DateDiff(strStartTime, endTime)*carPrice);
	        $("#jcPrice0").html(carPrice+"*"+DateDiff(strStartTime, endTime));
	        SumPrice();
	    }
    }
    
}

/********下订单的验证*********/
function checkGetTime(value){
	if(value==''){
		$("#getCarTime").focus();
		return false;
	}else{
		return true;
	}
}
function checkBackTime(value){
	if(value==''){
		$("#backCarTime").focus();
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

function InitStyle(){
	//计算价格
	SumPrice();
	//汽车轮播JS控件布局
	$('#car-imgs').slideBox({
				duration: 0.3, //滚动持续时间，单位：秒
				easing: 'linear', //swing,linear//滚动特效
				delay: 5, //滚动延迟时间，单位：秒
				hideClickBar: false, //不自动隐藏点选按键
				clickBarRadius: 1,
	});
}

function SumPrice(){
	//获取租车价格;
	var price = 0;
	var length = $("#length").html()*1+2;
	for(var i =0;i<length;i++){
		price +=$("#price"+i).html()*1;
	}
	$("#SumPrice").html(price);
}


/*******************************联级加载国家，省，市，县，店面**********************************/
var nationSelect = undefined;
var provinceSelect = undefined;
var citySelect = undefined;
var countySelect = undefined;
var storeSelect = undefined;
var address  = "湖南";
var currentI = undefined;
function loadSelect(){
	nationSelect = $("select[name=backCarNation]").hide();
	provinceSelect = $("select[name=backCarProvince]").hide();
	citySelect = $("select[name=backCarCity]").hide();
	countySelect = $("select[name=backCarCounty]").hide();
	storeSelect = $("select[name=backCarStore]").hide();
	var id = "1";
	showNation(id);
}
//显示国家信息到select
function showNation(id){
	clearAddressSelect(nationSelect);
	clearAddressSelect(provinceSelect);
	clearAddressSelect(citySelect);
	clearAddressSelect(countySelect);
	clearAddressSelect(storeSelect);
	//远程加载下拉框数据
	zkAjax("/frontSystemddlAction!getSystemddlByParentId.action?id="+id,function(data){
		//添加数据到addressSelect
		var rows = data;
		for (var i = 0; i < rows.length; i++) {
			nationSelect.show();
			nationSelect.append("<option  onClick=showProvinceAddress('"+rows[i].id+"') value="+rows[i].text+">"+rows[i].text+"</option>");
		}
		showProvinceAddress(rows[0].id);
	});
}

//显示省信息到select
function showProvinceAddress(id){
	clearAddressSelect(provinceSelect);
	clearAddressSelect(citySelect);
	clearAddressSelect(countySelect);
	clearAddressSelect(storeSelect);
	//远程加载下拉框数据
	zkAjax("/frontSystemddlAction!getSystemddlByParentId.action?id="+id,function(data){
		//添加数据到Select
		var rows = data;
		for (var i = 0; i < rows.length; i++) {
			provinceSelect.show();
			provinceSelect.append("<option  onClick=showCityAddress('"+rows[i].id+"') value="+rows[i].text+">"+rows[i].text+"</option>");
			if(rows[i].text == address){
				currentI = i;
			}
		}
		provinceSelect.val(rows[currentI].text)
		showCityAddress(rows[currentI].id);
	});
}
//显示市信息到select
function showCityAddress(id){
	clearAddressSelect(citySelect);
	clearAddressSelect(countySelect);
	clearAddressSelect(storeSelect);
	//远程加载下拉框数据
	zkAjax("/frontSystemddlAction!getSystemddlByParentId.action?id="+id,function(data){
		//添加数据到Select
		var rows = data;
		for (var i = 0; i < rows.length; i++) {
			citySelect.show();
			citySelect.append("<option  onClick=showCountyAddress('"+rows[i].id+"') value="+rows[i].text+">"+rows[i].text+"</option>");
		}
		showCountyAddress(rows[0].id);
	});
}
//显示县信息到select
function showCountyAddress(id){
	clearAddressSelect(countySelect);
	clearAddressSelect(storeSelect);
	//远程加载下拉框数据
	zkAjax("/frontSystemddlAction!getSystemddlByParentId.action?id="+id,function(data){
		//添加数据到Select
		var rows = data;
		for (var i = 0; i < rows.length; i++) {
			countySelect.append("<option  onClick=showStoreAddress('"+rows[i].id+"') value="+rows[i].text+">"+rows[i].text+"</option>");
			countySelect.show();
		}
		if(rows.length!=0){
			showStoreAddress(rows[0].id);
		}		
	});
}
//显示店铺信息到select
function showStoreAddress(id){
	clearAddressSelect(storeSelect);
	//远程加载下拉框数据
	zkAjax("/frontSystemddlAction!getSystemddlByParentId.action?id="+id,function(data){
		//添加数据到Select
		var rows = data;
		for (var i = 0; i < rows.length; i++) {
			storeSelect.show();
			storeSelect.append("<option  value="+rows[i].text+">"+rows[i].text+"</option>");
		}
	});
}
//清除select内容，并且影藏
function clearAddressSelect(select){
	select.html("");
	select.hide();
}

/**
 * 根据IP定位
 */
function getCity(){
   	var ip = "118.206.230.215";
	$.getScript('http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js&ip='+ip, function(_result) {
        if (remote_ip_info.ret == '1') {
        	$(".city-present span").html(remote_ip_info.province+"<i></i>");
        	address = remote_ip_info.province;
        	//在加载  下拉框
        	loadSelect();
        } else {
        	$(".city-present span").html(remote_ip_info.province+"<i></i>");
        }
    });
	
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
