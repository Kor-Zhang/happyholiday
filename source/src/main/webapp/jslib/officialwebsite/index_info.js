/*******************定义变量****************/

//信息的table
var infoTable = undefined;
//每行展示数量
var trTdNumber = 4.0;
//设置信息图片的宽高比
var infoImgWidthAndHeight = 1.0;
$(function($){
	//加载displya信息，并且加载相关节点
	loadDisplay();
	
});


/**
 * 设置图片展示的比例
 */
function setInfoImgSize(){

	//所有的列
	var tds = infoTable.find('tr td');
	//table宽
	var tableWidth = infoTable.width();
	var tdWidth = tableWidth/trTdNumber;
	//每个列的宽高
	tds.width(tdWidth);
	/*alert(tdWidth);
	var tdHeight = tds.height(tdWidth*infoImgWidthAndHeight+200).height();*/

	var imgs = infoTable.find('img');
	imgs.width(tdWidth);
	imgs.height(tdWidth*infoImgWidthAndHeight);
}



/**
* 连接服务接收展示信息
*/
function loadDisplay(){

	infoTable = $('#officialwebsite_index_info_body_imgTable');
	zkAjax('/ow/owIndexDisplayAction!getDisplays.action',function(data){
		/*<td>
		<img alt="加载错误！" src="<c:url value='/img/officialwebsite/bg/imgdemo01.jpg'/>">
		<div>
			总部位于张家界市,独立的咨询组织带来现实世界的经验和专业知识向客户提供全面、优质、专业旅游服务。
		</div>
		</td>*/
		
		var rows = data.rows;
		//添加展示节点
		var currtTr = $("<tr></tr>"); 
		for (var index = 0; index < rows.length; index++) {
			
			//添加行
			infoTable.append(currtTr);
			
			var row = rows[index];
			var td = $("<td></td>");
			var img = $("<img src='"+getWebProjectName()+"/ow/owIndexDisplayAction!getImgByImgName.action?imgName="+row.imgName+"'/>");
			var div = $("<div>"+row.introduction+"</div>");
			
			td.append(img);
			td.append(div);
			//判断是否显示满一行（一行四个）
			//0，1，2，3，4，5
			if(index%trTdNumber==0&&index!=0){
				//添加新行
				currtTr = $("<tr></tr>"); 
				infoTable.append(currtTr);
				currtTr.append(td);
			}else{
				currtTr.append(td);
			}
		}
		//补全table最后一行，剩余没有补全的td
		var lastTr = infoTable.find('tr:last');
		for (var index = 0; index < trTdNumber-rows.length%trTdNumber; index++) {
			var td = $("<td></td>");
			lastTr.append(td);
		}
		//设置图片展示的比例
		setInfoImgSize();
	});
	
	
}