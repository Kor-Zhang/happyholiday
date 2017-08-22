package com.happyholiday.admin.users.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.druid.support.logging.Log;
import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.dao.ImgsDaoI;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.users.dao.UsersDaoI;
import com.happyholiday.admin.users.exception.UsersException;
import com.happyholiday.admin.users.pageModel.PageUsers;
import com.happyholiday.admin.users.pageModel.PageUsersUpload;
import com.happyholiday.admin.users.pageModel.PageUsersUploadHead;
import com.happyholiday.admin.users.service.UsersServiceI;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.happyholiday.model.Imgs;
import com.happyholiday.model.Users;
import com.happyholiday.util.Encrypt;
import com.mysql.jdbc.Util;
@Service(value="usersService")
public class UsersServiceImpl implements UsersServiceI{
	//手机正则表达式
	private String pattern = "^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
	//注入imgsDao
	private ImgsDaoI imgsDao;
	
	
	public ImgsDaoI getImgsDao() {
		return imgsDao;
	}
	@Autowired
	public void setImgsDao(ImgsDaoI imgsDao) {
		this.imgsDao = imgsDao;
	}
	//注入usersDao
	private UsersDaoI usersDao;
	
	public UsersDaoI getUsersDao() {
		return usersDao;
	}
	@Autowired
	public void setUsersDao(UsersDaoI usersDao) {
		this.usersDao = usersDao;
	}
	@Override
	public BackReturnJSON<PageUsers> getDatagrid(Admins onlineAdmin,
			PageUsers pageModel) throws Exception {
		/**
		 * 1.判断当前用户是否拥有查询权限
		 * 2.执行
		 * 3.返回结果
		 */
		//验证301权限（查查看用户的权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_QUERY_USER)){
			throw new AdminsException("您没有查看用户的权限！");
		}
		//2.查询
		BackReturnJSON<PageUsers> returnJSON = new BackReturnJSON<PageUsers>();
		Map<String,Object> params = BackTools.getHashMap();
		//hql语句
		StringBuffer totalHql = new StringBuffer("select count(*) from Users t where t.isDelete=false ");
		StringBuffer rowsHql = new StringBuffer("from Users t where t.isDelete=false");
		//设置where条件
		//list储存需要添加where条件的hql语句
		List<StringBuffer> hqls = BackTools.getArrayList();
		//设置需要添加where的语句
		hqls.add(totalHql);
		hqls.add(rowsHql);
		//添加wehre
		BackTools.setSearchWhere(hqls, pageModel, params);
		BackStatic.log.info(rowsHql);
		//如果排序,拼筹hql
		if(pageModel.getSort()!=null&&!pageModel.getSort().trim().equals("")&&pageModel.getOrder()!=null&&!pageModel.getOrder().trim().equals("")){
			rowsHql.append( " order by "+pageModel.getSort()+" "+pageModel.getOrder());
		}
		//查询记录
		List<Users> beanList = usersDao.get(rowsHql.toString(),params,pageModel.getPage(),pageModel.getRows());
		
		//转化模型
		List<PageUsers> rows = BackTools.copyPropertiesList(beanList, PageUsers.class);
	
		//查询total
		Integer total = usersDao.length(totalHql.toString(),params);

