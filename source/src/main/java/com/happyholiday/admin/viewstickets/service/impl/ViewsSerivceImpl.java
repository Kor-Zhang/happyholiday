package com.happyholiday.admin.viewstickets.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.admin.viewstickets.Static;
import com.happyholiday.admin.viewstickets.dao.ImgsDaoI;
import com.happyholiday.admin.viewstickets.dao.ViewIntrosDaoI;
import com.happyholiday.admin.viewstickets.dao.ViewsDaoI;
import com.happyholiday.admin.viewstickets.dao.ViewsImgsDaoI;
import com.happyholiday.admin.viewstickets.pageModel.PageImgs;
import com.happyholiday.admin.viewstickets.pageModel.PageViewImgUpload;
import com.happyholiday.admin.viewstickets.pageModel.PageViewImgs;
import com.happyholiday.admin.viewstickets.pageModel.PageViews;
import com.happyholiday.admin.viewstickets.pageModel.PageViewsUpload;
import com.happyholiday.admin.viewstickets.service.ViewsServiceI;
import com.happyholiday.admin.viewstickets.util.ReturnJSON;
import com.happyholiday.admin.viewstickets.util.Tools;
import com.happyholiday.model.Admins;
import com.happyholiday.model.Imgs;
import com.happyholiday.model.ViewticketViews;
import com.happyholiday.model.ViewticketViewsImgs;
import com.happyholiday.model.ViewticketViewsIntroductions;
@Service(value="viewsService")
public class ViewsSerivceImpl implements ViewsServiceI {
	
	//配置viewsDao
	private ViewsDaoI  viewsdao ;
	
	public ViewsDaoI getViewsdao() {
		return viewsdao;
	}
	@Autowired
	public void setViewsdao(ViewsDaoI viewsdao) {
		this.viewsdao = viewsdao;
	}
	//配置imgsDao  避免和Admins包下的imgsDao冲突 改名为 imgsViewsDao
	private ImgsDaoI imgsViewsdao;
	
	public ImgsDaoI getImgsViewsdao() {
		return imgsViewsdao;
	}
	@Autowired
	public void setImgsViewsdao(ImgsDaoI imgsViewsdao) {
		this.imgsViewsdao = imgsViewsdao;
	}
	//配置viewsImgsDao
	private ViewsImgsDaoI viewsImgsdao;
	public ViewsImgsDaoI getViewsImgsdao() {
		return viewsImgsdao;
	}
	@Autowired
	public void setViewsImgsdao(ViewsImgsDaoI viewsImgsdao) {
		this.viewsImgsdao = viewsImgsdao;
	}
	//配置viewIntroDao
	private ViewIntrosDaoI viewIntrosdao;
	public ViewIntrosDaoI getViewIntrosdao() {
		return viewIntrosdao;
	}
	@Autowired
	public void setViewIntrosdao(ViewIntrosDaoI viewIntrosdao) {
		this.viewIntrosdao = viewIntrosdao;
	}
	@Override
	public ReturnJSON<PageViews> getViewsDatagrid(PageViews pageView,Admins onlineAdmin)
			throws Exception {
		// 验证权限
		BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_QUERY_VIEW_LIST);
		//查询
		ReturnJSON<PageViews> dg = new ReturnJSON<PageViews>();
		Map<String, Object> params = Tools.getHashMap();
		
