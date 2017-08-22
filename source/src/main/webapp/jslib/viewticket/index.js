$(function(){
	/**
	 * 地理位置下拉框事件
	 */
	$(".city-station").bind('click',function(){
		if($(".city-station").hasClass("city-station-on")){
			city_off();
		}else{
			city_on();
		}
	/*	$(".city-station").addClass("city-station-on");*/
		
	})
})

function city_on(){
	$(".city-station").addClass("city-station-on");
	$(".city-station .city-box ").css('display','block');
}
function city_off(){
	$(".city-station").removeClass("city-station-on");
	$(".city-station .city-box ").css('display','none');
}
