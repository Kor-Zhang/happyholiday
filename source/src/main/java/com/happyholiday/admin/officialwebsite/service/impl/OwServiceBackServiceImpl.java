package com.happyholiday.admin.officialwebsite.service.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.admin.officialwebsite.OwBackStatic;
import com.happyholiday.admin.officialwebsite.dao.OwServiceBackDaoI;
import com.happyholiday.admin.officialwebsite.exception.OfficialwebsiteBackException;
import com.happyholiday.admin.officialwebsite.pageModel.PageOwServiceBack;
import com.happyholiday.admin.officialwebsite.pageModel.PageOwServiceBack;
import com.happyholiday.admin.officialwebsite.service.OwServiceBackServiceI;
import com.happyholiday.admin.officialwebsite.util.OwBackReturnJSON;
import com.happyholiday.admin.officialwebsite.util.OwBackTools;
import com.happyholiday.model.Admins;
import com.happyholiday.model.OfficialwebsiteService;
import com.happyholiday.model.OfficialwebsiteService;
@Service(value="owServiceBackService")
public class OwServiceBackServiceImpl implements OwServiceBackServiceI{
	//注入owServiceBackDao
	private OwServiceBackDaoI owServiceBackDao;
	
	
	

	public OwServiceBackDaoI getOwServiceBackDao() {
		return owServiceBackDao;
	}
	@Autowired
	public void setOwServiceBackDao(OwServiceBackDaoI owServiceBackDao) {
		this.owServiceBackDao = owServiceBackDao;
	}
	@Override
	public OwBackReturnJSON<PageOwServiceBack> getDatagrid(Admins onlineAdmin,
			PageOwServiceBack pageModel) throws Exception {
		/**
		 * 1.判断当前用户是否拥有查询权限
		 * 2.执行
		 * 3.返回结果
		 */
		//验证1603权限（查看业务的权限）
		if(!OwBackTools.power(onlineAdmin.getId(),OwBackStatic.POWER_ID_QUERY_SERVICE)){
			throw new OfficialwebsiteBackException("您没有查看业务的权限！");
		}
		//2.查询
		OwBackReturnJSON<PageOwServiceBack> retJSON = new OwBackReturnJSON<PageOwServiceBack>();
		Map<String,Object> params = OwBackTools.getHashMap();
		//hql语句，不查询当前用户和超级管理员们
		StringBuffer totalHql = new StringBuffer("select count(*) from "+OwBackStatic.HQL_TABLE_NAME_OFFICIALWEBSITE_SERVICE+" t where t.isDelete=false ");
		StringBuffer rowsHql = new StringBuffer("from "+OwBackStatic.HQL_TABLE_NAME_OFFICIALWEBSITE_SERVICE+" t where t.isDelete=false ");
		//设置where条件
		//list储存需要添加where条件的hql语句
		List<StringBuffer> hqls = OwBackTools.getArrayList();
		//设置需要添加where的语句
		hqls.add(totalHql);
		hqls.add(rowsHql);
		//添加wehre
		OwBackTools.setSearchWhere(hqls, pageModel, params);
		OwBackTools.setSortOrder(hqls, pageModel);
		//查询记录
		List<OfficialwebsiteService> beanList = owServiceBackDao.get(rowsHql.toString(),params,pageModel.getPage(),pageModel.getRows());
		//转化模型
		List<PageOwServiceBack> rows = OwBackTools.copyPropertiesList(beanList, PageOwServiceBack.class);
		for (PageOwServiceBack p : rows) {
			String newString = OwBackTools.cleanStringWrap(p.getText());
			p.setText(newString);
		}
		//查询total
		Integer total = owServiceBackDao.length(totalHql.toString(),params);

		retJSON.setRows(rows);
		retJSON.setTotal(total);
		//3.返回结果
		return retJSON;
	}
	@Override
	public void uploadTextService(Admins onlineAdmin,
			PageOwServiceBack pageModel) throws Exception {
		//验证1601权限（增加业务的权限）
		if(!OwBackTools.power(onlineAdmin.getId(),OwBackStatic.POWER_ID_ADD_SERVICE)){
			throw new OfficialwebsiteBackException("您没有增加业务的权限！");
		}
		//初始化存储实体
		OfficialwebsiteService owService = new OfficialwebsiteService();
		
		//设置参数
		Timestamp currtTime = new Timestamp(new Date().getTime());
		owService.setCreateTime(currtTime);
		owService.setUpdateTime(currtTime);
		owService.setId(UUID.randomUUID().toString());
		owService.setIsDelete(false);
		owService.setStatus(pageModel.getStatus());
		owService.setTitle(pageModel.getTitle());
		//清除\r\n
		String newString = OwBackTools.cleanStringWrap(pageModel.getText());
		owService.setText(newString);
		owServiceBackDao.save(owService);
	}
	@Override
	public void updateTextService(Admins onlineAdmin,
			PageOwServiceBack pageModel) throws Exception {
		//验证1604权限（更改业务的权限）
		if(!OwBackTools.power(onlineAdmin.getId(),OwBackStatic.POWER_ID_UPDATE_SERVICE)){
			throw new OfficialwebsiteBackException("您没有更新业务的权限！");
		}
		//初始化存储实体
		OfficialwebsiteService dbOwService = owServiceBackDao.findById(OfficialwebsiteService.class, pageModel.getId());
		//储存新信息
		dbOwService.setStatus(pageModel.getStatus());
		//清除\r\n
		String newString = OwBackTools.cleanStringWrap(pageModel.getText());
		dbOwService.setText(newString);
/*		dbOwService.setText(pageModel.getText());
*/		dbOwService.setTitle(pageModel.getTitle());
		//设置参数
		owServiceBackDao.save(dbOwService);
		
	}
	@Override
	public void deleteService(Admins onlineAdmin, PageOwServiceBack pageModel)
			throws Exception {
		//验证1602权限（删除业务的权限）
		if(!OwBackTools.power(onlineAdmin.getId(),OwBackStatic.POWER_ID_DELETE_SERVICE)){
			throw new OfficialwebsiteBackException("您没有删除业务的权限！");
		}
		// 2.删除
		String[] deleteIds = pageModel.getDeleteIds().split(",");
		for (String deleteId : deleteIds) {

			OfficialwebsiteService owService = owServiceBackDao.findById(OfficialwebsiteService.class, deleteId);
			owService.setIsDelete(true);
			// 记录下imgname
			/*String imgName = owService.getImgName();*/

			// 删除数据库
			owServiceBackDao.update(owService);

			// 删除文件图片
			/* Tools.deleteFile(Static.USERS_HEAD_PATH, imgName); */

		}
		
	}



}