		//hql语句
		StringBuffer totalHql = new StringBuffer("select count(*) from ViewticketViews t where  t.isDelete = false");
		StringBuffer rowsHql = new StringBuffer("from ViewticketViews  t where  t.isDelete = false");
		//设置where条件
		//list储存需要添加where条件的hql语句
		List<StringBuffer> hqls = Tools.getArrayList();
		//设置需要添加where的语句
		hqls.add(totalHql);
		hqls.add(rowsHql);
		//添加wehre
		Tools.setSearchWhere(hqls, pageView, params);
		//查询记录
		List<ViewticketViews> beanList = viewsdao.get(rowsHql.toString(), params, pageView.getPage(), pageView.getRows());
		//所有数据
		List<PageViews>  rows =  Tools.copyPropertiesList(beanList, PageViews.class);
		Integer total = viewsdao.length(totalHql.toString(), params);
		//给数据设置其他属性
		//设置JSON属性
		dg.setRows(rows);
		dg.setTotal(total);
		return dg;
	}
	
	@Override
	public void addView(PageViewsUpload pageModel,Admins onlineAdmin) throws Exception {
		// 验证权限
		BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_ADD_VIEW_LIST);
		// 检验是否存在该景区的名字(唯一)
		/**
		 * 1 查询所有的view(isDelete = false)的name 
		 * 2  是否匹配 
		 */
		List<ViewticketViews> views = viewsdao.get("from ViewticketViews where isDelete = false");
		for(int i =0;i<views.size();i++){
			if(views.get(i).getName().equals(pageModel.getName())){
				throw new Exception("该景区名称已经存在！");
			}
		}
		//检验景区信息
		checkView(pageModel);
		ViewticketViews view = new ViewticketViews();
		//设置景区信息
		BeanUtils.copyProperties(pageModel, view);
		//设置id  创建时间 是否删除 是否含有景区介绍
		view.setId(UUID.randomUUID().toString());
		view.setCreatTime(new Timestamp(new Date().getTime()));
		view.setIsDelete(false);
		view.setHasIntro(false);
		view.setSalesNumber(0);
		viewsdao.save(view);
		//上传的文件
		InputStream is = null;
		OutputStream os = null;
		File[] uploadFiles = pageModel.getUploadFile();
		//判断是否上传了图片
		if(uploadFiles.length==0){
			throw new Exception("请为该景区添加至少一张图片");
		}
		//上传的文件类型
		String[] uploadFilesContentType = pageModel.getUploadFileContentType();
		//遍历上传的文件
		for(int i =0;i<uploadFiles.length;i++){
			//上传的文件
			File uploadFile = uploadFiles[i];
			//上传文件类型
			String uploadFileContentType = uploadFilesContentType[i];
			//获取图片后缀
			String ext = uploadFileContentType.split("/")[1];
			//viewImg的uuid
			String viewImgId = UUID.randomUUID().toString();
			//保存图片的名字（包括后缀）
			String imgName = viewImgId +"."+ext;
			//基于myFile创建一个文件输入流  
			is = new FileInputStream(uploadFile);  
			// 设置上传文件目录  
			String uploadPath = Static.viewsImgPath;
			// 设置目标文件  
			File toFile = new File(uploadPath,imgName);  
			// 创建一个输出流，等待数据库插入记录后，在写入文件
			os = new FileOutputStream(toFile);
			//写入数据库
			Imgs img = new Imgs();
			ViewticketViewsImgs viewImg = new ViewticketViewsImgs();
			//设置img信息
			img.setId(UUID.randomUUID().toString());
			img.setImgName(imgName);
			imgsViewsdao.save(img);
			
			//设置viewImgs信息
			viewImg.setId(viewImgId);
			viewImg.setImgs(img);
			viewImg.setViewticketViews(view);
			viewImg.setMain(false);
			//设置主要图片
			if(i==pageModel.getMainNumber()){
				viewImg.setMain(true);
			}
			viewsImgsdao.save(viewImg);
			//写入图片文件
			IOUtils.write(IOUtils.toByteArray(is), os);
		}
		Tools.closeStream(is, os);
	}
	
	@Override
	public ReturnJSON<PageImgs> getViewImgsDatagrid(PageViews pageView,Admins onlineAdmin)
			throws Exception {
		// 验证权限
		BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_QUERY_VIEW_LIST);
		//查询ViewImg中的name
		ViewticketViews view = viewsdao.find("from ViewticketViews t where t.id = :id", Tools.getHashMap(new String[]{"id"}, new Object[]{pageView.getId()}));
		Set<ViewticketViewsImgs> viewImgs = view.getViewticketViewsImgses();
		//设置imgs到rows 设置main字段
		List<PageImgs> rows = Tools.getArrayList();
		for(ViewticketViewsImgs vi :viewImgs ){
			Imgs img = vi.getImgs();
			PageImgs pageImg  = new PageImgs();
			BeanUtils.copyProperties(img, pageImg);
			pageImg.setMain(vi.getMain());
			rows.add(pageImg);
		}
		//设置返回值
		ReturnJSON<PageImgs> retJSON = new ReturnJSON<PageImgs>();
		retJSON.setRows(rows);
		retJSON.setTotal(rows.size());
		return retJSON;
	}
	@Override
	public void deleteViewImg(PageViews pageView,Admins onlineAdmin) throws Exception {
		// 验证权限
		BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_DELETE_VIEW_LIST);
		//获取ID
		String deleteViewImgId = pageView.getDeleteViewImgId();

	    //根据ID查找img对象
	    Imgs img = imgsViewsdao.findById(Imgs.class, deleteViewImgId);
		//删除
		imgsViewsdao.delete(img);
	}
	
	
	@Override
	public void addViewImg(PageViewImgUpload pageModel,Admins onlineAdmin) throws Exception {
		// 验证权限
		BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_ADD_VIEW_LIST);
	
		InputStream is = null;
		OutputStream os = null;
		//设置view
		ViewticketViews view = new ViewticketViews();
		view.setId(pageModel.getId());

		//上传的文件
		File uploadFile =pageModel.getUploadFile();
		//上传文件类型
		String uploadFileContentType = pageModel.getUploadFileContentType();
		//获取图片后缀
		String ext = uploadFileContentType.split("/")[1];
		//viewImg的uuid
		String viewImgId = UUID.randomUUID().toString();
		//保存图片的名字（包括后缀）
		String imgName = viewImgId +"."+ext;
		//基于myFile创建一个文件输入流  
		is = new FileInputStream(uploadFile);  
		// 设置上传文件目录  
		String uploadPath = Static.viewsImgPath;
		// 设置目标文件  
		File toFile = new File(uploadPath,imgName);  
		// 创建一个输出流，等待数据库插入记录后，在写入文件
		os = new FileOutputStream(toFile);
		//写入数据库
		Imgs img = new Imgs();
		ViewticketViewsImgs viewImg = new ViewticketViewsImgs();
		//设置img信息
		img.setId(UUID.randomUUID().toString());
		img.setImgName(imgName);
		imgsViewsdao.save(img);
		
		//设置viewImgs信息
		viewImg.setId(viewImgId);
		viewImg.setImgs(img);
		viewImg.setViewticketViews(view);
		viewImg.setMain(false);
		viewsImgsdao.save(viewImg);
		//写入图片文件
		IOUtils.write(IOUtils.toByteArray(is), os);
		Tools.closeStream(is, os);
	}
	
	
	@Override
	public void deleteView(PageViews pageView,Admins onlineAdmin) throws Exception {
		// 验证权限
		BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_DELETE_VIEW_LIST);
	
		// TODO 自动生成的方法存根
		//获取ViewId
		String viewId = pageView.getId();
		//查找当前View 修改其删除状态
		ViewticketViews view =  viewsdao.findById(ViewticketViews.class, viewId);
		view.setIsDelete(true);
		//查找ViewIntro 一起删除
		ViewticketViewsIntroductions viewIntro = viewIntrosdao.find("from ViewticketViewsIntroductions where viewId ='"+viewId+"'");
		if(viewIntro!=null){
			viewIntro.setIsDelete(true);
			viewIntrosdao.save(viewIntro);
		}
		//保存View
		viewsdao.save(view);	
	}
	@Override
	public void updateView(PageViews pageView,Admins onlineAdmin) throws Exception {
		// 验证权限
		BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_UPDATE_VIEW_LIST);
	
		// TODO 自动生成的方法存根
		//获取下拉框的值
		String  country = pageView.getCountry().split(", ")[1];
		String city = pageView.getCity().split(", ")[1];
		String province = pageView.getProvince().split(", ")[1];
		String grade = pageView.getGrade().split(", ")[1];
		String type = pageView.getType().split(", ")[1];
		//修改pageView的值
		pageView.setCountry(country);
		pageView.setCity(city);
		pageView.setProvince(province);
		pageView.setGrade(grade);
		pageView.setType(type);
		//景区的其他值是否为空
		//检验景区信息 
		if(pageView.getName().trim().length()==0){
			throw new Exception("请设置景区的名称");
		}
		if(pageView.getAddress().trim().length()==0){
			throw new Exception("请设置景区的地址");
		}
		if(pageView.getFeature().trim().length()==0){
			throw new Exception("请设置该景区的评价");
		}
		if(pageView.getOpentime().trim().length()==0){
			throw new Exception("请设置景区开放时间");
		}
		ViewticketViews view = new ViewticketViews();
		BeanUtils.copyProperties(pageView, view);
		view.setIsDelete(false);
		view.setCreatTime(new Timestamp(new Date().getTime()));
		viewsdao.update(view);
	}
	
	@Override
	public void updateMainImg(PageViewImgs pageModel,Admins onlineAdmin) throws Exception {
		// 验证权限
		BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_UPDATE_VIEW_LIST);
	
		//获取传过来的id获取img
		Imgs img = imgsViewsdao.findById(Imgs.class, pageModel.getId());
		//根据imgId 查找viewImg
		String hql = "from ViewticketViewsImgs where imgs.id = '"+img.getId()+"'";
		ViewticketViewsImgs viewImg = viewsImgsdao.find(hql);
		//根据viewImg 查找view
		ViewticketViews view = viewImg.getViewticketViews();
		Set<ViewticketViewsImgs> viewImgs = view.getViewticketViewsImgses();
		//开始重置
		for (ViewticketViewsImgs vi : viewImgs) {
			vi.setMain(false);
		}
		viewImg.setMain(true);
		viewsImgsdao.update(viewImg);
	}
	
	
	@Override
	public ReturnJSON<String> getViewsName(PageViews pageView,Admins onlineAdmin)
			throws Exception {
		// 验证权限
		BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_QUERY_VIEW_LIST);
	
		// TODO 自动生成的方法存根
		ReturnJSON<String> retJSON = new ReturnJSON<>();
		String hql = "from ViewticketViews where isDelete = false and hasIntro = false and city='"+java.net.URLDecoder.decode(pageView.getCity(),"utf-8")+"'";
		List<ViewticketViews> list = viewsdao.get(hql);
		List<String> rows = new ArrayList<String>();
		for(int i=0;i<list.size();i++){
			rows.add(i, list.get(i).getName());
		}
		retJSON.setRows(rows);
		retJSON.setTotal(list.size());
		return retJSON;
	}
   
	 public void checkView(PageViewsUpload pageView) throws Exception{
			if(pageView.getName().trim().length()==0){
				throw new Exception("请设置景区的名称");
			}
			if(pageView.getAddress().trim().length()==0){
				throw new Exception("请设置景区的地址");
			}
			if(pageView.getFeature().trim().length()==0){
				throw new Exception("请设置该景区的评价");
			}
			if(pageView.getOpentime().trim().length()==0){
				throw new Exception("请设置景区开放时间");
			}
			if(pageView.getEndtime().trim().length()==0){
				throw new Exception("请设置景区结束时间");
			}
	 }
	@Override
	public ReturnJSON<PageViews> getOneView(PageViews pageView,Admins onlineAdmin)
			throws Exception {
		// 验证权限
		BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_QUERY_VIEW_LIST);
	
		// TODO 自动生成的方法存根
		List<ViewticketViews> viewList = viewsdao.get("from ViewticketViews where id='"+pageView.getId()+"'");
		ReturnJSON<PageViews> dg = new ReturnJSON<PageViews>();
		List<PageViews> rows = Tools.copyPropertiesList(viewList, PageViews.class);
		dg.setRows(rows);
		dg.setTotal(rows.size());
		return dg;
	}
	@Override
	public ReturnJSON<String> getViewsAllName(PageViews pageView,Admins onlineAdmin)
			throws Exception {
		// 验证权限
		BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_QUERY_VIEW_LIST);
	
		// TODO 自动生成的方法存根
		ReturnJSON<String> retJSON = new ReturnJSON<>();
		String hql = "from ViewticketViews where isDelete = false  and city='"+java.net.URLDecoder.decode(pageView.getCity(),"utf-8")+"'";
		List<ViewticketViews> list = viewsdao.get(hql);
		List<String> rows = new ArrayList<String>();
		for(int i=0;i<list.size();i++){
			rows.add(i, list.get(i).getName());
		}
		retJSON.setRows(rows);
		retJSON.setTotal(list.size());
		return retJSON;
	}

}
