$(function() {
	
	//页面加载直接获取图片轮播信息
	$.ajax({
		type:'post',
		dataType:'json',
		url :  getWebProjectName() + '/indexAction!getCarouselInfo.action',
		success:function(data){
			data = JSON.parse(data);
			console.info(data);
			//添加节点
			for(var i=0;i<data.total;i++){
				$(".ck-slide-wrapper").append(
						"<li style='display:none'> <a href='#'><img  width='1200' height='430' src="+getWebProjectName()+'/indexAction!getCarouselsImg.action?carouselsImgName='+data.rows[i].carouselsImgName+" ></a></li>" 
				);
				$(".dot-wrap").append(
						" <li><em>"+(i+1)+"</em></li> "
				);
			}
			//设置初始样式
			$(".dot-wrap li").eq(0).addClass("current");
			$(".ck-slide-wrapper li").eq(0).css('display','block');
			$('.ck-slide').ckSlide();
		}
	});
	
	//页面加载 直接刷新汽车推荐区信息
	$.ajax({
		type:'post',
		dataType:'json',
		url :  getWebProjectName() + '/frontRecommendCarsAction!getRecommendCarsInfo.action',
		success:function(data){
			data = JSON.parse(data);
			console.info(data)
			var cengshu = Math.ceil(data.total/5);
			var height = 260 + 210 * (cengshu-1) ;
			//修改 推荐景区的高度
			$(".car").css("height",height+"px");
			
			//添加节点
			for(var i=0;i<data.total;i++){
				$(".inner-tabs-panel").append(
								"<div class='product-item'>"
    							+"<a class='rcd' href="+getWebProjectName() + "/frontCarsAction!getCarInfo.action?id="+data.rows[i].carId+" id="+data.rows[i].carId+">"
    							+"	<p class='item-img'>"
    							+"	<img  width='220' height='110' src="+getWebProjectName()+'/frontCarsAction!getCarsImg.action?mainImgName='+data.rows[i].mainImgName+" />"
    							+" </p>"
    							+" <p class='item-name'>"+data.rows[i].carBd+"</p>"
    							+" <p class='item-info'><span class='myPrice'><dfn>￥</dfn>"+data.rows[i].price+"<i class='myPrice-info'>起</i></span></p>"
    							+"	</a>"
    							+"</div>"		
				);
				
			}
			
		}
	});
	
	//页面加载 直接刷新景区推荐区信息
	$.ajax({
		type:'post',
		dataType:'json',
		url :  getWebProjectName() + '/frontRecommendViewAction!getData.action',
		success:function(data){
			console.info(data)
			var cengshu = Math.ceil(data.total/5);
			var height = 260 + 210 * (cengshu-1) ;
			//修改 推荐景区的高度
			$(".view").css("height",height+"px");
			//添加节点
			for(var i=0;i<data.total;i++){
				$(".inner-tabs-panel-viewticket").append(
								"<div class='product-item'>"
    							+"<a class='rcd' href="+getWebProjectName() + "/frontViewsAction!getOneView.action?id="+data.rows[i].viewId+" id="+data.rows[i].viewId+">"
    							+"	<p class='item-img'>"
    							+"	<img  width='220' height='110' src="+getWebProjectName()+'/frontViewsAction!getViewImg.action?imgName='+data.rows[i].imgName+" />"
    							+" </p>"
    							+" <p class='item-name'>"+data.rows[i].viewName+"</p>"
    							+" <p class='item-info'><span class='myPrice'><dfn>￥</dfn>"+data.rows[i].viewPrice+"<i class='myPrice-info'>起</i></span></p>"
    							+"	</a>"
    							+"</div>"		
				);
				
			}
			
		}
	});
	
	$(".recommend .recommend-content-type ul li").click(
			function() {
				$(this).addClass("recommend-content-type-li-style").siblings()
						.removeClass("recommend-content-type-li-style");
			});

	$(".recommend-content-type ul li").click(
			function() {
				var index = $(this).index();
				$(".recommend-content-contents ul li").eq(index).addClass(
						"li-show").siblings().removeClass("li-show");
			});
	$(".mod-hd span").click(function() {
		$(this).addClass("current").siblings().removeClass("current");
	});
	$(".mod-hd span").click(function() {
		var index = $(this).index();
		if ($(".mod-bd-panel").eq(index).css('display') == 'none') {
			$(".mod-bd-panel").eq(index).siblings().css('display', 'none');
			$(".mod-bd-panel").eq(index).css('display', 'block');

		}

	});
})

/*function toRent(){
	$(".rcd").bind('click',function(){
		var id = $(this).attr("id");
		var data = {
				id:id,
		}
		//发送请求
		$.ajax({
			url : getWebProjectName() + '/frontCarsAction!getCarInfo.action',
			dataType:'json',
			data:data,
			type:'post',
			success : function(data) {
				data = JSON.parse(data);
				if(data.status==1){
					window.location.href=getWebProjectName()+'/cars/car-source.jsp'
				}
			}
		});
	})
}*/

function getWebProjectName() {
	var webProjectName = undefined;
	// 获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
	var pathName = window.document.location.pathname;
	// 获取带"/"的项目名，如：/uimcardprj
	webProjectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);

	return webProjectName;
}