package com.happyholiday.admin.cars.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
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
import com.happyholiday.admin.cars.dao.CarImgsDaoI;
import com.happyholiday.admin.cars.dao.CarsDaoI;
import com.happyholiday.admin.cars.exception.CarsException;
import com.happyholiday.admin.cars.pageModel.PageCarImgUpload;
import com.happyholiday.admin.cars.pageModel.PageCarUpload;
import com.happyholiday.admin.cars.pageModel.PageCars;
import com.happyholiday.admin.cars.pageModel.PageImgs;
import com.happyholiday.admin.cars.service.CarsServiceI;
import com.happyholiday.admin.dao.ImgsDaoI;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.happyholiday.model.Carimgs;
import com.happyholiday.model.Cars;
import com.happyholiday.model.Imgs;

@Service(value = "carsService")
public class CarsServiceImpl implements CarsServiceI {
	//carsDao导入
	private CarsDaoI carsDao;
	
	public CarsDaoI getCarsDao() {
		return carsDao;
	}
	@Autowired
	public void setCarsDao(CarsDaoI carsDao) {
		this.carsDao = carsDao;
	}
	//imgsDao导入
	private ImgsDaoI imgsDao;
	public ImgsDaoI getImgsDao() {
		return imgsDao;
	}
	@Autowired
	public void setImgsDao(ImgsDaoI imgsDao) {
		this.imgsDao = imgsDao;
	}
	//carImgsDao导入
	private CarImgsDaoI carImgsDao;
	public CarImgsDaoI getCarImgsDao() {
		return carImgsDao;
	}
	@Autowired
	public void setCarImgsDao(CarImgsDaoI carImgsDao) {
		this.carImgsDao = carImgsDao;
	}
	
	@Override
	public BackReturnJSON<PageCars> getSingleCarDatagridById(Admins onlineAdmin,
			PageCars pageCar) throws Exception {
		/**
		 * 1.判断当前用户是否拥有查询权限
		 * 2.执行
		 * 3.返回结果
		 */
		//验证903权限（查看汽车权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_QUERY_CAR)){
			throw new AdminsException("您没有查看汽车权限！");
		}
		//2.查询
		BackReturnJSON<PageCars> retJSON = new BackReturnJSON<PageCars>();
		List<Cars> beanList = carsDao.get("from Cars t where t.isDelete=false and t.id=:id",BackTools.getHashMap(new String[]{"id"}, new Object[]{pageCar.getId()}));
		List<PageCars> rows = BackTools.copyPropertiesList(beanList, PageCars.class);
		
