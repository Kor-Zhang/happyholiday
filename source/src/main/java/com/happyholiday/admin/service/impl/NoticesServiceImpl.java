package com.happyholiday.admin.service.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.lucene.index.SegmentInfos.FindSegmentsFile;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.dao.NoticesDaoI;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.exception.NoticesException;
import com.happyholiday.admin.pageModel.PageNotices;
import com.happyholiday.admin.service.NoticesServiceI;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.happyholiday.model.Notices;

@Service(value = "noticesService")
public class NoticesServiceImpl implements NoticesServiceI {
	//noticesDao导入
	private NoticesDaoI noticesDao;
	
	
	public NoticesDaoI getNoticesDao() {
		return noticesDao;
	}

	@Autowired
	public void setNoticesDao(NoticesDaoI noticesDao) {
		this.noticesDao = noticesDao;
	}

	@Override
	public void addNotices(Admins onlineAdmin,
			PageNotices pageModel) throws Exception {
		//验证401权限（添加公告权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_ADD_NOTICE)){
			throw new AdminsException("您没有添加公告权限！");
		}
		Notices notice = new Notices();
		BeanUtils.copyProperties(pageModel, notice);
		notice.setCreateTime(new Timestamp(new Date().getTime()));
		notice.setUpdateTime(new Timestamp(new Date().getTime()));
		notice.setId(UUID.randomUUID().toString());
		notice.setStatus(pageModel.getStatus());
		notice.setIsDelete(false);
		//设置admin
		Admins admin = new Admins();
		admin.setId(onlineAdmin.getId());
		notice.setAdmins(admin);
		noticesDao.save(notice);
	}

	@Override
	public BackReturnJSON<PageNotices> getNoticesDatagrid(Admins onlineAdmin, PageNotices pageModel)
			throws Exception {
		//验证404权限（查看公告权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_QUERY_NOTICE)){
			throw new AdminsException("您没有查看公告权限！");
		}
		//2.查询
		BackReturnJSON<PageNotices> retJSON = new BackReturnJSON<PageNotices>();
		Map<String,Object> params = BackTools.getHashMap();
		//hql语句，不查询当前用户和超级管理员们
		StringBuffer totalHql = new StringBuffer("select count(*) from "+BackStatic.HQL_TABLE_NAME_NOTICES+" t where t.isDelete=false ");
		StringBuffer rowsHql = new StringBuffer("from "+BackStatic.HQL_TABLE_NAME_NOTICES+" t where t.isDelete=false ");
		//设置where条件
		//list储存需要添加where条件的hql语句
		List<StringBuffer> hqls = BackTools.getArrayList(new StringBuffer[]{totalHql,rowsHql});
		//添加wehre
		/*setWhere(hqls, pageModel, params);*/
		//设置排序
		BackTools.setSortOrder(hqls,pageModel);
		//查询记录
		List<Notices> adminsList = noticesDao.get(rowsHql.toString(),params,pageModel.getPage(),pageModel.getRows());
		//转化模型
		List<PageNotices> rows = BackTools.copyPropertiesList(adminsList, PageNotices.class);
		//设置adminid
		int index = 0;
		for (Notices bean : adminsList) {
			PageNotices p = rows.get(index);
			p.setAdminId(bean.getAdmins().getId());
			index++;
		}
		//查询total
		Integer total = noticesDao.length(totalHql.toString(),params);
		
		retJSON.setRows(rows);
		retJSON.setTotal(total);
		//3.返回结果
		return retJSON;
	}
	

	@Override
	public void editNotices(Admins onlineAdmin,
			PageNotices pageModel) throws Exception {
		//验证403权限（更新公告权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_UPDATE_NOTICE)){
			throw new AdminsException("您没有更新公告权限！");
		}
		Notices notice = noticesDao.findById(Notices.class, pageModel.getId());
		notice.setText(pageModel.getText());
		notice.setTitle(pageModel.getTitle());
		notice.setStatus(pageModel.getStatus());
		notice.setUpdateTime(new Timestamp(new Date().getTime()));
		noticesDao.update(notice);
	}

	@Override
	public void deleteNotices(Admins onlineAdmin, PageNotices pageModel)
			throws Exception {
		//验证402权限（删除公告权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_DELETE_NOTICE)){
			throw new AdminsException("您没有删除公告权限！");
		}
		String[] deleteIds = pageModel.getDeleteIds().split(",");
		for (int i = 0; i < deleteIds.length; i++) {
			String deleteId = deleteIds[i];
			Notices notice = noticesDao.findById(Notices.class, deleteId);
			notice.setIsDelete(true);
			noticesDao.update(notice);
		}
		
	}

	@Override
	public PageNotices getSingleNoticeDatagridById(PageNotices pageModel) throws AdminsException, NoticesException {
		Notices notice = noticesDao.findById(Notices.class, pageModel.getId());
		if(notice.getStatus()==0){
			throw new NoticesException("该通告不能查阅！");
		}
		PageNotices pageNotice = new PageNotices();
		BeanUtils.copyProperties(notice, pageNotice);
		//设置adminid
		pageNotice.setAdminId(notice.getAdmins().getId());
				
		return pageNotice;
	}
	
	@Override
	public List<PageNotices> getNoticesList(PageNotices pageModel)
			throws AdminsException {
		
		//2.查询
		Map<String,Object> params = BackTools.getHashMap();
		//hql语句，不查询当前用户和超级管理员们
		StringBuffer totalHql = new StringBuffer("select count(*) from "+BackStatic.HQL_TABLE_NAME_NOTICES+" t where t.status=1");
		StringBuffer rowsHql = new StringBuffer("from "+BackStatic.HQL_TABLE_NAME_NOTICES+" t where t.isDelete=false and t.status=1");
		//设置where条件
		//list储存需要添加where条件的hql语句
		List<StringBuffer> hqls = BackTools.getArrayList(new StringBuffer[]{totalHql,rowsHql});
		//添加wehre
		/*setWhere(hqls, pageModel, params);*/
		//设置排序
		BackTools.setSortOrder(hqls,pageModel);
		//查询记录
		List<Notices> adminsList = noticesDao.get(rowsHql.toString(),params,pageModel.getPage(),pageModel.getRows());
		//转化模型
		List<PageNotices> rows = BackTools.copyPropertiesList(adminsList, PageNotices.class);
		//设置adminid
		int index = 0;
		for (Notices bean : adminsList) {
			PageNotices p = rows.get(index);
			p.setAdminId(bean.getAdmins().getId());
			index++;
		}
		//3.返回结果
		return rows;
	}
}	
