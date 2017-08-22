$(function(){
	//动态加载 下拉框
	getCity();
	//初始化样式
	InitStyle();
	
	//搜索事件
	$("#search").bind('click',function(){
		getData(1,"");
	});
	getCostInfo();
});


/**
 * 初始化样式
 */
function InitStyle(){
	//汽车车型  不限的图标样式
	var iconSpan = $(".chexing li").eq(0).children('a').children('span').eq(0);
	var iconSpanX = iconSpan.css("background-position").split(" ")[0];
	iconSpan.css("background-position", iconSpanX + " -41px");
}

/**
 * 选择改变样式
 */
selectType = function(self) {

		var index = $(self).index() + 1;
		var length = $(".chexing li").length;
		var data = undefined;

		if (index == 1) {
			$(self).siblings().children('a').removeClass("checked");
			$(self).children('a').addClass("checked");
		} else {
			if (!$(self).children('a').hasClass('checked')) {
				$(self).siblings().children('a').removeClass("checked");
				$(self).children('a').addClass("checked");
			} else {
				$($(self).siblings()[0]).children('a').addClass("checked");
				$(self).children('a').removeClass("checked");
			}
		}
		//存入JSON数据
		for (var i = 0; i < length; i++) {
			if ($(".chexing li").eq(i).children('a').hasClass('checked')) {
				var iconSpan = $(".chexing li").eq(i).children('a').children('span').eq(0);
				var iconSpanX = iconSpan.css("background-position").split(" ")[0];
				iconSpan.css("background-position", iconSpanX + " -41px");
			} else {
				var iconSpan = $(".chexing li").eq(i).children('a').children('span').eq(0);
				var iconSpanX = iconSpan.css("background-position").split(" ")[0];
				iconSpan.css("background-position", iconSpanX + " -14px");
			}
		}
		getData(1,"");
}
selectPrice = function(self) {
		var index = $(self).index() + 1;
		var length = $(".price-range li").length;
		var data = undefined;
		//如果是第一个价格
		if (index == 1) {
			$(".price-num li").siblings().removeClass("checked");
			$(".price-num li").eq(index-1).addClass("checked");
			$(self).siblings().removeClass("checked");
			$(self).addClass("checked");
		} else {
			//如果没有被选择，则选中
			if (!$(self).hasClass("checked")) {
				$(".price-num li").siblings().removeClass("checked");
				$(".price-num li").eq(index-1).addClass("checked");
				$(".price-num li").eq(index).addClass("checked");
				$($(self).siblings()).removeClass("checked");
				$(self).addClass("checked");
			} else { //如果选择了，则取消选中
				$(".price-num li").siblings().removeClass("checked");
				$(".price-num li").eq(0).addClass("checked");
				$(self).removeClass("checked");
				$($(self).siblings()[0]).addClass("checked");
			}
		}
		getData(1,"");
}
selectBrand = function(self) {
		var index = $(self).index() + 1;
		var length = $(".car-brand li").length;
		var data = undefined;
		//如果是 不限
		if (index == 1) {
			$(self).siblings().removeClass("checked");
			$(self).addClass("checked");
		} else {
			//如果没有被选中
			if (!$(self).hasClass("checked")) {
				$($(self).siblings()).removeClass("checked");
				$(self).addClass("checked");
			} else {
				$(self).removeClass("checked");
			}
		}
		if (!$(".car-brand li").hasClass("checked")) {
			$($(self).siblings()[0]).addClass("checked");
		}
		getData(1,"");
}


/**
 * 分页 及 后台操作
 */
function page(totalRecords){
	var total = Math.ceil(totalRecords/10);
	kkpager.generPageHtml({
    pno : 1,
    mode : 'click', //设置为click模式
    //总页码  
    total : total,  
    //总数据条数  
    totalRecords : totalRecords,
    //点击页码、页码输入框跳转、以及首页、下一页等按钮都会调用click
    //适用于不刷新页面，比如ajax
    click : function(n){
        //这里可以做自已的处理
        //...
        //处理完后可以手动条用selectPage进行页码选中切换
    	getData(n,"");
        this.selectPage(n);
    },
    //getHref是在click模式下链接算法，一般不需要配置，默认代码如下
    getHref : function(n){

        return '#';
    }
   },true);
}

/***************动态加载车型和品牌*****************/
$(function(){
	var id =3;
	zkAjax("/frontSystemddlAction!getSystemddlByParentId.action?id="+id,function(data){
		//添加数据到addressSelect
		var rows = data;
		var parentDom = $('.chexing');
		for (var i = 0; i < rows.length; i++) {
			parentDom.append(
				"<li onclick='selectType(this)'><a class=''> <span class='car-img car-type-img car-img-"+(i+1)+"'></span> <span class='cartxt'>"+rows[i].text+"</span></a></li>"		
			);
		}
		 
	});
	id = 2;
	zkAjax("/frontSystemddlAction!getSystemddlByParentId.action?id="+id,function(data){
		//添加数据到addressSelect
		var rows = data;
		var parentDom = $('.car-brand');
		for (var i = 0; i < rows.length; i++) {
			parentDom.append(
				"<li onclick='selectBrand(this)'><a class=''>"+rows[i].text+"</a></li>"		
			);
		}
		
	});

})


