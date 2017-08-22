//初始化变量
var province = $("#province").html();
var keyword = $("#keyword").html();
var type =$(".sight-subjiect-list .active").children('span').html();
var select = $(".select-list .active").html();
var MytotalRecords = undefined;
$(function(){
	
	/*价格选择事件*/
	$('.prices').bind('mouseover',function(){
		$(".left .prices i").css('display','none');
		$(".left .prices-box").css('display','block');
	})
	$('.prices').bind('mouseout',function(){
		$(".left .prices i").css('display','block');
		$(".left .prices-box").css('display','none');
	})
	$(".left .prices-box").bind('mouseover',function(){
		$(".left .prices i").css('display','none');
		$(".left .prices-box").css('display','block');
	})
	$(".left .prices-box").bind('mouseout',function(){
		$(".left .prices i").css('display','block');
		$(".left .prices-box").css('display','none');
	})
	$(".prices-box a").bind('click',function(){
		$('.left .prices').css('width','110px')
	    $(".left .prices").html($(this).html()+"<i></i>");
	    $(".left .prices i").css('display','block');
	    $(".left .prices-box").css('display','none');
	    onActive(".left .prices")
	    refreshViewList(1);
	})
	
	/*人气选择事件*/
	$(".nums").bind("click",function(){
		 onActive(".nums");
		 refreshViewList(1);
	})
	
	/*不限事件*/
	$("#rcommend").bind("click",function(){
		 onActive("#rcommend");
		 refreshViewList(1);
	})
	
	//获取主题
	getViewType();
	/*景点主题事件*/
	selectSub = function(self){
		var index = $(self).index() + 1;
		if (index == 1) {
			$(self).siblings().removeClass("active");
			$(self).addClass("active");
		} else {
			if (!$(self).hasClass('active')) {
				$(self).siblings().removeClass("active");
				$(self).addClass("active");
			} else {
				$($(self).siblings()[0]).addClass("active");
				$(self).removeClass("active");
			}
		}
		refreshViewList(1);
		/*type =$(".sight-subjiect-list .active").children('span').html();
		var data ={
				type:type,
				province:province,
		}
		getViewlist(data);
		refreshPage(MytotalRecords);
		alert(MytotalRecords)*/
	}
	//第一次刷新页面 显示分页
	 fengye();
	
	 
	 /*预定按钮点击事件*/
	/* $(".sight-item-do").bind('click',function(){
		 var id =$(this).attr("id");
		 var data = {
				 id:id,
		 }
		 $.ajax({
			 type:"post",
			 datatype:'json',
			 data:data,
			 url : getWebProjectName() + '/frontViewsAction!getOneView.action',
			 success:function(data){
				 console.info(data);
				 newWin(getWebProjectName()+'/viewticket/viewticket.jsp')
				 window.open(getWebProjectName()+'/viewticket/viewticket.jsp', '_blank');
				 window.location.href=getWebProjectName()+'/viewticket/viewticket.jsp';
			 }
		 });
	 });*/
})
/*选中样式*/
function onActive(self){
	$(self).addClass('active');
	$(self).siblings().removeClass('active');
}

function topOn(self){
	$(self).siblings().removeClass("on");
	$(self).addClass("on");
}

function topOff(self){
	$(self).removeClass("on");
	$($(self).siblings()[0]).addClass("on");
}

/**
 * 分页
 */

function fengye(){
	var totalRecords = $("#total").html();
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
	    	 page = n;
	        //这里可以做自已的处理
	    	 refreshViewList(page);
	    	/* type =$(".sight-subjiect-list .active").children('span').html();
	    	 var data  = {
		    			page:page,
		    			province:province,
		    			type:type,
		    } 
	    	getViewlist(data); 	*/
	        //处理完后可以手动条用selectPage进行页码选中切换
	        this.selectPage(page);
	        var speed=200;//滑动的速度
  	        $('body,html').animate({ scrollTop: 0 }, speed);
  	        return false;
	    },
	    //getHref是在click模式下链接算法，一般不需要配置，默认代码如下
	    getHref : function(n){

	        return '#';
	    }
	},true);
}

/**
 * 刷新分页
 */
