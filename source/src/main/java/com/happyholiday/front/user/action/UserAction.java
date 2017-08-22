package com.happyholiday.front.user.action;

import java.io.File;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSONObject;
import com.happyholiday.action.UserBaseAction;
import com.happyholiday.front.user.Static;
import com.happyholiday.front.user.pageModel.PageUsers;
import com.happyholiday.front.user.service.UserServiceI;
import com.happyholiday.front.user.service.impl.UserServiceImpl;
import com.happyholiday.front.user.util.Config;
import com.happyholiday.front.user.util.GetVerification;
import com.happyholiday.front.user.util.Send;
import com.happyholiday.front.user.util.Tools;
import com.happyholiday.front.user.util.Xml2JsonUtil;
import com.happyholiday.front.user.util.XmlJSON;
import com.happyholiday.model.Users;
import com.opensymphony.xwork2.ModelDriven;
@Namespace("/")
@Action(value = "frontUsersAction", results={
		@Result(name = "login_success",  type = "redirect", location = "/index.jsp"),
		@Result(name = "login_error",  location = "/login.jsp"),
		@Result(name = "register_success", type = "redirect", location = "/index.jsp"),
		@Result(name = "register_error", location = "/register.jsp"),
		@Result(name = "forgetPwd_success", type = "redirect", location = "/forgetPwd_success.jsp"),
		@Result(name = "forgetPwd_error", location = "/forgetPwd.jsp"),
		@Result(name = "updatePwd_success", type = "redirect",  location = "/users/personal_success.jsp"),
		@Result(name = "updatePwd_error", location = "/users/personal_password.jsp"),
		})
public class UserAction extends UserBaseAction implements ModelDriven<PageUsers>{
	private PageUsers pageModel = new PageUsers();
	@Override
	public PageUsers getModel() {
		// TODO Auto-generated method stub
		return pageModel;
	}
	//配置service
	private UserServiceI frontUserService;
	
	
	public UserServiceI getFrontUserService() {
		return frontUserService;
	}
	@Autowired
	public void setFrontUserService(UserServiceI frontUserService) {
		this.frontUserService = frontUserService;
	}
	/**
	 * 用户登录
	 * @return
	 */
	public String login(){
		try{
			Object[] objs = frontUserService.usersLogin(pageModel);
			//把用户和用户登录记录存入Session
			Tools.getSession().setAttribute(Static.ONLINE_USER, objs[0]);
			Tools.getSession().setAttribute(Static.userLoginRecordSessionName, objs[1]);
		}catch(Exception e){
			ServletActionContext.getRequest().setAttribute("msg", e.getMessage());
			return "login_error";
		}finally{
			Tools.getSession().setAttribute("phone",pageModel.getPhone());
		}
		return "login_success";
	}
	
	public String loginByPhone(){
		if(pageModel.getPhoneTwo().equals("")){
			ServletActionContext.getRequest().setAttribute("msgTwo","手机号不能为空");
			return "login_error";
		}
		try {
			//如果正确
			if(Tools.getSessionObject("verification").equals(pageModel.getWord())){
				Object[] objs  = 	frontUserService.userLoginByPhone(pageModel);
				//把用户和用户登录记录存入Session
				Tools.getSession().setAttribute(Static.ONLINE_USER, objs[0]);
				Tools.getSession().setAttribute(Static.userLoginRecordSessionName, objs[1]);
			}else{
				ServletActionContext.getRequest().setAttribute("msgTwo","验证码有误");
				return "login_error";
			}
		} catch (Exception e) {
			// TODO: handle exception
			ServletActionContext.getRequest().setAttribute("msgTwo", e.getMessage());
			return "login_error";
		}finally{
			Tools.getSession().setAttribute("phone",pageModel.getPhoneTwo());
			ServletActionContext.getRequest().setAttribute("phoneTwo",pageModel.getPhoneTwo());
		}
		return "login_success";
	}
	/**
	 * 用户注册
	 * @return
	 */
	public String register(){
		try{
			//如果正确
		
			if(Tools.getSessionObject("verification").equals(pageModel.getWord())){
				Users user = 	frontUserService.usersRegister(pageModel);
			 	Tools.getSession().setAttribute(Static.ONLINE_USER, user);	
			}else{
				ServletActionContext.getRequest().setAttribute("wordMsg","验证码有误");
				return "register_error";
			}
		}catch(Exception e){
			ServletActionContext.getRequest().setAttribute("msg", e.getMessage());
			return "register_error";
		}finally{
			ServletActionContext.getRequest().setAttribute("registerPhone",pageModel.getPhone());
			ServletActionContext.getRequest().setAttribute("realName",pageModel.getRealName());
			Tools.getSession().setAttribute("phone",pageModel.getPhone());
		}
		return "register_success";
	}
	