/*******************************联级加载国家，省，市，县，店面**********************************/
var nationSelect = undefined;
var provinceSelect = undefined;
var citySelect = undefined;
var countySelect = undefined;
var storeSelect = undefined;
var address  = "湖南";
var currentI = undefined;
function loadSelect(){
	nationSelect = $("select[name=getCarNation]").hide();
	provinceSelect = $("select[name=getCarProvince]").hide();
	citySelect = $("select[name=getCarCity]").hide();
	countySelect = $("select[name=getCarCounty]").hide();
	storeSelect = $("select[name=getCarStore]").hide();
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
		showStoreAddress(rows[0].id);
		
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
        	//获取数据
        	getData(1,address);
        } else {
        	$(".city-present span").html(remote_ip_info.province+"<i></i>");
        }
    });
	
}

/**获取数据*/
function getData(page,address){
	//添加属性即可
	var type = $(".chexing .checked .cartxt").html();
	var lowPrice = $(".price-num .checked").eq(0).html();
	var highPrice = $(".price-num .checked").eq(1).html();
	var carBd = $(".car-brand .checked").children('a').html();
	var fromAddress = undefined;

	if($("#getCarNation").val()!=null){
		fromAddress =$("#getCarNation").val();
	}
	if($("#getCarProvince").val()!=null){
		fromAddress=fromAddress+"/"+$("#getCarProvince").val();
	}
	if($("#getCarCity").val()!=null){
		fromAddress=fromAddress+"/"+$("#getCarCity").val();
	}
	if($("#getCarCounty").val()!=null){
		fromAddress=fromAddress+"/"+$("#getCarCounty").val();
	}
	if($("#getCarStore").val()!=null){
		fromAddress=fromAddress+"/"+$("#getCarStore").val();
	}
	if(fromAddress==undefined){
		fromAddress= address;
	}
	
	if(highPrice == undefined){
		highPrice = "-1";
		lowPrice = "-1"	;
	}
	if(highPrice =="500+"){
		highPrice =lowPrice;
	}
	var dataJson = {
		"rows" :10,
		"page" :page,
		"type":type,
		"lowPrice":lowPrice,
		"highPrice":highPrice,
		"carBd":carBd,
		"Address":fromAddress
	};
	console.info(dataJson);
	getCarsInfo(dataJson);
	getCarsSize(dataJson);
}

function getCarsInfo(data){
	$.ajax({
		type:'post',
		url : getWebProjectName() + '/frontCarsAction!selectCarsInfo.action',
		dataType:'json',
		data:data,
		success : function(data) {
			data = $.parseJSON(data);
			console.info(data);
			//每次刷新清零
			$(".carList").html("");
			if(data.total==0){
				$(".carList").html("<font color='darkgrey'>未找到该车型!请选择其他车型</font>");
			}else{
				
				for(var i =0;i<data.total;i++){
					$(".carList").append("<tr id='car'"+i+">"+
											"<td class='car-picture'>"+
												"<img src='"+getWebProjectName() + "/frontCarsAction!getCarsImg.action?mainImgName="+data.rows[i].mainImgName+"',' alt='"+data.rows[i].seatType+" | "+data.rows[i].drivingMode+" | "+data.rows[i].seatNumber+"' height='130' width='230' />"+
											"</td>"+
											"<td class='car-info'>"+
												"<p class='name'>"+data.rows[i].carBd+"</p>"+
												"<p class='other'>"+data.rows[i].seatType+" | "+data.rows[i].drivingMode+" | "+data.rows[i].seatNumber+"</p>"+
												"<div class='car-tips'>"+
													"<i class='tip car-remen'>热门车</i>"+
													"<i class='tip car-xin'>新车型</i>"+
												"</div>"+
											"</td>"+
											"<td class='order'>"+
												"<div class='order-box'>"+
													"<div class='order-price'>"+
														"<div class='houfu'></div>"+
														"<div class='car-price' style='z-index: 1;'>"+
															"<span class='total'>"+
																"<em class='rmb' style='color: #fabe00;'>¥</em>"+
																"<em class='num' style='color: #fabe00;'>"+data.rows[i].price+"</em>"+
																"<em class='unit'>/日均</em>"+
															"</span>"+
															"<div class='floatleft price-all'>"+
																"<em class='no-account-total'>导游价：</em>"+
																"<em class='rmb'>¥</em>"+
																"<em class='num'>"+data.rows[i].guidePrice+"</em>"+
															"</div>"+
														"</div>"+
													"</div>"+
													"<a href="+getWebProjectName() + "/frontCarsAction!getCarInfo.action?id="+data.rows[i].id+" id="+data.rows[i].id+" class='order-button'>详情</a>"+
												"</div>"+
											"</td>"+
										"</tr>");
				}
				
			}
		}
	});
}
function getCarsSize(data){
	$.ajax({
		type:'post',
		url : getWebProjectName() + '/frontCarsAction!selectCarsSize.action',
		dataType:'json',
		data:data,
		success : function(data) {
			data = $.parseJSON(data);
			console.info(data);
			if(data.total!=0){
				$("#kkpager").css('display','block');
				page(data.total);
			}else{
				$("#kkpager").css('display','none');
			}
		}
	});
}

/**提前加载下一个页面的 cost信息**/
function getCostInfo(){
	$.ajax({
		url : getWebProjectName() + '/frontCarCostAction!getCostInfo.action',
		type:'post',
	});
}
