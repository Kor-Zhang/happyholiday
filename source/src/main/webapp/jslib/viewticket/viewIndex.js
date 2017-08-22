
$(function(){
	/**
	 * 获取city 和下拉列表
	 */
	getCity();
	getCityList()
	/**
	 * 地理位置下拉框事件
	 */
	$(".city-station").bind('click',function(){
		if($(".city-station").hasClass("city-station-on")){
			city_off();
		}else{
			city_on();
		}
	});
	/**
	 * 获取图片轮播的图片
	 */
	getViewCarouselsImg();
	
	
})

function city_on(){
	$(".city-station").addClass("city-station-on");
	$(".city-station .city-box ").css('display','block');
}
function city_off(){
	$(".city-station").removeClass("city-station-on");
	$(".city-station .city-box ").css('display','none');
}

function getViewCarouselsImg(){
	$.ajax({
		type:'post',
		dataType:'json',
		url : getWebProjectName() + '/frontViewCarouselAction!getCarouselInfo.action',
		success : function(data) {
			if(data.success){
				var width= 1200*data.total+"px";
				$(".slideBox").append("<ul class='items'></ul>");
				for(var i=0;i<data.total;i++){
					$(".slideBox .items").append("<li ><a href='#'><img src="+getWebProjectName()+'/frontViewCarouselAction!getCarouselsImg.action?imgName='+data.rows[i].imgName+" width='1200' height='460'></a></li>")
				}
				silde();
			}
		}
	});
	
}

/**
 * 滚动
 */
function silde(){
	$('#demo1').slideBox({
		duration : 0.5,//滚动持续时间，单位：秒
		easing : 'swing',//swing,linear//滚动特效
		delay : 5,//滚动延迟时间，单位：秒
		hideClickBar : false,//不自动隐藏点选按键
		clickBarRadius : 1,
	});
}

/**
 * 根据IP定位
 */
function getCity(){
	var ip = "118.206.230.215";
	$.getScript('http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js&ip='+ip, function(_result) {
        if (remote_ip_info.ret == '1') {
        	$(".city-present span").html(remote_ip_info.province+"<i></i>");
        	showCityView(remote_ip_info.province);
        } else {
        	$(".city-present span").html(remote_ip_info.province+"<i></i>");
        }
    });
	
}

function getCityList(){
	zkAjax("/frontSystemddlAction!getSystemddlByParentId.action?id=5",function(data){
		var rows = data;
		showCityList(rows[0].id);
	});
}

function showCityList(id){
	zkAjax("/frontSystemddlAction!getSystemddlByParentId.action?id="+id,function(data){
		var rows = data;
		for(var i =0;i<rows.length;i++){
			$(".city-box").append("	<a onclick='showCity(this)'>"+rows[i].text+"</a>");
		}
	});
}

function showCity(self){
	var city = $(self).html();
	$(".city-present span").html(city+"<i></i>");
	showCityView(city);
}

/**
 * 加载周边旅游
 */
function showCityView(city){
	//自定义变量
	var cityViews = $(".travel-list .box-bd .ul-list");
	var cityViewsTitle = $(".travel-list .box-hd .title");
	//改变标题
	cityViewsTitle.html(city+"周边旅游");
	//获取数据
	var data = {
		"province":city,
	}
	//发送请求
	$.ajax({
		type:'post',
		dataType:'json',
		data:data,
		url : getWebProjectName() + '/frontViewsAction!getViewsInfo.action',
		success : function(data) {
			if(data.success){
				console.info(data)
				//清空节点
				cityViews.html("");
				//添加节点
				//设置限制条件
				var size = data.total;
				if(size>=5){
					size = 5;
				}
				if(size==0){
					cityViews.html("暂时没有景区");
				}else{
					for(var i=0;i<size;i++){
						cityViews.append("<li class='travel-item-1'>"+
							"<div class='bg-img img-pos-3'>热销</div>"+
							"<a class='thumb' href="+getWebProjectName() + "/frontViewsAction!getOneView.action?id="+data.rows[i].id+" target='_blank'>"+
							"<img src="+getWebProjectName()+'/frontViewsAction!getViewImg.action?imgName='+data.rows[i].imgName+" width='230' height='164'/></a>"+
							"<h3 class='title'>"+
								"<a href='#' target='_blank'>"+data.rows[i].name+"</a>"+
								"<p class='price'>"+data.rows[i].lowPrice+" 元起</p></h3></li>");
					}
				}
			}
		}
	});
}

$("#search").bind('click',function(){
	var cityViews = $("#cityNow").html().split("<")[0];
	var keyWord = $("#keyWord").val();
	//获取数据
	var data = {
		"province":cityViews,
		"keyword":keyWord,
	}
	if(keyWord!=""){
		console.info(data);
		//发送请求
		$.ajax({
			type:'post',
			dataType:'json',
			data:data,
			url : getWebProjectName() + '/frontViewsAction!getViewsInfo.action',
			success : function(data) {
				if(data.success){
					console.info(data)
					//清空节点
					window.location.href=getWebProjectName()+'/viewticket/viewlist.jsp'
				}
			}
		});
	}else{
		alert('请输入搜索条件')
	}
})

/**
 * 快捷请求ajax
 * @param url
 * @param callfun
 */
function zkAjax(url,callfun){
	var realUrl = getWebProjectName()+url;
	//发送登陆请求
	$.ajax({
     type: "POST", 
     contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		url:realUrl,
		dataType:"json",
		success:function(data){
			callfun(data);
		}
	});
};

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
