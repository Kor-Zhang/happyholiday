/*******************定义变量****************/
//轮播
var carousel = undefined;
//轮播div
var carouselImgDivs = undefined;
//定义轮播的宽高比
var carouselWidthAndHeight = 1.9;
//定义当前正在轮播的图片
var currtCarouselImgDiv = undefined;
//轮播切换的间隔时间
var carouselChangeTime = 7000;
//定义每张图片出现和消失的时间
var carouselImgInOutTime = 2000;
//定义每张图片的文字在图片出现后延迟出现的时间
var carouselFontInTime = 2000;
$(function($){
	
	//加载轮播数据，初始化轮播相关的dom节点
	loadCarousel();
	
});


/**
 * 设置轮播的宽高比
 */
function setCarouselDivSize(){
	/*var carousel = $('#officialwebsite_inedx_carousel');*/
	var imgs = carouselImgDivs.find('img');
	var carouselWidth = carousel.width();
	var carouselHeight = carousel.height(carouselWidth/carouselWidthAndHeight).height();
	carouselImgDivs.height(carouselHeight);
	imgs.height(carouselHeight);

}
/**
 * 开始轮播
 */
function startCarousel(){
	var i = 0;
	i = executeCarousel(i);
	setInterval(function(){
		i = executeCarousel(i);
	}, carouselChangeTime);
}
/**
 * 执行轮播
 * @param i
 * @returns {Number}
 */
function executeCarousel(i){
	if(carouselImgDivs.length<=1){
		return i;
	}
	if(i >= carouselImgDivs.length){
		i = 0;
	}
	//隐藏当前img
	if(currtCarouselImgDiv!=undefined){
		hideCarouselImg(currtCarouselImgDiv);
		
	}
	//设置并且显示新的img
	currtCarouselImgDiv = $(carouselImgDivs[i]);
	showCarouselImg(currtCarouselImgDiv);
	i++;
	return i;
} 
/**
 * 显示轮播图片
 * @param img
 */
function showCarouselImg(imgDiv){
	$(imgDiv).find('img').fadeIn(carouselImgInOutTime);
	setTimeout(function(){
		$(imgDiv).find('font').fadeIn(carouselImgInOutTime);
	},carouselFontInTime);
	
}
/**
 * 隐藏轮播图片
 * @param img
 */
function hideCarouselImg(imgDiv){
	$(imgDiv).find('img').fadeOut(carouselImgInOutTime);
	$(imgDiv).find('font').fadeOut(carouselImgInOutTime);
}


/**
* 连接服务接收轮播信息
*/
function loadCarousel(){

	//初始化dom节点
	carousel = $('#officialwebsite_inedx_carousel');
	zkAjax('/ow/owIndexCarouselAction!getCarousels.action',function(data){
		/* <div class="carouselImgDiv">
		<img alt="加载错误！" src="<c:url value='/img/officialwebsite/bg/imgdemo02.jpg'/>">
		<font>让我们来一场说走就走的旅行吧！</font>
		</div> */
		var rows = data.rows;
		//添加轮播节点
		for (var index = 0; index < rows.length; index++) {
			var row = rows[index];
			var div = $("<div class='carouselImgDiv'></div>");
			var img = $("<img src='"+getWebProjectName()+"/ow/owIndexCarouselAction!getImgByImgName.action?imgName="+row.imgName+"'/>");
			var font = $("<font>"+row.introduction+"</font>");
			div.append(img);
			div.append(font);
			carousel.append(div);
		}
		//初始化dom节点
		carouselImgDivs = carousel.find('.carouselImgDiv');
		//动态设置轮播的宽高比
		setCarouselDivSize();
		//开始轮播
		startCarousel();
	});
	
	
}

