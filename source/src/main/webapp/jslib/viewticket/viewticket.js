$(function(){
	/*服务承诺的提示*/
	$('.text-promise-item').bind('mouseenter',function(){
		$(".item-introduction").css('display','block');
	})
	$('.text-promise-item').bind('mouseout',function(){
		$(".item-introduction").css('display','none');
	})
	
	/*选项卡--小导航*/
	selectInfo = function(self){
		 var index = $(self).index() + 1;
		 var length = $('.navbar ul li').length;
		 console.info(length);
		 $(self).siblings().removeClass("current");
		 $(self).addClass("current");
		 for(var i=0;i<length;i++){
		 	 $('.content'+i).css('display','none');
		 }
		 $('.content'+index).css('display','block');
	} 
	
})
