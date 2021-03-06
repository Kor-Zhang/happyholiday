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
import com.happyholiday.admin.officialwebsite.dao.OwMembersBackDaoI;
import com.happyholiday.admin.officialwebsite.exception.OfficialwebsiteBackException;
import com.happyholiday.admin.officialwebsite.pageModel.PageOwMembersBack;
import com.happyholiday.admin.officialwebsite.service.OwMembersBackServiceI;
import com.happyholiday.admin.officialwebsite.util.OwBackReturnJSON;
import com.happyholiday.admin.officialwebsite.util.OwBackTools;
import com.happyholiday.model.Admins;
import com.happyholiday.model.OfficialwebsiteMembers;
@Service(value="owMembersBackService")
public class OwMembersBackServiceImpl implements OwMembersBackServiceI{
	//注入owMembersBackDao
	private OwMembersBackDaoI owMembersBackDao;

	
	public OwMembersBackDaoI getOwMembersBackDao() {
		return owMembersBackDao;
	}

	@Autowired
	public void setOwMembersBackDao(OwMembersBackDaoI owMembersBackDao) {
		this.owMembersBackDao = owMembersBackDao;
	}

	@Override
	public void uploadMembers(Admins onlineAdmin, PageOwMembersBack pageModel)
			throws Exception {
		//验证1101权限（添加成员的权限）
		if(!OwBackTools.power(onlineAdmin.getId(),OwBackStatic.POWER_ID_ADD_MEMBERS)){
			throw new AdminsException("您没有添加成员的权限！");
		}
		String imgName = null;
		try {

			String uuid = UUID.randomUUID().toString();
			
			//写入文件
			imgName = OwBackTools.writeUploadSingleFileToDSK(uuid,OwBackStatic.OFFICIALWEBSITE_MEMBERS_IMG_PATH, pageModel);

			//写入数据库操作
			//设置储存实体的信息
			OfficialwebsiteMembers owMembers = new OfficialwebsiteMembers();
			//复制表单属性
			BeanUtils.copyProperties(pageModel, owMembers);
			//设置其他属性
			Timestamp currtTime = new Timestamp(new Date().getTime());
			owMembers.setCreateTime(currtTime);
			owMembers.setUpdateTime(currtTime);
			//获取后缀
			owMembers.setId(uuid);
			owMembers.setHead(imgName);
			owMembers.setIsDelete(false);
			//写入数据库
			owMembersBackDao.save(owMembers);
		} catch (Exception e) {
			e.printStackTrace();
			OwBackTools.deleteFile(OwBackStatic.OFFICIALWEBSITE_MEMBERS_IMG_PATH,imgName);
			throw new OfficialwebsiteBackException("上传错误！");
		} 
	}

	@Override
	public void updateMembers(Admins onlineAdmin, PageOwMembersBack pageModel)
			throws Exception {
		//验证1104权限（更新成员的权限）
		if(!OwBackTools.power(onlineAdmin.getId(),OwBackStatic.POWER_ID_UPDATE_MEMBERS)){
			throw new AdminsException("您没有更新成员的权限！");
		}
		String head = null;
		try {
			//获取数据库的实体的信息
			OfficialwebsiteMembers dbOwMembers = owMembersBackDao.findById(OfficialwebsiteMembers.class, pageModel.getId());
			//验证
			if(dbOwMembers==null||dbOwMembers.getIsDelete()==true){
				throw new OfficialwebsiteBackException("该成员记录不存在！");
			}
			//写入文件
			//判断是否上传文件，如果没有上传文件，那么imgName==null
			if(null != pageModel.getUploadFile()){
				//获取旧图片
				String oldImgName = dbOwMembers.getHead();
				//删除旧文件
				OwBackTools.deleteFile(OwBackStatic.OFFICIALWEBSITE_MEMBERS_IMG_PATH, oldImgName);
				
				//获取文件的id
				String uuid = dbOwMembers.getId();
				//写入新文件
				head = OwBackTools.writeUploadSingleFileToDSK(uuid,OwBackStatic.OFFICIALWEBSITE_MEMBERS_IMG_PATH,pageModel);
			}
			
			//写入数据库
			//设置文件名
			if(null != head){
				
				dbOwMembers.setHead(head);
			}
			//设置职位
			dbOwMembers.setPosition(pageModel.getPosition());
			//设置说明
			dbOwMembers.setIntroduction(pageModel.getIntroduction());
			//设置状态
			dbOwMembers.setStatus(pageModel.getStatus());
			//设置最后更新时间
			dbOwMembers.setUpdateTime(new Timestamp(new Date().getTime()));
			//写入数据库
			owMembersBackDao.update(dbOwMembers);
			
		} catch (Exception e) {
			//出现异常，那么刚才上传的删除文件
			OwBackTools.deleteFile(OwBackStatic.OFFICIALWEBSITE_IDNEX_CAROUSEL_IMG_PATH, head);
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteMembers(Admins onlineAdmin, PageOwMembersBack pageModel)
			throws Exception {
		//验证1102权限（删除成员的权限）
		if(!OwBackTools.power(onlineAdmin.getId(),OwBackStatic.POWER_ID_DELETE_MEMBERS)){
			throw new AdminsException("您没有删除成员的权限！");
		}
		// 2.删除
		String[] deleteIds = pageModel.getDeleteIds().split(",");
		for (String deleteId : deleteIds) {

			OfficialwebsiteMembers owMembers = owMembersBackDao.findById(OfficialwebsiteMembers.class, deleteId);
			owMembers.setIsDelete(true);
			// 记录下imgname
			/*String imgName = owMembers.getImgName();*/

			// 删除数据库
			owMembersBackDao.update(owMembers);

			// 删除文件图片
			/* Tools.deleteFile(Static.USERS_HEAD_PATH, imgName); */

		}
	}

	@Override
	public OwBackReturnJSON<PageOwMembersBack> getDatagrid(Admins onlineAdmin,
			PageOwMembersBack pageModel) throws Exception {

		/**
		 * 1.判断当前用户是否拥有查询权限
		 * 2.执行
		 * 3.返回结果
		 */
		//验证1103权限（查看成员的权限）
		if(!OwBackTools.power(onlineAdmin.getId(),OwBackStatic.POWER_ID_QUERY_MEMBERS)){
			throw new AdminsException("您没有查看成员的权限！");
		}
		//2.查询
		OwBackReturnJSON<PageOwMembersBack> retJSON = new OwBackReturnJSON<PageOwMembersBack>();
		Map<String,Object> params = OwBackTools.getHashMap();
		//hql语句，不查询当前用户和超级管理员们
		StringBuffer totalHql = new StringBuffer("select count(*) from "+OwBackStatic.HQL_TABLE_NAME_OFFICIALWEBSITE_MEMBERS+" t where t.isDelete=false ");
		StringBuffer rowsHql = new StringBuffer("from "+OwBackStatic.HQL_TABLE_NAME_OFFICIALWEBSITE_MEMBERS+" t where t.isDelete=false ");
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
		List<OfficialwebsiteMembers> beanList = owMembersBackDao.get(rowsHql.toString(),params,pageModel.getPage(),pageModel.getRows());
		//转化模型
		List<PageOwMembersBack> rows = OwBackTools.copyPropertiesList(beanList, PageOwMembersBack.class);
		
		//查询total
		Integer total = owMembersBackDao.length(totalHql.toString(),params);

		retJSON.setRows(rows);
		retJSON.setTotal(total);
		//3.返回结果
		return retJSON;
	}
}
