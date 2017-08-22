/*******************定义变量****************/
var membersTable = undefined;
//设置table的列数
var trTdNumber = 2;
//设置展示图片的宽高比
var imgWidthAndHeight = 1.0;
$(function($){
	
	//加载成员数据，初始化相关dom
	loadMembers();
});


/**
 * 设置成员信息展示的table
 */
function setTableSize(){
	var fonts = membersTable.find('.officialwebsite_members_introduction_imgDiv_table_img_fontDiv');
	var imgs = membersTable.find('img');
	var tds = membersTable.find('td');
	//设置img高度
	var imgWidth = imgs.width();
	var imgHeight = imgs.height(imgWidth*imgWidthAndHeight).height();
	//设置td高度
	var tdHeight = tds.height(imgHeight).height();
	//设置字体说明高度
	fonts.height(imgHeight);
}





/**
* 连接服务接收展示信息
*/
function loadMembers(){

	membersTable = $('#officialwebsite_members_introduction_imgDiv_table');
	zkAjax('/ow/owMembersAction!getMembers.action',function(data){
		/*<td>
			<div class="officialwebsite_members_introduction_imgDiv_table_img">
				<div class="officialwebsite_members_introduction_imgDiv_table_img_img">
					<img alt="加载错误！" src="<c:url value='/img/officialwebsite/bg/imgdemo01.jpg'/>">
				</div>
				<div class="officialwebsite_members_introduction_imgDiv_table_img_fontDiv">
					<h1>Kang Qing</h1>
					<h3>经理</h3>
					<h5>所有者和首席执行官 </h5>
				</div>
			</div>
		</td>*/
		var rows = data.rows;
		//添加展示节点
		var currtTr = $("<tr></tr>"); 
		for (var index = 0; index < rows.length; index++) {
			var row = rows[index];
			//添加行
			membersTable.append(currtTr);
			
			//添加td内部
			var div1 = $("<div class='officialwebsite_members_introduction_imgDiv_table_img'></div>");
			var div1_1 = $("<div class='officialwebsite_members_introduction_imgDiv_table_img_img'></div>");
			var div1_2 = $("<div class='officialwebsite_members_introduction_imgDiv_table_img_fontDiv'></div>");
			div1.append(div1_1);
			div1.append(div1_2);
			
			var img = $("<img src='"+getWebProjectName()+"/ow/owMembersAction!getHead.action?head="+row.head+"'/>");
			div1_1.append(img);
			
			var h1 = $("<h1>"+row.name+"</h1>");
			var h3 = $("<h3>"+row.position+"</h3>");
			var h5 = $("<h5>"+row.introduction+"</h5>");
			div1_2.append(h1);
			div1_2.append(h3);
			div1_2.append(h5);
			
			var td = $("<td></td>");
			td.append(div1);
			
			
			//判断是否显示满一行（一行四个）
			//0，1，2，3，4，5
			if(index%trTdNumber==0&&index!=0){
				//添加新行
				currtTr = $("<tr></tr>"); 
				membersTable.append(currtTr);
				currtTr.append(td);
			}else{
				currtTr.append(td);
			}
		}
		//补全table最后一行，剩余没有补全的td
		var lastTr = membersTable.find('tr:last');
		for (var index = 0; index < trTdNumber-rows.length%trTdNumber; index++) {
			var td = $("<td></td>");
			lastTr.append(td);
		}
		//设置展示比例
		setTableSize();
	});
	
	
}