	/**
	 * 退出登录
	 * @return
	 */
	public String logout(){
		try {
			frontUserService.usersLogout();
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return "register_success";
	}
	/**
	 * 忘记密码
	 * @return
	 */
   public String  forgetPwd(){
		try{
			//如果正确
			
			if(Tools.getSessionObject("verification").equals(pageModel.getWord())){
				frontUserService.forgetPwd(pageModel); 	
			}else{
				ServletActionContext.getRequest().setAttribute("wordMsg","验证码有误");
				return "forgetPwd_error";
			}
		}catch(Exception e){
			ServletActionContext.getRequest().setAttribute("msg", e.getMessage());
			return "forgetPwd_error";
		}finally{
			ServletActionContext.getRequest().setAttribute("Fphone",pageModel.getPhone());
		}
		return "forgetPwd_success";
   }
   
   /**
    * 更新用户信息
    * @return
    */
   public void updateInfo(){
	   try{
			frontUserService.updateInfo(pageModel);
		}catch(Exception e){
			e.printStackTrace();
		}
	   super.writeJSON(pageModel);
		
   }
   /**
    * 下订单的时候 添加信息
    */
   public void updateInfoByOrder(){
	   try{
			frontUserService.updateInfoByOrder(pageModel);
		}catch(Exception e){
			e.printStackTrace();
		}
   }
   
   /**
    * 修改密码
    * @return
    */
	  public String updatePwd(){
			try{
				frontUserService.updatePwd(pageModel);
			}catch(Exception e){
				ServletActionContext.getRequest().setAttribute("msg", e.getMessage());
				return "updatePwd_error";
			}
			return "updatePwd_success";
	  }
  /**
   * 异步获取用户信息
   */
	  public void getUserInfo(){
		 JSONObject jo =new JSONObject();
		 try{
			   String phone = Tools.getSessionObject("phone");
			   System.out.println("phone"+phone);
				Users user = frontUserService.getUserInfo(phone);
				jo.put("phone", user.getPhone());
				jo.put("realName",user.getRealName());
				if(user.getCardClazz()==null){
					jo.put("cardClazz", "null");
				}else{
					jo.put("cardClazz", user.getCardClazz());
				}
				if(user.getCardNumber()==null){
					jo.put("cardNumber","null");
				}else{
					jo.put("cardNumber",user.getCardNumber());
				}
				if(user.getUserName()==null){
					jo.put("userName","null");
				}else{
					jo.put("userName",user.getUserName());
				}
		 }catch(Exception e){
			 e.printStackTrace();
		 }
		 super.writeJSON(jo.toJSONString());
	
	  }
	  /**
	   * 获取用户头像
	   */
	  public void getUserHead(){
		  String imgName = pageModel.getHead();
		  //用户头像目录
		  String userHeadImgPath = Static.USERS_HEAD_PATH;
		//请求的图片资源
		  String imgDir = userHeadImgPath+File.separator+imgName;
		  File imgFile = new File(imgDir);
		  writeImg(imgFile);
	  }
	  
	  public void getSMS(){	  
	   String PostData=""; //短信的数据
		 JSONObject jo =new JSONObject();

		try {
			  String verification = GetVerification.getSix(); //短信验证码
			  System.out.println("verification"+verification);
			  PostData = "userid=&account="+Config.getPro().get("smsAccount");
			  PostData+="&password="+Config.getPro().get("smsPwd");
			  PostData+="&mobile="+pageModel.getMobie();
			  PostData+="&content="+java.net.URLEncoder.encode("您的验证码是"+verification+"@(幸福假日)【畅卓科技】","utf-8");
			  String ret = Send.SMS(PostData, "http://sms.chanzor.com:8001/sms.aspx?action=send");
			  Tools.getSession().setAttribute("verification", verification);
			  System.out.println(ret);
			  System.out.println("第一个工具:"+ Xml2JsonUtil.xml2JSON(ret));
			  System.out.println("第二个工具:"+XmlJSON.xml2JSON(ret));
			  System.out.println("第二个工具的第二个方法:"+XmlJSON.getJSONFromXml(ret));
			  jo.put("message", XmlJSON.xml2JSON(ret));
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
         //out.println(PostData);
		 super.writeJSON(jo.toJSONString());
	  }
	
}
