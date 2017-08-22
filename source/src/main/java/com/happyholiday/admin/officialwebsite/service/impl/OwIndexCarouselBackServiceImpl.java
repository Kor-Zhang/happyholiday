package com.happyholiday.admin.officialwebsite.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.officialwebsite.OwBackStatic;
import com.happyholiday.admin.officialwebsite.dao.OwIndexCarouselBackDaoI;
import com.happyholiday.admin.officialwebsite.exception.OfficialwebsiteBackException;
import com.happyholiday.admin.officialwebsite.pageModel.PageOwIndexCarouselBack;
import com.happyholiday.admin.officialwebsite.service.OwIndexCarouselBackServiceI;
import com.happyholiday.admin.officialwebsite.util.OwBackReturnJSON;
import com.happyholiday.admin.officialwebsite.util.OwBackTools;
import com.happyholiday.model.Admins;
import com.happyholiday.model.OfficialwebsiteIndexCarousel;
@Service(value="owIndexCarouselBackService")
public class OwIndexCarouselBackServiceImpl implements OwIndexCarouselBackServiceI{
	//注入owIndexCarouselBackDao
	private OwIndexCarouselBackDaoI owIndexCarouselBackDao;

	public OwIndexCarouselBackDaoI getOwIndexCarouselBackDao() {
		return owIndexCarouselBackDao;
	}
	@Autowired
	public void setOwIndexCarouselBackDao(OwIndexCarouselBackDaoI owIndexCarouselBackDao) {
		this.owIndexCarouselBackDao = owIndexCarouselBackDao;
	}
	@Override
	public OwBackReturnJSON<PageOwIndexCarouselBack> getDatagrid(Admins onlineAdmin,PageOwIndexCarouselBack pageModel)
			throws Exception {
		/**
		 * 1.判断当前用户是否拥有查询权限
		 * 2.执行
		 * 3.返回结果
		 */
		//验证1203权限（查看轮播的权限）
		if(!OwBackTools.power(onlineAdmin.getId(),OwBackStatic.POWER_ID_QUERY_CAROUSEL)){
			throw new OfficialwebsiteBackException("您没有查看轮播的权限！");
		}
		//2.查询
		OwBackReturnJSON<PageOwIndexCarouselBack> retJSON = new OwBackReturnJSON<PageOwIndexCarouselBack>();
		Map<String,Object> params = OwBackTools.getHashMap();
		//hql语句，不查询当前用户和超级管理员们
		StringBuffer totalHql = new StringBuffer("select count(*) from "+OwBackStatic.HQL_TABLE_NAME_OFFICIALWEBSITE_IDNEX_CAROUSEL+" t where t.isDelete=false ");
		StringBuffer rowsHql = new StringBuffer("from "+OwBackStatic.HQL_TABLE_NAME_OFFICIALWEBSITE_IDNEX_CAROUSEL+" t where t.isDelete=false ");
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
		List<OfficialwebsiteIndexCarousel> beanList = owIndexCarouselBackDao.get(rowsHql.toString(),params,pageModel.getPage(),pageModel.getRows());
		//转化模型
		List<PageOwIndexCarouselBack> rows = OwBackTools.copyPropertiesList(beanList, PageOwIndexCarouselBack.class);
		
		//查询total
		Integer total = owIndexCarouselBackDao.length(totalHql.toString(),params);

		retJSON.setRows(rows);
		retJSON.setTotal(total);
		//3.返回结果
		return retJSON;
	}
	@Override
	public void uploadIndexCarousel(Admins onlineAdmin,
			PageOwIndexCarouselBack pageModel)
			throws Exception {
		//验证1201权限（添加轮播的权限）
		if(!OwBackTools.power(onlineAdmin.getId(),OwBackStatic.POWER_ID_ADD_CAROUSEL)){
			throw new OfficialwebsiteBackException("您没有添加轮播的权限！");
		}
		FileOutputStream fos = null;
		FileInputStream fis = null;
		try {
			//设置储存实体的信息
			OfficialwebsiteIndexCarousel owIndexCarousel = new OfficialwebsiteIndexCarousel();
			BeanUtils.copyProperties(pageModel, owIndexCarousel);
			Timestamp currtTime = new Timestamp(new Date().getTime());
			owIndexCarousel.setCreateTime(currtTime);
			owIndexCarousel.setUpdateTime(currtTime);
			String uuid = UUID.randomUUID().toString();
			//获取后缀
			String ext = pageModel.getUploadFileContentType().split("/")[1];
			owIndexCarousel.setId(uuid);
			String imgName = uuid+"."+ext;
			owIndexCarousel.setImgName(imgName);
			owIndexCarousel.setIsDelete(false);
			//写入数据库
			owIndexCarouselBackDao.save(owIndexCarousel);
			
			//写入文件
			fos = new FileOutputStream(OwBackStatic.OFFICIALWEBSITE_IDNEX_CAROUSEL_IMG_PATH+File.separator+imgName);
			fis = new FileInputStream(pageModel.getUploadFile());
			IOUtils.write(IOUtils.toByteArray(fis), fos);
		} catch (Exception e) {
			e.printStackTrace();
			throw new OfficialwebsiteBackException("上传错误！");
		} finally{
			OwBackTools.closeStream(fis, fos);
		}
		
	}
	@Override
	public void deleteIndexCarousels(Admins onlineAdmin,
			PageOwIndexCarouselBack pageModel) throws Exception {
		//验证1202权限（删除轮播的权限）
		if(!OwBackTools.power(onlineAdmin.getId(),OwBackStatic.POWER_ID_DELETE_CAROUSEL)){
			throw new AdminsException("您没有删除轮播的权限！");
		}
		// 2.删除
		String[] deleteIds = pageModel.getDeleteIds().split(",");
		for (String deleteId : deleteIds) {

			OfficialwebsiteIndexCarousel owIndexCarousel = owIndexCarouselBackDao.findById(OfficialwebsiteIndexCarousel.class, deleteId);
			owIndexCarousel.setIsDelete(true);
			// 记录下imgname
			String imgName = owIndexCarousel.getImgName();

			// 删除数据库
			owIndexCarouselBackDao.update(owIndexCarousel);

			// 删除文件图片
			/* Tools.deleteFile(Static.USERS_HEAD_PATH, imgName); */

		}

	}
	@Override
	public void updateIndexCarsoul(Admins onlineAdmin,
			PageOwIndexCarouselBack pageModel) throws Exception {
		//验证1204权限（更新轮播的权限）
		if(!OwBackTools.power(onlineAdmin.getId(),OwBackStatic.POWER_ID_UPDATE_CAROUSEL)){
			throw new AdminsException("您没有更新轮播的权限！");
		}
		String imgName = null;
		try {
			//获取数据库的实体的信息
			OfficialwebsiteIndexCarousel dbOwIndexCarousel = owIndexCarouselBackDao.findById(OfficialwebsiteIndexCarousel.class, pageModel.getId());
			//验证
			if(dbOwIndexCarousel==null||dbOwIndexCarousel.getIsDelete()==true){
				throw new OfficialwebsiteBackException("该轮播条目不存在！");
			}
			//写入文件
			//判断是否上传文件，如果没有上传文件，那么imgName==null
			if(null != pageModel.getUploadFile()){
				//获取旧图片
				String oldImgName = dbOwIndexCarousel.getImgName();
				//删除旧文件
				OwBackTools.deleteFile(OwBackStatic.OFFICIALWEBSITE_IDNEX_CAROUSEL_IMG_PATH, oldImgName);
				
				//获取文件的id
				String uuid = dbOwIndexCarousel.getId();
				//写入新文件
				imgName = OwBackTools.writeUploadSingleFileToDSK(uuid,OwBackStatic.OFFICIALWEBSITE_IDNEX_CAROUSEL_IMG_PATH,pageModel);
			}
			
			//写入数据库
			//设置文件名
			if(null != imgName){
				
				dbOwIndexCarousel.setImgName(imgName);
			}
			//设置说明
			dbOwIndexCarousel.setIntroduction(pageModel.getIntroduction());
			//设置状态
			dbOwIndexCarousel.setStatus(pageModel.getStatus());
			//设置最后更新时间
			dbOwIndexCarousel.setUpdateTime(new Timestamp(new Date().getTime()));
			//写入数据库
			owIndexCarouselBackDao.update(dbOwIndexCarousel);
		} catch (Exception e) {
			//出现异常，那么刚才上传的删除文件
			OwBackTools.deleteFile(OwBackStatic.OFFICIALWEBSITE_IDNEX_CAROUSEL_IMG_PATH, imgName);
			e.printStackTrace();
			throw e;
		}
	}
	
}
