$(function(){
	//初始化一些操作
	InitStyle();
	//获取订单数据
	getOrder(1);
	
	//iframe加载 自动适应高度
	$("#iframepage").load(function(){
		//先加载 子窗口的高度
	/*    $(this).height($(this).contents().find("#content1").height()+30);
	    $('#iframepage',parent.document).height($('#iframepage',parent.document).contents().find("#content").height()+30);*/
	    $(this).height($(this).contents().find("#content").height()+30);
	    //在加载父窗口的高度
	    $('#iframepage',parent.document).height($('#iframepage',parent.document).contents().find("#content").height()+30);
	});
});

function InitStyle(){
	//取车日期和换车日期控件  触发改动 租期事件
	$('#startTime').datetimepicker({
		lang:'ch',
	  	timepicker: false,
		format:'Y-m-d',
	});
	$('#endTime').datetimepicker({
		lang:'ch',
	  	timepicker: false,
		format:'Y-m-d',
	});
	
	selectStatus = function(self) {
		var index = $(self).index() + 1;
		var length = $(".myContent_Status a").length;
		var data = undefined;
		if (index == 1) {
			$(".myContent_Status a").siblings().removeClass("checked");
			$(".myContent_Status a").eq(index-1).addClass("checked");
			$(self).siblings().removeClass("checked");
			$(self).addClass("checked");
		} else {
			if (!$(self).hasClass("checked")) {
				$(".myContent_Status a").siblings().removeClass("checked");
				$(".myContent_Status a").eq(index-1).addClass("checked");
				$(".myContent_Status a").eq(index).addClass("checked");
				$($(self).siblings()).removeClass("checked");
				$(self).addClass("checked");
			} else { //如果选择了，则取消选中
				$(".myContent_Status a").siblings().removeClass("checked");
				$(".myContent_Status a").eq(0).addClass("checked");
				$(self).removeClass("checked");
				$($(self).siblings()[0]).addClass("checked");
			}
		}
		getOrder(1);
	};
	
	$('#modify').bind('click',function(){
		getOrder(1);
	});
}
/**
 * 分页 及 后台操作
 */
function refreshPage(totalRecords){
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
    	getOrder(n);
        //处理完后可以手动条用selectPage进行页码选中切换
        this.selectPage(n);
    },
    //getHref是在click模式下链接算法，一般不需要配置，默认代码如下
    getHref : function(n){

        return '#';
    }
   },true);
}



function getOrder(page){
	var status = $(".myContent_Status .checked").html();
	var startTime = $('#startTime').val();
	var endTime = $('#endTime').val();
	if(startTime==""||endTime==""){
		startTime ="1990-01-01";
		endTime ='1990-01-01';
	}
	var data = {
		page:page,
		rows:10,
		type :status,
		startTime:startTime,
		endTime:endTime,
	}
	console.info(data);
	//发送请求获取数据
	$.ajax({
		type:'post',
		url : getWebProjectName() + '/frontCarOrderAction!getOrders.action',
		dataType:'json',
		data:data,
		success : function(data) {
			data = $.parseJSON(data);
			console.info(data);
			if(data.total!=0){
				$("#kkpager").css('display','block');
				refreshPage(data.total);	
			}else{
				$("#kkpager").css('display','none');
			}
			$("#iframepage").attr('src',getWebProjectName()+"/users/personal_order.jsp");
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