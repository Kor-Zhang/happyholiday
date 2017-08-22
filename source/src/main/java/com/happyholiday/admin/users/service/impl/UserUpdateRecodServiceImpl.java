package com.happyholiday.admin.users.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.users.dao.UserUpdateRecordDaoI;
import com.happyholiday.admin.users.pageModel.PageUserUpdateRecord;
import com.happyholiday.admin.users.service.UserUpdateRecordServiceI;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.happyholiday.model.Adminupdaterecord;
import com.happyholiday.model.Userupdaterecord;

@Service(value = "userUpdateRecordService")
public class UserUpdateRecodServiceImpl implements UserUpdateRecordServiceI {
	private UserUpdateRecordDaoI userUpdateRecordDao;
	
	
	public UserUpdateRecordDaoI getUserUpdateRecordDao() {
		return userUpdateRecordDao;
	}
	@Autowired
	public void setUserUpdateRecordDao(UserUpdateRecordDaoI userUpdateRecordDao) {
		this.userUpdateRecordDao = userUpdateRecordDao;
	}

	@Override
	public BackReturnJSON<PageUserUpdateRecord> getDatagrid(Admins onlineAdmin,
			PageUserUpdateRecord pageModel)
			throws Exception {
		/**
		 * 1.判断当前用户是否拥有查询权限
		 * 2.执行
		 * 3.返回结果
		 */
		//验证804权限（查看用户更新日志的权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_QUERY_USER_UPDATE)){
			throw new AdminsException("您没有查看用户更新日志的权限！");
		}
		//2.查询
		BackReturnJSON<PageUserUpdateRecord> returnJSON = new BackReturnJSON<PageUserUpdateRecord>();
		Map<String,Object> params = BackTools.getHashMap();
		//hql语句
		StringBuffer totalHql = new StringBuffer("select count(*) from Userupdaterecord a where a.isDelete=false ");
		StringBuffer rowsHql = new StringBuffer("from Userupdaterecord a where a.isDelete=false ");
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
		List<Userupdaterecord> beanList = userUpdateRecordDao.get(rowsHql.toString(),params,pageModel.getPage(),pageModel.getRows());
		
		//转化模型
		List<PageUserUpdateRecord> tempRows = BackTools.copyPropertiesList(beanList, PageUserUpdateRecord.class);
		List<PageUserUpdateRecord> rows = BackTools.getArrayList();
		//设置PageUserUpdateRecord的userPhone属性和amindId,userId
		int index = 0;
		for (Userupdaterecord b : beanList) {
			PageUserUpdateRecord p = tempRows.get(index);
			p.setUserPhone(b.getUsers().getPhone());
			if(b.getAdmins()!=null){
				p.setAdminId(b.getAdmins().getId());
			}else{
				p.setAdminId("");
			}
			p.setUserId(b.getUsers().getId());
			rows.add(p);
			index++;
		}
		//查询total
		Integer total = userUpdateRecordDao.length(totalHql.toString(),params);

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
	private void setWhere(List<StringBuffer> hqls,PageUserUpdateRecord pageAdmin,Map<String,Object> params) {
		//判断是否筛选id
		if(pageAdmin.getSearchId()!=null&&!pageAdmin.getSearchId().trim().equals("")){
			//对list中的所有需要添加where的hql语句循环遍历
			for (StringBuffer hql : hqls) {
				hql.append(" and a.users.id like :searchId");
			}
			//填写参数
			params.put("searchId","%%"+pageAdmin.getSearchId()+"%%");
		}
	}
	
	
}
