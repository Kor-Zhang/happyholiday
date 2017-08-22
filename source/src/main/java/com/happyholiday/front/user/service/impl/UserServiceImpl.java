package com.happyholiday.front.user.service.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.happyholiday.front.user.Static;
import com.happyholiday.front.user.dao.UserDaoI;
import com.happyholiday.front.user.dao.UserLoginRecordDaoI;
import com.happyholiday.front.user.dao.UserUpdateRecordDaoI;
import com.happyholiday.front.user.pageModel.PageUsers;
import com.happyholiday.front.user.service.UserServiceI;
import com.happyholiday.front.user.util.Encrypt;
import com.happyholiday.front.user.util.Tools;
import com.happyholiday.model.Userloginrecord;
import com.happyholiday.model.Users;
import com.happyholiday.model.Userupdaterecord;
@Service(value="frontUserService")
public class UserServiceImpl implements UserServiceI{
	// 手机正则表达式
	private String pattern = "^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
	
	//配置dao
	private  UserDaoI frontUserDao;
	private  UserLoginRecordDaoI frontUserLoginRecordDao;
	private UserUpdateRecordDaoI frontUserUpdateRecordDao;
	
	
	
	public UserDaoI getFrontUserDao() {
		return frontUserDao;
	}
	@Autowired
	public void setFrontUserDao(UserDaoI frontUserDao) {
		this.frontUserDao = frontUserDao;
	}

	public UserLoginRecordDaoI getFrontUserLoginRecordDao() {
		return frontUserLoginRecordDao;
	}
	@Autowired
	public void setFrontUserLoginRecordDao(
			UserLoginRecordDaoI frontUserLoginRecordDao) {
		this.frontUserLoginRecordDao = frontUserLoginRecordDao;
	}

	public UserUpdateRecordDaoI getFrontUserUpdateRecordDao() {
		return frontUserUpdateRecordDao;
	}
	@Autowired
	public void setFrontUserUpdateRecordDao(
			UserUpdateRecordDaoI frontUserUpdateRecordDao) {
		this.frontUserUpdateRecordDao = frontUserUpdateRecordDao;
	}

	@Override
	public void updatePwd(PageUsers pageModel) throws Exception {
		// TODO Auto-generated method stub
		// TODO 自动生成的方法存根
			//获取session在线用户
			Users onlineUser = Tools.getSessionObject(Static.ONLINE_USER);
			//提取初始密码 判断初始密码是否正确
			
			if(!onlineUser.getPassword().equals(Encrypt.e(pageModel.getOldPassword()))){
				throw new Exception("原密码输入错误");
			}
			onlineUser.setPassword(Encrypt.e(pageModel.getNewPassword()));
			frontUserDao.update(onlineUser);
			this.addUpdateRecord(onlineUser, "修改密码");
	}

	@Override
	public void updateInfo(PageUsers pageModel) throws Exception {
		// TODO Auto-generated method stub
		// TODO 自动生成的方法存根
		//获取session在线用户
				Users onlineUser = Tools.getSessionObject(Static.ONLINE_USER);
		//更新用户信息
				onlineUser.setRealName(pageModel.getRealName());
				onlineUser.setUserName(pageModel.getUserName());
				onlineUser.setCardClazz(pageModel.getCardClazz());
				onlineUser.setCardNumber(pageModel.getCardNumber());
		//执行更新
				frontUserDao.update(onlineUser);
				this.addUpdateRecord(onlineUser, "修改用户信息");
	}

	@Override
	public void updateInfoByOrder(PageUsers pageModel) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void forgetPwd(PageUsers pageModel) throws Exception {
		// TODO Auto-generated method stub
		// TODO 自动生成的方法存根
		//判断是否注册
		String hql = "from Users u where u.phone=:phone ";
		Users user = frontUserDao.find(hql,
				Tools.getHashMap(new String[] { "phone" },
						new Object[] { pageModel.getPhone() }));
		if (user == null) {
			throw new Exception("该手机暂未注册");
		}else{
			//存在 就修改该用户的密码
			user.setPassword(Encrypt.e(pageModel.getNewPassword()));
			frontUserDao.update(user);
			this.addUpdateRecord(user, "修改密码");
		}	
	}

	@Override
	public Object[] usersLogin(PageUsers pageModel) throws Exception {
		// TODO Auto-generated method stub
		// TODO 自动生成的方法存根
				String hql = "from Users u where u.phone=:phone and u.password=:password";
				if (pageModel.getPhone().equals("")) {
					throw new Exception("请输入手机号");
				}
				if (!pageModel.getPhone().matches(pattern)) {
					throw new Exception("手机格式错误");
				}
				if (pageModel.getPassword().equals("")) {
					throw new Exception("请输入密码");
				}
				Users user = frontUserDao.find(hql, Tools.getHashMap(new String[] {
						"phone", "password" }, new Object[] { pageModel.getPhone(),
						Encrypt.e(pageModel.getPassword()) }));
				if (user == null) {
					throw new Exception("账号密码输入错误");
				}
				//写入登录记录
				Userloginrecord url = this.addLoginRecord(user);
				return new  Object[]{user,url};
	}