		BackStatic.log.info(total);
		returnJSON.setRows(rows);
		returnJSON.setTotal(total);
		//3.返回结果
		return returnJSON;
	}
	
	@Override
	public void updateHead(Admins onlineAdmin, PageUsersUploadHead pageModel)
			throws Exception {
		
		//验证304权限（更新用户的权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_UPDATE_USER)){
			throw new AdminsException("您没有更新用户的权限！");
		}
		//获取上传文件信息
		File uploadFile = pageModel.getUploadFile();
		//上传的文件类型
		String uploadFilesContentType = pageModel.getUploadFileContentType();
		//文件后缀
		String ext = uploadFilesContentType.split("/")[1];
		//查询该用户头像图片的name
		Users dbUser = usersDao.find("from Users t where t.id = :id", BackTools.getHashMap(new String[]{"id"}, new Object[]{pageModel.getId()}));
		//获取头像名称
		String head = dbUser.getHead();
		//删除头像
		BackTools.deleteFile(BackStatic.USERS_HEAD_PATH, head);
		//更新数据库
		String newHead = UUID.randomUUID().toString()+"."+ext;
		dbUser.setHead(newHead);
		usersDao.update(dbUser);
		//保存新的头像文件
		BackTools.writeFile(uploadFile,BackStatic.USERS_HEAD_PATH,newHead);
		
	}
	@Override
	public void editUsers(Admins onlineAdmin,
			PageUsers pageModel) throws Exception {
		//验证304权限（更新用户的权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_UPDATE_USER)){
			throw new AdminsException("您没有更新用户的权限！");
		}
		
		//修改信息
		Users bDUsers = usersDao.findById(Users.class,pageModel.getId());
		BeanUtils.copyProperties(pageModel, bDUsers,new String[]{"id","password","head","isDelete"});
	}
	@Override
	public void deleteUsers(Admins onlineAdmin, PageUsers pageModel)
			throws Exception {
		//验证302权限（删除用户的权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_DELETE_USER)){
			throw new AdminsException("您没有删除用户的权限！");
		}
		//2.删除
		String[] deleteIds = pageModel.getDeleteIds().split(",");
		for (String deleteId : deleteIds) {
			
			
			//获取head
			Users user = usersDao.findById(Users.class,deleteId);
			user.setId(deleteId);
			//记录下head
			String head = user.getHead();
			
			//删除数据库user
			user.setIsDelete(true);
			usersDao.update(user);
			
			//删除文件图片
			/*Tools.deleteFile(Static.USERS_HEAD_PATH, head);*/
			
		}
	}
	@Override
	public void editUsersPwd(Admins onlineAdmin, PageUsers pageModel)
			throws Exception {
		//验证304权限（更新用户的权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_UPDATE_USER)){
			throw new AdminsException("您没有更新用户的权限！");
		}
		//判断密码格式
		if(!pageModel.getPassword().matches("[A-Za-z0-9._]{10,15}")){
			throw new AdminsException("密码格式只包含字母数字下划线和点[A-Za-z0-9._]！");
		}
		//添加
		Users dBUser = usersDao.findById(Users.class,pageModel.getId());
		dBUser.setPassword(Encrypt.e(pageModel.getPassword()));
		usersDao.update(dBUser);
	}
	@Override
	public void usersUpload(Admins onlineAdmin, PageUsersUpload pageModel)
			throws Exception {
		//验证303权限（添加用户的权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_ADD_USER)){
			throw new AdminsException("您没有添加用户的权限！");
		}
		//验证该user是否存在
		Users dBUser = usersDao.find("from Users t where t.phone = :phone",BackTools.getHashMap(new String[]{"phone"}, new Object[]{pageModel.getPhone()}));
		if(dBUser!=null){
			throw new UsersException("该用户已存在！");
		}
		//获取后缀
		String ext = pageModel.getUploadFileContentType().split("/")[1];
		//生成uuid
		String uuid = UUID.randomUUID().toString();
		//获取head
		String head = uuid+"."+ext;
		//生成需要插入数据库的对象
		Users user = new Users();
		//设置参数
		BeanUtils.copyProperties(pageModel, user,new String[]{"password"});
		//加密密码
		user.setPassword(Encrypt.e(pageModel.getPassword()));
		user.setIsDelete(false);
		user.setHead(head);
		user.setId(uuid);
		usersDao.save(user);
		//写入文件
		BackTools.writeFile(pageModel.getUploadFile(), BackStatic.USERS_HEAD_PATH, head);
		
	}
	
	@Override
	public BackReturnJSON<PageUsers> getSingleUserDatagridById(Admins onlineAdmin,
			PageUsers pageModel) throws Exception {
		//验证301权限（查查看用户的权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_QUERY_USER)){
			throw new AdminsException("您没有查看用户的权限！");
		}
		//查找数据
		BackReturnJSON<PageUsers> returnJSON = new BackReturnJSON<PageUsers>();
		List<Users> sourceList = usersDao.get("from Users a where a.isDelete=false and id=:id",BackTools.getHashMap(new String[]{"id"}, new Object[]{pageModel.getId()}));
		List<PageUsers> rows = BackTools.copyPropertiesList(sourceList, PageUsers.class);
		returnJSON.setRows(rows);
		returnJSON.setTotal(rows.size());
		return returnJSON;
	}
	@Override
	public Users getUserById(String userId) {
		return usersDao.findById(Users.class, userId);
	}
	@Override
	public void editUserRole(Admins onlineAdmin, PageUsers pageModel) throws Exception{
		//验证304权限（更新用户的权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_UPDATE_USER)){
			throw new AdminsException("您没有更新用户的权限！");
		}
		Users dbUser =usersDao.findById(Users.class, pageModel.getId());
		
		//先拒绝，后确认，是不允许这样操作的（必须等待用户再次提交导游资格申请）
		if(dbUser.getRole()==BackStatic.USERS_ROLE_APPLY_GUIDE_REFUSE
				&&pageModel.getRole()==BackStatic.USERS_ROLE_APPLY_GUIDE){
			throw new UsersException("不能对已经拒绝的用户再次认证！");
		}
		
		dbUser.setRole(pageModel.getRole());
		usersDao.update(dbUser);
	}
	
	
}
