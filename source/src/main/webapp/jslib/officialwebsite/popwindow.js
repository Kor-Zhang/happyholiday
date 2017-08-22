/*******************定义变量****************/
var popWindow = undefined;
var popWindowMsg = undefined;
var confiremBtn = undefined;
$(function($){

	popWindow = $('#ow_popwindow_entity');
	popWindowMsg = $('#ow_popwindow_body');
	confiremBtn = $('#confiremBtn');
	popWindow.hide();
	//确认按钮触发事件
	confiremBtn.click(function(){
		popWindow.hide();
	});
});


/******************功能性方法***************/
/**
 * 显示不为空的信息
 */
function popMsg(msg){
	popWindowMsg.html(msg);
	popWindow.show();
	
}
