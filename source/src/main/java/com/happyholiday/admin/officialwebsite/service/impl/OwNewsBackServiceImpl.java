package com.happyholiday.admin.officialwebsite.service.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.admin.officialwebsite.OwBackStatic;
import com.happyholiday.admin.officialwebsite.dao.OwNewsBackDaoI;
import com.happyholiday.admin.officialwebsite.exception.OfficialwebsiteBackException;
import com.happyholiday.admin.officialwebsite.pageModel.PageOwNewsBack;
import com.happyholiday.admin.officialwebsite.service.OwNewsBackServiceI;
import com.happyholiday.admin.officialwebsite.util.OwBackReturnJSON;
import com.happyholiday.admin.officialwebsite.util.OwBackTools;
import com.happyholiday.model.Admins;
import com.happyholiday.model.OfficialwebsiteNews;
import com.happyholiday.model.OfficialwebsiteNews;
@Service(value="owNewsBackService")
public class OwNewsBackServiceImpl implements OwNewsBackServiceI{
	//注入owNewsBackDao
	private OwNewsBackDaoI owNewsBackDao;
	
	public OwNewsBackDaoI getOwNewsBackDao() {
		return owNewsBackDao;
	}
	@Autowired
	public void setOwNewsBackDao(OwNewsBackDaoI owNewsBackDao) {
		this.owNewsBackDao = owNewsBackDao;
	}
	@Override
	public void uploadTextNews(Admins onlineAdmin, PageOwNewsBack pageModel)
			throws Exception {
		//验证1401权限（增加新闻的权限）
		if(!OwBackTools.power(onlineAdmin.getId(),OwBackStatic.POWER_ID_ADD_NEWS)){
			throw new OfficialwebsiteBackException("您没有增加新闻的权限！");
		}
		//初始化存储实体
		OfficialwebsiteNews owNews = new OfficialwebsiteNews();
		
		//设置参数
		Timestamp currtTime = new Timestamp(new Date().getTime());
		owNews.setCreateTime(currtTime);
		owNews.setUpdateTime(currtTime);
		owNews.setId(UUID.randomUUID().toString());
		owNews.setIsDelete(false);
		owNews.setStatus(pageModel.getStatus());
		owNews.setTitle(pageModel.getTitle());
		//清除\r\n
		String newString = OwBackTools.cleanStringWrap(pageModel.getText());
		owNews.setText(newString);
		owNewsBackDao.save(owNews);
	}
	@Override
	public void updateTextNews(Admins onlineAdmin, PageOwNewsBack pageModel)
			throws Exception {
		//验证1404权限（更新新闻的权限）
		if(!OwBackTools.power(onlineAdmin.getId(),OwBackStatic.POWER_ID_UPDATE_NEWS)){
			throw new OfficialwebsiteBackException("您没有更新新闻的权限！");
		}
		//初始化存储实体
		OfficialwebsiteNews dbOwNews = owNewsBackDao.findById(OfficialwebsiteNews.class, pageModel.getId());
		//储存新信息
		dbOwNews.setStatus(pageModel.getStatus());
		//清除\r\n
		String newString = OwBackTools.cleanStringWrap(pageModel.getText());
		dbOwNews.setText(newString);
/*		dbOwNews.setText(pageModel.getText());
*/		dbOwNews.setTitle(pageModel.getTitle());
		//设置参数
		owNewsBackDao.save(dbOwNews);
	}
	@Override
	public OwBackReturnJSON<PageOwNewsBack> getDatagrid(
			Admins onlineAdmin, PageOwNewsBack pageModel) throws Exception {
		/**
		 * 1.判断当前用户是否拥有查询权限
		 * 2.执行
		 * 3.返回结果
		 */
		//验证1403权限（查看新闻的权限）
		if(!OwBackTools.power(onlineAdmin.getId(),OwBackStatic.POWER_ID_QUERY_NEWS)){
			throw new OfficialwebsiteBackException("您没有查看新闻的权限！");
		}
		//2.查询
		OwBackReturnJSON<PageOwNewsBack> retJSON = new OwBackReturnJSON<PageOwNewsBack>();
		Map<String,Object> params = OwBackTools.getHashMap();
		//hql语句，不查询当前用户和超级管理员们
		StringBuffer totalHql = new StringBuffer("select count(*) from "+OwBackStatic.HQL_TABLE_NAME_OFFICIALWEBSITE_NEWS+" t where t.isDelete=false ");
		StringBuffer rowsHql = new StringBuffer("from "+OwBackStatic.HQL_TABLE_NAME_OFFICIALWEBSITE_NEWS+" t where t.isDelete=false ");
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
		List<OfficialwebsiteNews> beanList = owNewsBackDao.get(rowsHql.toString(),params,pageModel.getPage(),pageModel.getRows());
		//转化模型
		List<PageOwNewsBack> rows = OwBackTools.copyPropertiesList(beanList, PageOwNewsBack.class);
		for (PageOwNewsBack p : rows) {
			String newString = OwBackTools.cleanStringWrap(p.getText());
			p.setText(newString);
		}
		//查询total
		Integer total = owNewsBackDao.length(totalHql.toString(),params);

		retJSON.setRows(rows);
		retJSON.setTotal(total);
		//3.返回结果
		return retJSON;
	}
	@Override
	public void deleteNews(Admins onlineAdmin, PageOwNewsBack pageModel)
			throws Exception {
		//验证1402权限（删除新闻的权限）
		if(!OwBackTools.power(onlineAdmin.getId(),OwBackStatic.POWER_ID_DELETE_NEWS)){
			throw new OfficialwebsiteBackException("您没有删除新闻的权限！");
		}
		// 2.删除
		String[] deleteIds = pageModel.getDeleteIds().split(",");
		for (String deleteId : deleteIds) {

			OfficialwebsiteNews owNews = owNewsBackDao.findById(OfficialwebsiteNews.class, deleteId);
			owNews.setIsDelete(true);
			// 记录下imgname
			/*String imgName = owNews.getImgName();*/

			// 删除数据库
			owNewsBackDao.update(owNews);

			// 删除文件图片
			/* Tools.deleteFile(Static.USERS_HEAD_PATH, imgName); */

		}
	}

	
}
