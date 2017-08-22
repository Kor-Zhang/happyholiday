package com.happyholiday.admin.users.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.dao.AdminLoginRecordDaoI;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.pageModel.PageAdminLoginRecord;
import com.happyholiday.admin.service.AdminLoginRecordServiceI;
import com.happyholiday.admin.users.dao.UserLoginRecordDaoI;
import com.happyholiday.admin.users.pageModel.PageUserLoginRecord;
import com.happyholiday.admin.users.service.UserLoginRecordServiceI;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Adminloginrecord;
import com.happyholiday.model.Admins;
import com.happyholiday.model.Userloginrecord;

@Service(value = "userLoginRecordService")
public class UserLoginRecodServiceImpl implements UserLoginRecordServiceI {
	//注入userLoginRecordDao
	private UserLoginRecordDaoI userLoginRecordDao;
	
	public UserLoginRecordDaoI getUserLoginRecordDao() {
		return userLoginRecordDao;
	}
	@Autowired
	public void setUserLoginRecordDao(UserLoginRecordDaoI userLoginRecordDao) {
		this.userLoginRecordDao = userLoginRecordDao;
	}
	
	@Override
	public BackReturnJSON<PageUserLoginRecord> getDatagrid(Admins onlineAdmin,
			PageUserLoginRecord pageModel) throws Exception {
		
		/**
		 * 1.判断当前用户是否拥有查询权限
		 * 2.执行
		 * 3.返回结果
		 */
		//验证803权限（查看用户登陆记录权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_QUERY_USER_LOGIN)){
			throw new AdminsException("您没有查看用户登陆记录权限！");
		}
		//2.查询
		BackReturnJSON<PageUserLoginRecord> returnJSON = new BackReturnJSON<PageUserLoginRecord>();
		Map<String,Object> params = BackTools.getHashMap();
		//hql语句
		StringBuffer totalHql = new StringBuffer("select count(*) from Userloginrecord a where a.isDelete=false ");
		StringBuffer rowsHql = new StringBuffer("from Userloginrecord a where a.isDelete=false");
		//设置where条件
		//list储存需要添加where条件的hql语句
		List<StringBuffer> hqls = BackTools.getArrayList();
		//设置需要添加where的语句
		hqls.add(totalHql);
		hqls.add(rowsHql);
		//添加wehre
		setWhere(hqls, pageModel, params);
		//如果排序,拼筹hql
		if(pageModel.getSort()!=null&&!pageModel.getSort().trim().equals("")&&pageModel.getOrder()!=null&&!pageModel.getOrder().trim().equals("")){
			rowsHql.append( " order by "+pageModel.getSort()+" "+pageModel.getOrder());
		}
		//查询记录
		List<Userloginrecord> beanList = userLoginRecordDao.get(rowsHql.toString(),params,pageModel.getPage(),pageModel.getRows());
		
		//转化模型
		List<PageUserLoginRecord> tempRows = BackTools.copyPropertiesList(beanList, PageUserLoginRecord.class);
		List<PageUserLoginRecord> rows = BackTools.getArrayList();
		//设置PageUserLoginRecord的userId属性
		int index = 0;
		for (Userloginrecord b : beanList) {
			PageUserLoginRecord p = tempRows.get(index);
			p.setUserPhone(b.getUsers().getPhone());
			p.setUserId(b.getUsers().getId());
			rows.add(p);
			index++;
		}
		//查询total
		Integer total = userLoginRecordDao.length(totalHql.toString(),params);

		returnJSON.setRows(rows);
		returnJSON.setTotal(total);
		//3.返回结果
		return returnJSON;
	}
	
	/**
	 * 设置where条件
	 * @param hqls
	 * @param pageAdmin
	 * @param params
	 */
	private void setWhere(List<StringBuffer> hqls,PageUserLoginRecord pageAdmin,Map<String,Object> params) {
		//判断是否筛选id
		if(pageAdmin.getSearchId()!=null&&!pageAdmin.getSearchId().trim().equals("")){
			//对list中的所有需要添加where的hql语句循环遍历
			for (StringBuffer hql : hqls) {
				hql.append(" and a.userId like :searchId");
			}
			//填写参数
			params.put("searchId","%%"+pageAdmin.getSearchId()+"%%");
		}
	}
	
	
}