function refreshPage(totalRecords){
	var total = Math.ceil(totalRecords/10);
	console.info(total+"total"+totalRecords);
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
	    	 page = n;
	        //这里可以做自已的处理
	    	refreshViewList(page);
	    	/* type =$(".sight-subjiect-list .active").children('span').html();
	    	 var data  = {
		    			page:page,
		    			province:province,
		    			type:type,
		    } 
	    	getViewlist(data); 	*/
	        //处理完后可以手动条用selectPage进行页码选中切换
	        this.selectPage(page);
	        var speed=200;//滑动的速度
  	        $('body,html').animate({ scrollTop: 0 }, speed);
  	        return false;
	    },
	    //getHref是在click模式下链接算法，一般不需要配置，默认代码如下
	    getHref : function(n){

	        return '#';
	    }
	},true);
}

/**
 * 获取景区主题
 */
function getViewType(){
	zkAjax("/frontSystemddlAction!getSystemddlByParentId.action?id=9",function(data){
		var rows = data;
		for(var i=0;i<rows.length;i++){
			$(".sight-subjiect-list").append("<dd  onclick='selectSub(this)'>"+
							"<span  class='span'>"+rows[i].text+"</span>"+
						"</dd>");
		}
		
	});
}


function getViewlist(data){
	console.info(data)
	$.ajax({
		type:'post',
		dataType:'json',
		data:data,
		async:false, 
		url : getWebProjectName() + '/frontViewsAction!getViewsList.action',
		success : function(data) {
			console.info(data);
			rows = data.rows;
			MytotalRecords  = data.total;
			//添加景区列表
			$(".sight").html("");
			for(var i=0;i<rows.length;i++){
				$(".sight").append("<div class='sight-item'>"+
			"<div class='sight-item-img'>"+
				"<img src="+getWebProjectName()+'/frontViewsAction!getViewImg.action?imgName='+data.rows[i].imgName+"  width='280' height='200'></div>"+
			"<div class='sight-item-info'>"+
				"<h3 class='sight-item-name'>"+rows[i].name+"</h3>"+
				"<div class='sight-item-address'>"+
					"<span class='level'>"+rows[i].grade+"景区</span> <span class='area'>["+rows[i].province+"-"+rows[i].city+"]</span></div>"+
				"<div class='address'>地址 : "+rows[i].address+"</div>"+
				"<div class='feature'>特色 : "+rows[i].feature+"</div></div>"+					
			"<div class='sight-item-order'>"+
				"<table>"+
					"<tbody>"+
						"<tr>"+
							"<td><span class='sight-item-price'> <i>￥</i> <em>"+rows[i].lowPrice+"</em>起"+
							"</span></td>"+
						"</tr>"+
						"<tr>"+
							"<td><!-- <span class='sight-item-discount'>5折</span> -->"+ 
							"<span class='sight-item-source'>票面价: "+rows[i].marketPrice+"</span></td>"+
						"</tr>"+
						"<tr>"+
							"<td class='hh'><a  href="+getWebProjectName() + "/frontViewsAction!getOneView.action?id="+rows[i].id+"  id="+rows[i].id+" class='sight-item-do' target='_blank'>预定</a>"+
							"</td>"+
						"</tr>"+
						"<tr>"+
							"<td class='sight-item-soldNum'>月销量:<span class='hot-num'>"+rows[i].salesNumber+"</span></td>"+
						"</tr>"+
					"</tbody>"+
				"</table>"+
			"</div>"+
			"<div class='clear'></div>"+
		"</div>");
				
			}
			
		}
	});
}



function refreshViewList(page){
	 select = $(".select-list .active").html().split("<")[0];
	 type =$(".sight-subjiect-list .active").children('span').html();
	 var data = {
		page:page,
		sort:select,
		type:type,
		province:province,
		keyword:keyword,
	 }
	 getViewlist(data);
	 refreshPage(MytotalRecords);
}



/**
 * 快捷请求ajax
 * @param url
 * @param callfun
 */
function zkAjax(url,callfun){
	
	//发送登陆请求
	$.ajax({
     type: "POST", 
     contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		url:getWebProjectName()+url,
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


