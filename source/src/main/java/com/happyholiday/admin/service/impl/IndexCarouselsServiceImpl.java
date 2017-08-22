package com.happyholiday.admin.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.cars.exception.CarsException;
import com.happyholiday.admin.cars.pageModel.PageCarImgUpload;
import com.happyholiday.admin.dao.ImgsDaoI;
import com.happyholiday.admin.dao.IndexCarouselsDaoI;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.exception.IndexCarouselsException;
import com.happyholiday.admin.pageModel.PageIndexCarousels;
import com.happyholiday.admin.pageModel.PageIndexCarouselsUpload;
import com.happyholiday.admin.service.IndexCarouselsServiceI;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.happyholiday.model.Carimgs;
import com.happyholiday.model.Cars;
import com.happyholiday.model.Imgs;
import com.happyholiday.model.Indexcarousels;

@Service(value = "indexCarouselsService")
public class IndexCarouselsServiceImpl implements IndexCarouselsServiceI {
	//	注入indexCarouselsDao
	private IndexCarouselsDaoI indexCarouselsDao;
	
	public IndexCarouselsDaoI getIndexCarouselsDao() {
		return indexCarouselsDao;
	}
	@Autowired
	public void setIndexCarouselsDao(IndexCarouselsDaoI indexCarouselsDao) {
		this.indexCarouselsDao = indexCarouselsDao;
	}
	//注入imgdao
	private ImgsDaoI imgsDao;
	
	
	public ImgsDaoI getImgsDao() {
		return imgsDao;
	}
	@Autowired
	public void setImgsDao(ImgsDaoI imgsDao) {
		this.imgsDao = imgsDao;
	}
	
	@Override
	public BackReturnJSON<PageIndexCarousels> getCarouselsDatagrid(Admins onlineAdmin,PageIndexCarousels pageModel) throws Exception {
		/**
		 * 1.判断当前用户是否拥有查询权限
		 * 2.执行
		 * 3.返回结果
		 */
		//验证701权限（查看首页轮播权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_QUERY_INDEX_CAROUSEL)){
			throw new AdminsException("您没有查看首页轮播信息权限！");
		}
		//2.查询
		BackReturnJSON<PageIndexCarousels> retJSON = new BackReturnJSON<PageIndexCarousels>();
		Map<String,Object> params = BackTools.getHashMap();
		//hql语句
		/*params.put("id", onlineAdmin.getId());*/
		StringBuffer totalHql = new StringBuffer("select count(*) from "+BackStatic.HQL_TABLE_NAME_INDEXCAROUSELS+" t where 1=1");
		StringBuffer rowsHql = new StringBuffer("from "+BackStatic.HQL_TABLE_NAME_INDEXCAROUSELS+" t where 1=1");
		//设置where条件
		//list储存需要添加where条件的hql语句
		List<StringBuffer> hqls = BackTools.getArrayList();
		//设置需要添加where的语句
		hqls.add(totalHql);
		hqls.add(rowsHql);
		//添加wehre
		BackTools.setSearchWhere(hqls, pageModel, params);
		BackTools.setSortOrder(hqls, pageModel);
		//查询记录
		List<Indexcarousels> beanList = indexCarouselsDao.get(rowsHql.toString(),params,pageModel.getPage(),pageModel.getRows());
		//转化模型
		List<PageIndexCarousels> tempRows = BackTools.copyPropertiesList(beanList, PageIndexCarousels.class);
		List<PageIndexCarousels> rows = BackTools.getArrayList();
		//设置imgname
		int index = 0;
		for (Indexcarousels bean : beanList) {
			Imgs img = bean.getImgs();
			img.setIndexcarouselses(null);
			img.setCarimgses(null);
			PageIndexCarousels p = tempRows.get(index);
			p.setImgName(img.getImgName());
			rows.add(p);
			index++;
		}
		//查询total
		Integer total = indexCarouselsDao.length(totalHql.toString(),params);

		retJSON.setRows(rows);
		retJSON.setTotal(total);
		//3.返回结果
		return retJSON;
	}
	
	@Override
	public void deleteCarouselsService(Admins onlineAdmin,
			PageIndexCarousels pageModel) throws Exception {
		/**
		 * 1.判断用户是否有权限
		 * 2.删除
		 * 3.返回信息
		 */
		//验证702权限（删除首页轮播权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_DELETE_INDEX_CAROUSEL)){
			throw new AdminsException("您没有删除首页轮播信息权限！");
		}
		//2.删除
		String[] deleteIndexCarouselIds = pageModel.getDeleteIds().split(",");
		for (String deleteIndexCarouselId : deleteIndexCarouselIds) {
			
			
			//获取需要删除的轮播的对象
			Indexcarousels indexCarousel = indexCarouselsDao.findById(Indexcarousels.class,deleteIndexCarouselId);
			//获取img对象
			Imgs img = indexCarousel.getImgs();
			//保存imganme
			String imgName = img.getImgName();
			//删除数据库img
			imgsDao.delete(img);
			
			//删除文件
			BackTools.deleteFile(BackStatic.INDEX_CAROUSEL_IMG_PATH, imgName);
			
		}
		
		//3.返回值
		
	}

	@Override
	public void carouselsUpload(Admins onlineAdmin,
			PageIndexCarouselsUpload pageModel) throws Exception {

		/**
		 * 根据carId，上传的图片，添加一张图片
		 */
		//验证704权限（添加首页轮播权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_ADD_INDEX_CAROUSEL)){
			throw new AdminsException("您没有添加首页轮播信息权限！");
		}
		InputStream is = null;
		OutputStream os = null;
		try {
			Cars car = new Cars();
			car.setId(pageModel.getId());
			// 上传的文件
			File uploadFile = pageModel.getUploadFile();
			// 上传文件类型
			String uploadFileContentType = pageModel.getUploadFileContentType();
			// 获取图片后缀
			String ext = uploadFileContentType.split("/")[1];
			// carImg的uuid
			String carouselId = UUID.randomUUID().toString();
			// 保存图片的名字（包括后缀）
			String imgName = carouselId + "." + ext;
			// 基于myFile创建一个文件输入流
			is = new FileInputStream(uploadFile);
			// 设置上传文件目录
			String uploadPath = BackStatic.INDEX_CAROUSEL_IMG_PATH;
			// 设置目标文件
			File toFile = new File(uploadPath, imgName);
			// 创建一个输出流，等待数据库插入记录后，在写入文件
			os = new FileOutputStream(toFile);

			// 写入数据库
			Imgs img = new Imgs();
			Indexcarousels indexCarousel = new Indexcarousels();
			// 设置img信息
			String imgId = UUID.randomUUID().toString();
			img.setId(imgId);
			img.setImgName(imgName);
			imgsDao.save(img);
			// 设置indexCarousel信息
			indexCarousel.setId(carouselId);
			indexCarousel.setIntroduction("");
			indexCarousel.setImgs(img);
			indexCarousel.setCreateTime(new Timestamp(new Date().getTime()));
			indexCarouselsDao.save(indexCarousel);
			// 写入图片文件
			IOUtils.write(IOUtils.toByteArray(is), os);

		} catch (Exception e) {
			e.printStackTrace();
			throw new IndexCarouselsException();
		} finally {
			BackTools.closeStream(is, os);
		}

	}
	
}
