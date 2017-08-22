/*******************定义变量****************/
//标题列表
var titleUl = undefined;
//标题显示区域
var title = undefined;
//新闻信息显示区域
var serviceContent = undefined;
//储存远程加载的所有的新闻信息
var allService = undefined;
//储存返回的数据
var retData = undefined;
//创建时间
var createTime = undefined;
//保存标题列表的原始字体大小，颜色
var titleUlOldColor = 'rgb(86,159,211)'; 
var titleUlOldFont = '15px'; 
//保存标题列表的新的字体大小，颜色
var titleUlNewColor = 'black' ;
var titleUlNewFont = '23px';
//当前点击的title节点
var currtTitleANode = undefined;
//当前页
var page = 1;
//每页记录数量
var rows= 10;
//标题限制长度，超过该长度就进行截取
var titleLimitLength = 7;
var nextPageBtn = undefined;
var prePageBtn = undefined;
$(function($){
	/*******************初始化dom*****************/
	serviceContent = $('#officialwebsite_service_displayArea_right_content');
	titleUl = $('#officialwebsite_service_displayArea_left>ul');
	title = $('#officialwebsite_service_displayArea_right_title');
	createTime = $('#officialwebsite_service_displayArea_right_createTime');
	nextPageBtn = $('#officialwebsite_service_displayArea_left_nextPage>a');
	prePageBtn = $('#officialwebsite_service_displayArea_left_prePage>a');
	//远程加载新闻
	loadService(page,rows);
	
});

/**
 * 截取超过len尺寸的字符串，以....代替
 */
function splitBeyondStr(len,oldStr){
	var newStr = "";
	//如果标题大于这个长度，那么省略
	if(oldStr.length>len){
		newStr = oldStr.substring(0,len)+"....";
	}else{
		newStr = oldStr;
	}
	return newStr;
}
/**
 * 远程加载新闻信息（分页查询）
 */
function loadService(page,rows){
	//清空显示内容
	serviceContent.html("");
	//清空显示标题
	title.html("");
	//清空标题列表
	titleUl.html("");
	//清空创建时间
	createTime.html("");
	//加载数据
	zkAjax('/ow/owServiceAction!getService.action?page='+page+"&rows="+rows,function(data){
		retData = data;
		allService = data.rows;
		//加载显示标题列表
		for (var index = 0; index < allService.length; index++) {
			var service = allService[index];
			//展示的字符串
			var displayTitle = splitBeyondStr(titleLimitLength,service.title);

			//a便签保存题目的完整信息，保存这条新闻记录的id（idVal）
			var a = $("<a title="+service.title+" idVal='"+service.id+"'  onClick=showServiceContent('"+service.id+"') href=javascript:void(0);>"+displayTitle+"</a>");
			var li = $('<li></li>');
			li.append(a);
			titleUl.append(li);
		}
		var prePage = (page-1);
		var nextPage = (page+1);
		//计算最大页号
		var totalPage = (retData.total %rows==0)?(retData.total %rows):(Math.floor(retData.total/rows)+1);
		
		//如果是最后一页
		if(totalPage<nextPage){
			nextPageBtn.attr('href',"javascript:void(0);");
		}else{
			//设置按钮的触发事件
			nextPageBtn.attr('href',"javascript:loadService("+nextPage+","+rows+")");
		}
		
		//如果是第一页
		if(prePage<1){
			prePageBtn.attr('href',"javascript:void(0);");

		}else{
			//设置按钮的触发事件
			prePageBtn.attr('href',"javascript:loadService("+prePage+","+rows+")");
		}
		//默认显示的新闻
		showServiceContent(allService[0].id);
	});
}

/**
 * 显示指定id的新闻内容
 * @param serviceId
 */
function showServiceContent(serviceId){
	for (var index = 0; index < allService.length; index++) {
		var service = allService[index];
		if(serviceId==service.id){
			
			//重复点击同一节点
			//1.取出当前的被点击的节点，即取出其id（数据库该记录的id）；2.对比用户点击显示的id
			if(currtTitleANode!=undefined&&service.id==$(currtTitleANode).attr('idVal')){
				break;
			}
			//显示内容
			serviceContent.html(service.text);
			//显示标题
			title.html(service.title);
			//替换标题列表的缩略标题为完整标题
			$(titleUl.find('a')[index]).html(service.title);
			//显示穿件时间
			createTime.html(service.createTime);
			//判断当前是否有被选择的节点
			if(currtTitleANode){
				currtTitleANode.css('color',titleUlOldColor);
				currtTitleANode.css('font-size',titleUlOldFont);
				//取出标题的提示信息，写入显示
				var displayTitle = splitBeyondStr(titleLimitLength,currtTitleANode.html());
				currtTitleANode.html(displayTitle);
			}
			//替换当前选择的标题列表节点
			currtTitleANode = $(titleUl.find('a')[index]);
			currtTitleANode.css('color',titleUlNewColor);
			currtTitleANode.css('font-size',titleUlNewFont);
			
		}
		
	}
}
