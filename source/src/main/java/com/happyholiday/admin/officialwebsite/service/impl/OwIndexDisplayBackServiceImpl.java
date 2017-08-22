package com.happyholiday.admin.officialwebsite.service.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.officialwebsite.OwBackStatic;
import com.happyholiday.admin.officialwebsite.dao.OwIndexDisplayBackDaoI;
import com.happyholiday.admin.officialwebsite.exception.OfficialwebsiteBackException;
import com.happyholiday.admin.officialwebsite.pageModel.PageOwIndexDisplayBack;
import com.happyholiday.admin.officialwebsite.service.OwIndexDisplayBackServiceI;
import com.happyholiday.admin.officialwebsite.util.OwBackReturnJSON;
import com.happyholiday.admin.officialwebsite.util.OwBackTools;
import com.happyholiday.model.Admins;
import com.happyholiday.model.OfficialwebsiteIndexDisplay;
@Service(value="owIndexDisplayBackService")
public class OwIndexDisplayBackServiceImpl implements OwIndexDisplayBackServiceI{
	//注入owIndexDisplayBackDao
	private OwIndexDisplayBackDaoI owIndexDisplayBackDao;

	public OwIndexDisplayBackDaoI getOwIndexDisplayBackDao() {
		return owIndexDisplayBackDao;
	}
	@Autowired
	public void setOwIndexDisplayBackDao(OwIndexDisplayBackDaoI owIndexDisplayBackDao) {
		this.owIndexDisplayBackDao = owIndexDisplayBackDao;
	}
	@Override
	public OwBackReturnJSON<PageOwIndexDisplayBack> getDatagrid(Admins onlineAdmin,PageOwIndexDisplayBack pageModel)
			throws Exception {
		/**
		 * 1.判断当前用户是否拥有查询权限
		 * 2.执行
		 * 3.返回结果
		 */
		//验证1503权限（查看日常的权限）
		if(!OwBackTools.power(onlineAdmin.getId(),OwBackStatic.POWER_ID_QUERY_DISPLAY)){
			throw new OfficialwebsiteBackException("您没有查看日常的权限！");
		}
		//2.查询
		OwBackReturnJSON<PageOwIndexDisplayBack> retJSON = new OwBackReturnJSON<PageOwIndexDisplayBack>();
		Map<String,Object> params = OwBackTools.getHashMap();
		//hql语句，不查询当前用户和超级管理员们
		StringBuffer totalHql = new StringBuffer("select count(*) from "+OwBackStatic.HQL_TABLE_NAME_OFFICIALWEBSITE_IDNEX_DISPLAY+" t where t.isDelete=false ");
		StringBuffer rowsHql = new StringBuffer("from "+OwBackStatic.HQL_TABLE_NAME_OFFICIALWEBSITE_IDNEX_DISPLAY+" t where t.isDelete=false ");
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
		List<OfficialwebsiteIndexDisplay> beanList = owIndexDisplayBackDao.get(rowsHql.toString(),params,pageModel.getPage(),pageModel.getRows());
		//转化模型
		List<PageOwIndexDisplayBack> rows = OwBackTools.copyPropertiesList(beanList, PageOwIndexDisplayBack.class);
		
		//查询total
		Integer total = owIndexDisplayBackDao.length(totalHql.toString(),params);

		retJSON.setRows(rows);
		retJSON.setTotal(total);
		//3.返回结果
		return retJSON;
	}