	@Override
	public Users usersRegister(PageUsers pageModel) throws Exception {
		// TODO Auto-generated method stub
		// TODO 自动生成的方法存根
				String hql = "from Users u where u.phone=:phone ";
				Users user = frontUserDao.find(hql,
						Tools.getHashMap(new String[] { "phone" },
								new Object[] { pageModel.getPhone() }));
				if (user != null) {
					throw new Exception("手机号已经存在");
				}
				//设置user属性
				user = new Users();
				BeanUtils.copyProperties(pageModel, user);
				user.setId(UUID.randomUUID().toString());
				user.setPassword(Encrypt.e(pageModel.getPassword()));
				user.setHead("default.png");
				user.setIsDelete(false);
				user.setStatus(1);
				user.setRole(0);
				//写入登录记录
				frontUserDao.save(user);
				Userloginrecord url = this.addLoginRecord(user);
				return user;
	}

	@Override
	public void usersLogout() throws Exception {
		// TODO Auto-generated method stub
		//更新登出记录
				Userloginrecord ulr =Tools.getSessionObject(Static.userLoginRecordSessionName);
				if(ulr!=null){
					ulr.setLogoffTime(new Timestamp(new Date().getTime()));
					frontUserLoginRecordDao.update(ulr);	
				}
				//销毁会话
				Tools.getSession().invalidate();
	}

	@Override
	public Users getUserInfo(String phone) throws Exception {
		// TODO Auto-generated method stub
		// TODO 自动生成的方法存根
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("phone", phone);
		String hql = "from Users u where u.phone=:phone ";
		Users user = frontUserDao.find(hql,map);
		if(user == null){
			throw new Exception("获取信息失败......");
		}
		return user ;
	}

	
	/**********************/
	/**
	 * 添加 登录记录
	 * @param user
	 * @return 返回记录
	 */
	public Userloginrecord addLoginRecord(Users user){
		Userloginrecord ulr = new Userloginrecord();
		//生成记录的属性
		ulr.setLoginRecordId(UUID.randomUUID().toString());
		ulr.setUsers(user);
		ulr.setLoginTime(new Timestamp(new Date().getTime()));
		ulr.setLogoffTime(new Timestamp(new Date().getTime()));
		
		//获取ID
		String ip= Tools.getInternetIp(Tools.getReq());
		String address = "";
		JSONObject addressJson = null;
		if(ip.equals("0:0:0:0:0:0:0:1")){
			address = "本机";
		}else{
			/*{"address":"CN|湖南|张家界|None|CHINANET|0|0","content":{"address_detail":{"province":"湖南省","city":"张家界市","district":"","street":"","street_number":"","city_code":312},"address":"湖南省张家界市","point":{"y":"3370564.53","x":"12298891.52"}},"status":0}*/
			//获取地理位置
			try{
				addressJson = Tools.readJsonFromUrl("http://api.map.baidu.com/location/ip?ak=F454f8a5efe5e577997931cc01de3974&ip="+ip);
				address = (String) JSONObject.parseObject(addressJson.getString("content")).get("address");
			}catch(Exception e1){
				//如果获取位置异常，那么为地理位置
				address = "未知";
			}
		}
		
		ulr.setLoginAddress(address);
		ulr.setLoginIp(ip);
		ulr.setIsDelete(false);
		frontUserLoginRecordDao.save(ulr);
		return ulr;
	}
	
	/**
	 * 添加修改记录
	 * @param user
	 * @param content 修改的操作名字 例如修改密码
	 */
	public void addUpdateRecord(Users user,String content){
		Userupdaterecord uur = new Userupdaterecord();
		//生成记录属性
		uur.setUpdateRecordId(UUID.randomUUID().toString());
		uur.setAdmins(null);
		uur.setUsers(user);
		uur.setUpdateTime(new Timestamp(new Date().getTime()));
		uur.setItem(content);
		uur.setIsDelete(false);
		//更新
		frontUserUpdateRecordDao.save(uur);
	}
	@Override
	public Object[] userLoginByPhone(PageUsers pageModel) throws Exception {
		// TODO Auto-generated method stub
		//验证手机号是否注册
		Users user =  frontUserDao.find("from Users where phone ="+pageModel.getPhoneTwo());
		System.out.println("user:"+user);
		if(user==null){
			System.out.println("我来了");
			//如果没有注册 直接注册
			user = new Users();
			user.setPhone(pageModel.getPhoneTwo());
			user.setId(UUID.randomUUID().toString());
			user.setPassword(Encrypt.e("123456")); //初始化密码
			user.setHead("default.png");
			user.setIsDelete(false);
			user.setStatus(1);
			user.setRole(0);
			//写入登录记录
			frontUserDao.save(user);
			Userloginrecord url = this.addLoginRecord(user);
			return new  Object[]{user,url};
		}else{
			//如果已经注册 直接登录
			//写入登录记录
			Userloginrecord url = this.addLoginRecord(user);
			return new  Object[]{user,url};
		}
		
	}
}
