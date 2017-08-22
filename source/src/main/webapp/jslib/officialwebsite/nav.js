/*******************定义变量****************/
var navFont = undefined;
$(function($){
	/*******************初始化dom*****************/
	navFont = $('#officialwebsite_nav_nav_right_ul a');
	
	//设置导航栏字体大小
	setNavFontSize();
	
	// 回到顶部
	$('#toTopBtnId').click(function(){
		scrollTo('#topId');
	});
});
/**
 * 设置导航栏字体大小
 */
function setNavFontSize(){
	var htmlWidth = $('html').width();
	if(htmlWidth<=1024){
		navFont.css('font-size','15px');
	}
}
