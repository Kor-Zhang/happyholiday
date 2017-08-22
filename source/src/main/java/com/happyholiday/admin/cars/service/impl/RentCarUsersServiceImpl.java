package com.happyholiday.admin.cars.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.cars.dao.RentCarUsersDaoI;
import com.happyholiday.admin.cars.pageModel.PageRentCarUsers;
import com.happyholiday.admin.cars.service.RentCarUsersServiceI;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.users.pageModel.PageUserLoginRecord;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.happyholiday.model.Rentcarusers;
import com.happyholiday.model.Userloginrecord;
@Service(value="rentCarUsersService")
public class RentCarUsersServiceImpl implements RentCarUsersServiceI{
	private RentCarUsersDaoI rentCarUsersDao;
	
	public RentCarUsersDaoI getRentCarUsersDao() {
		return rentCarUsersDao;
	}
	@Autowired
	public void setRentCarUsersDao(RentCarUsersDaoI rentCarUsersDao) {
		this.rentCarUsersDao = rentCarUsersDao;
	}

	@Override
	public BackReturnJSON<PageRentCarUsers> getSingleRentCarUserDatagridById(
			Admins onlineAdmin, PageRentCarUsers pageModel)
			throws AdminsException {
		/*//验证503权限（查看租车费用权限）
		if(!Tools.power(onlineAdmin.getId(),Static.POWER_ID_QUERY_COST)){
			throw new AdminsException("您没有查看租车费用权限！");
		}*/
		//执行业务
		//2.查询
		BackReturnJSON<PageRentCarUsers> returnJSON = new BackReturnJSON<PageRentCarUsers>();
		List<Rentcarusers> beanList = rentCarUsersDao.get("from Rentcarusers t where t.isDelete=false and t.id=:id",BackTools.getHashMap(new String[]{"id"}, new Object[]{pageModel.getId()}));
		
		//转化模型
		List<PageRentCarUsers> rows = BackTools.copyPropertiesList(beanList, PageRentCarUsers.class);

		returnJSON.setRows(rows);
		returnJSON.setTotal(rows.size());
		//3.返回结果
		return returnJSON;
	}
		
	
}