		retJSON.setRows(rows);
		retJSON.setTotal(rows.size());
		//3.返回结果
		return retJSON;
	}
	@Override
	public BackReturnJSON<PageCars> getDatagrid(Admins onlineAdmin,
			PageCars pageModel) throws Exception {
		/**
		 * 1.判断当前用户是否拥有查询权限
		 * 2.执行
		 * 3.返回结果
		 */
		//验证903权限（查看汽车权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_QUERY_CAR)){
			throw new AdminsException("您没有查看汽车权限！");
		}
		//2.查询
		BackReturnJSON<PageCars> dg = new BackReturnJSON<PageCars>();
		Map<String,Object> params = BackTools.getHashMap();
		//hql语句，不查询当前用户和超级管理员们
		StringBuffer totalHql = new StringBuffer("select count(*) from "+BackStatic.HQL_TABLE_NAME_CARS+" t where t.isDelete=false ");
		StringBuffer rowsHql = new StringBuffer("from "+BackStatic.HQL_TABLE_NAME_CARS+" t where t.isDelete=false ");
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
		List<Cars> beanList = carsDao.get(rowsHql.toString(),params,pageModel.getPage(),pageModel.getRows());
		//转化模型
		List<PageCars> rows = BackTools.copyPropertiesList(beanList, PageCars.class);
		
		//查询total
		Integer total = carsDao.length(totalHql.toString(),params);

		dg.setRows(rows);
		dg.setTotal(total);
		//3.返回结果
		return dg;
	}

	
	@Override
	public void addCar(Admins onlineAdmin,PageCarUpload pageModel) throws Exception {
		//验证901权限（添加汽车权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_ADD_CAR)){
			throw new AdminsException("您没有添加汽车信息权限！");
		}
		InputStream is = null;
		OutputStream os = null;
		try {
			
			Cars car = new Cars();
			//设置car信息
			BeanUtils.copyProperties(pageModel, car);
			//设置id字段
			String id = UUID.randomUUID().toString();
			car.setId(id);
			//设置是否删除
			car.setIsDelete(false);
			//设置创建时间
			car.setCreateTime(new Timestamp(new Date().getTime()));
			carsDao.save(car);
			/*Set<Carimgs> carimgses = new HashSet<Carimgs>();*/
			//上传的的文件
			File[] uploadFiles = pageModel.getUploadFile();
			//上传的文件类型
			String[] uploadFilesContentType = pageModel.getUploadFileContentType();
			//遍历上传文件
			for (int i = 0; i < uploadFiles.length; i++) {
				//上传的文件
				File uploadFile = uploadFiles[i];
				//上传文件类型
				String uploadFileContentType = uploadFilesContentType[i];
				//获取图片后缀
				String ext = uploadFileContentType.split("/")[1];
				//carImg的uuid
				String carImgId = UUID.randomUUID().toString();
				//保存图片的名字（包括后缀）
				String imgName = carImgId +"."+ext;
				//基于myFile创建一个文件输入流  
				is = new FileInputStream(uploadFile);  
				// 设置上传文件目录  
				String uploadPath = BackStatic.carsImgPath;
				// 设置目标文件  
				File toFile = new File(uploadPath,imgName);  
				// 创建一个输出流，等待数据库插入记录后，在写入文件
				os = new FileOutputStream(toFile);
				
				
				//写入数据库
				Imgs img = new Imgs();
				Carimgs carImg = new Carimgs();
				//设置img信息
				String imgId = UUID.randomUUID().toString();
				img.setId(imgId);
				img.setImgName(imgName);
				
				imgsDao.save(img);
				//设置carImg信息
				carImg.setId(carImgId);
				carImg.setCars(car);
				carImg.setImgs(img);
				carImg.setMain(false);
				//设置主要图片
				if(i==pageModel.getMainNumber()){
					carImg.setMain(true);
					
				}
				carImgsDao.save(carImg);
				//写入图片文件
				IOUtils.write(IOUtils.toByteArray(is), os);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new CarsException();
		} finally{
			BackTools.closeStream(is, os);
		}
		
	}
	@Override
	public BackReturnJSON<PageImgs> getCarsImgDatagrid(Admins onlineAdmin,
			PageCars pageCar) throws Exception {
		/**
		 * 1.判断用户是否有查询权限
		 * 2.查询指定的id的car的获取图片img对象
		 * 3.返回信息
		 */
		//验证903权限（查看汽车权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_QUERY_CAR)){
			throw new AdminsException("您没有查看汽车权限！");
		}
		//2.查询carimg的name
		Cars car = carsDao.find("from Cars t where t.id = :id",BackTools.getHashMap(new String[]{"id"}, new Object[]{pageCar.getId()}));
		Set<Carimgs> carImgs = car.getCarimgses();
		//设置img到rows，设置main字段
		List<PageImgs> rows = BackTools.getArrayList();
		for (Carimgs ci : carImgs) {
			Imgs img = ci.getImgs(); 
			PageImgs pageImg = new PageImgs();
			BeanUtils.copyProperties(img, pageImg);
			pageImg.setMain(ci.getMain());
			rows.add(pageImg);
		}
		//设置返回值
		BackReturnJSON<PageImgs> retJSON = new BackReturnJSON<PageImgs>();
		retJSON.setRows(rows);
		retJSON.setTotal(rows.size());
		//3.返回值
		return retJSON;
	}
	@Override
	public void deleteCarImgs(Admins onlineAdmin, PageCars pageCar)
			throws Exception {
		/**
		 * 1.判断用户是否有权限
		 * 2.删除
		 * 3.返回信息
		 */
		//验证904权限（修改汽车权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_UPDATE_CAR)){
			throw new AdminsException("您没有修改汽车信息权限！");
		}
		//2.删除
		String[] deleteCarImgIds = pageCar.getDeleteCarImgIds().split(",");
		for (String deleteCarImgId : deleteCarImgIds) {
			
			
			//记录需要删除的img的name
			Imgs dBImg = imgsDao.findById(Imgs.class,deleteCarImgId);
			String imgName = dBImg.getImgName();
			BackStatic.log.info(imgName);
			
			//删除数据库img
			imgsDao.delete(dBImg);
			
			//删除文件
			BackTools.deleteFile(BackStatic.carsImgPath, imgName);
			
		}
		
		//3.返回值
	}
	
	@Override
	
	public void addCarImg(Admins onlineAdmin, PageCarImgUpload pageModel) throws Exception {
		/**
		 * 根据carId，上传的图片，添加一张图片
		 */
		//验证904权限（更新汽车权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_UPDATE_CAR)){
			throw new AdminsException("您没有更新汽车信息权限！");
		}
		InputStream is = null;
		OutputStream os = null;
		try {
			Cars car = new Cars();
			car.setId(pageModel.getId());
			//上传的文件
			File uploadFile =pageModel.getUploadFile();
			//上传文件类型
			String uploadFileContentType = pageModel.getUploadFileContentType();
			//获取图片后缀
			String ext = uploadFileContentType.split("/")[1];
			//carImg的uuid
			String carImgId = UUID.randomUUID().toString();
			//保存图片的名字（包括后缀）
			String imgName = carImgId +"."+ext;
			//基于myFile创建一个文件输入流  
			is = new FileInputStream(uploadFile);  
			// 设置上传文件目录  
			String uploadPath = BackStatic.carsImgPath;
			// 设置目标文件  
			File toFile = new File(uploadPath,imgName);  
			// 创建一个输出流，等待数据库插入记录后，在写入文件
			os = new FileOutputStream(toFile);
			
			
			//写入数据库
			Imgs img = new Imgs();
			Carimgs carImg = new Carimgs();
			//设置img信息
			String imgId = UUID.randomUUID().toString();
			img.setId(imgId);
			img.setImgName(imgName);
			imgsDao.save(img);
			//设置carImg信息
			carImg.setId(carImgId);
			carImg.setCars(car);
			carImg.setImgs(img);
			carImg.setMain(false);
			carImgsDao.save(carImg);
			//写入图片文件
			IOUtils.write(IOUtils.toByteArray(is), os);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new CarsException();
		} finally{
			BackTools.closeStream(is, os);
		}
		
	}
	@Override
	public void deleteCars(Admins onlineAdmin, PageCars pageCar)
			throws Exception {
		/**
		 * 1.判断用户是否有权限
		 * 2.删除
		 */
		//验证902权限（删除汽车权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_DELETE_CAR)){
			throw new AdminsException("您没有删除汽车信息权限！");
		}
		//2.删除
		String[] deleteIds = pageCar.getDeleteIds().split(",");
		for (String deleteId : deleteIds) {
			
			//img对象
			Cars dbCar = new Cars();
			dbCar = carsDao.findById(Cars.class,deleteId);
			dbCar.setIsDelete(true);
			carsDao.update(dbCar);
		}
		
	}
	@Override
	public void updateCar(Admins onlineAdmin, PageCars pageCar)
			throws Exception {
		/**
		 * 1.判断用户是否有权限
		 * 2.更新
		 */
		//验证903权限（更新汽车权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_UPDATE_CAR)){
			throw new AdminsException("您没有更新汽车信息权限！");
		}
		//2.更新
		Cars car = new Cars();
		car = carsDao.findById(Cars.class,pageCar.getId());
		BeanUtils.copyProperties(pageCar, car,new String[]{"id","isDelete"});
		
	}
	
	
	

}
