package com.happyholiday.admin.cars.service.impl;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.cars.dao.CarImgsDaoI;
import com.happyholiday.admin.cars.dao.CarsDaoI;
import com.happyholiday.admin.cars.pageModel.PageCarImgs;
import com.happyholiday.admin.cars.service.CarImgsServiceI;
import com.happyholiday.admin.dao.AdminLoginRecordDaoI;
import com.happyholiday.admin.dao.AdminUpdateRecordDaoI;
import com.happyholiday.admin.dao.AdminsDaoI;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.pageModel.PageAdmins;
import com.happyholiday.admin.service.AdminsServiceI;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Adminloginrecord;
import com.happyholiday.model.Admins;
import com.happyholiday.model.Adminupdaterecord;
import com.happyholiday.model.Carimgs;
import com.happyholiday.model.Cars;
import com.happyholiday.util.Encrypt;

@Service(value = "carImgsService")
public class CarImgsServiceImpl implements CarImgsServiceI {
	//carsDao导入
	private CarsDaoI carsDao;
	
	public CarsDaoI getCarsDao() {
		return carsDao;
	}
	@Autowired
	public void setCarsDao(CarsDaoI carsDao) {
		this.carsDao = carsDao;
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
	public void setMainImg(Admins onlineAdmin, PageCarImgs pageModel)
			throws Exception {
		/**
		 * 1.获取carimg的id为pageModel.getid()的对象
		 * 	--因为传过来的参数为carimg和img的混合，参数中id和imgname为img对象字段
		 * 2.重置该car的所有的carimg的main字段为false
		 * 3.设置carimg的main字段
		 */
		//验证904权限（汽车更新权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_UPDATE_CAR)){
			throw new AdminsException("您没有更新汽车权限！");
		}
		//1.获取carimg的id为pageModel.getid()的对象
		//2.重置该car的所有的carimg的main字段为false
		//获取id为pageModel.getid()的Carimgs对象
		Carimgs carImg = carImgsDao.find("from Carimgs t where t.imgs.id=:id",BackTools.getHashMap(new String[]{"id"}, new Object[]{pageModel.getId()}));
		//获取其car
		Cars car = carImg.getCars();
		//获取该汽车的所有图片
		Set<Carimgs> carImgs = car.getCarimgses();
		//开始重置
		for (Carimgs ci : carImgs) {
			ci.setMain(false);
		}
		//3.设置carimg的main字段
		carImg.setMain(true);
		carImgsDao.update(carImg);
	}
}	