	@Override
	public void deleteIndexDisplays(Admins onlineAdmin,
			PageOwIndexDisplayBack pageModel) throws Exception {
		//验证1502权限（删除日常的权限）
		if(!OwBackTools.power(onlineAdmin.getId(),OwBackStatic.POWER_ID_DELETE_DISPLAY)){
			throw new AdminsException("您没有删除日常的权限！");
		}
		// 2.删除
		String[] deleteIds = pageModel.getDeleteIds().split(",");
		for (String deleteId : deleteIds) {

			OfficialwebsiteIndexDisplay owIndexDisplay = owIndexDisplayBackDao
					.findById(OfficialwebsiteIndexDisplay.class, deleteId);
			owIndexDisplay.setIsDelete(true);
			// 记录下imgname
			String imgName = owIndexDisplay.getImgName();

			// 删除数据库
			owIndexDisplayBackDao.update(owIndexDisplay);

			// 删除文件图片
			/* Tools.deleteFile(Static.USERS_HEAD_PATH, imgName); */

		}
	}
	@Override
	public void uploadIndexDisplay(Admins onlineAdmin,
			PageOwIndexDisplayBack pageModel)
			throws Exception {
		//验证1501权限（增加日常的权限）
		if(!OwBackTools.power(onlineAdmin.getId(),OwBackStatic.POWER_ID_ADD_DISPLAY)){
			throw new OfficialwebsiteBackException("您没有增加日常的权限！");
		}
		String imgName = null;
		try {

			String uuid = UUID.randomUUID().toString();
			
			//写入文件
			imgName = OwBackTools.writeUploadSingleFileToDSK(uuid,OwBackStatic.OFFICIALWEBSITE_IDNEX_DISPLAY_IMG_PATH, pageModel);

			//写入数据库操作
			//设置储存实体的信息
			OfficialwebsiteIndexDisplay owIndexDisplay = new OfficialwebsiteIndexDisplay();
			BeanUtils.copyProperties(pageModel, owIndexDisplay);
			Timestamp currtTime = new Timestamp(new Date().getTime());
			owIndexDisplay.setCreateTime(currtTime);
			owIndexDisplay.setUpdateTime(currtTime);
			//获取后缀
			owIndexDisplay.setId(uuid);
			owIndexDisplay.setImgName(imgName);
			owIndexDisplay.setIsDelete(false);
			//写入数据库
			owIndexDisplayBackDao.save(owIndexDisplay);
		} catch (Exception e) {
			e.printStackTrace();
			OwBackTools.deleteFile(OwBackStatic.OFFICIALWEBSITE_IDNEX_DISPLAY_IMG_PATH,imgName);
			throw new OfficialwebsiteBackException("上传错误！");
		} 
	}
	@Override
	public void updateIndexDisplay(Admins onlineAdmin,
			PageOwIndexDisplayBack pageModel) throws Exception {
		//验证1504权限（更新日常的权限）
		if(!OwBackTools.power(onlineAdmin.getId(),OwBackStatic.POWER_ID_UPDATE_DISPLAY)){
			throw new OfficialwebsiteBackException("您没有更新日常的权限！");
		}
		String imgName = null;
		try {
			//获取数据库的实体的信息
			OfficialwebsiteIndexDisplay dbOwIndexDisplay = owIndexDisplayBackDao.findById(OfficialwebsiteIndexDisplay.class, pageModel.getId());
			//验证
			if(dbOwIndexDisplay==null||dbOwIndexDisplay.getIsDelete()==true){
				throw new OfficialwebsiteBackException("该轮播条目不存在！");
			}
			//写入文件
			//判断是否上传文件，如果没有上传文件，那么imgName==null
			if(null != pageModel.getUploadFile()){
				//获取旧图片
				String oldImgName = dbOwIndexDisplay.getImgName();
				//删除旧文件
				OwBackTools.deleteFile(OwBackStatic.OFFICIALWEBSITE_IDNEX_DISPLAY_IMG_PATH, oldImgName);
				
				//获取文件的id
				String uuid = dbOwIndexDisplay.getId();
				//写入新文件
				imgName = OwBackTools.writeUploadSingleFileToDSK(uuid,OwBackStatic.OFFICIALWEBSITE_IDNEX_DISPLAY_IMG_PATH,pageModel);
			}
			
			//写入数据库
			//设置文件名
			if(null != imgName){
				
				dbOwIndexDisplay.setImgName(imgName);
			}
			//设置说明
			dbOwIndexDisplay.setIntroduction(pageModel.getIntroduction());
			//设置状态
			dbOwIndexDisplay.setStatus(pageModel.getStatus());
			//设置最后更新时间
			dbOwIndexDisplay.setUpdateTime(new Timestamp(new Date().getTime()));
			//写入数据库
			owIndexDisplayBackDao.update(dbOwIndexDisplay);
		} catch (Exception e) {
			//出现异常，那么刚才上传的删除文件
			OwBackTools.deleteFile(OwBackStatic.OFFICIALWEBSITE_IDNEX_CAROUSEL_IMG_PATH, imgName);
			e.printStackTrace();
			throw e;
		}
		
	}
	
}
