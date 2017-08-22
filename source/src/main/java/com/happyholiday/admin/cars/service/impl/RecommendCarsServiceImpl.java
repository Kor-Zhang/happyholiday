package com.happyholiday.admin.cars.service.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.cars.dao.CarImgsDaoI;
import com.happyholiday.admin.cars.dao.CarsDaoI;
import com.happyholiday.admin.cars.dao.RecommendCarsDaoI;
import com.happyholiday.admin.cars.exception.RecommendCarsException;
import com.happyholiday.admin.cars.pageModel.PageRecommendCars;
import com.happyholiday.admin.cars.service.RecommendCarsServiceI;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.util.BackConfig;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.happyholiday.model.Carimgs;
import com.happyholiday.model.Cars;
import com.happyholiday.model.Recommendcars;

@Service(value = "recommendCarsService")
public class RecommendCarsServiceImpl implements RecommendCarsServiceI {
	//recommendCarsDao导入
	private RecommendCarsDaoI recommendCarsDao;
	
	
	public RecommendCarsDaoI getRecommendCarsDao() {
		return recommendCarsDao;
	}
	@Autowired
	public void setRecommendCarsDao(RecommendCarsDaoI recommendCarsDao) {
		this.recommendCarsDao = recommendCarsDao;
	}
	//carsDao导入
	private CarsDaoI carsDao;
	
	public CarsDaoI getCarsDao() {
		return carsDao;
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
	public BackReturnJSON<PageRecommendCars> getDatagrid(Admins onlineAdmin,
			PageRecommendCars pageModel) throws Exception {
		/**
		 * 1.判断当前用户是否拥有查询权限
		 * 2.执行
		 * 3.返回结果 
		 */
		//验证603权限（查询推荐汽车权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_QUERY_RECOMMEND_CAR)){
			throw new AdminsException("您没有查询推荐汽车权限！");
		}
		//2.查询
		BackReturnJSON<PageRecommendCars> retJSON = new BackReturnJSON<PageRecommendCars>();
		Map<String,Object> params = BackTools.getHashMap();
		//hql语句，不查询当前用户和超级管理员们
		StringBuffer totalHql = new StringBuffer("select count(*) from "+BackStatic.HQL_TABLE_NAME_RECOMMENDCARS+" t where 1=1 ");
		StringBuffer rowsHql = new StringBuffer("from "+BackStatic.HQL_TABLE_NAME_RECOMMENDCARS+" t where 1=1 ");
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
		List<Recommendcars> beanList = recommendCarsDao.get(rowsHql.toString(),params,pageModel.getPage(),pageModel.getRows());
		//转化模型
		List<PageRecommendCars> tempRows = BackTools.copyPropertiesList(beanList, PageRecommendCars.class);
		List<PageRecommendCars> rows = BackTools.getArrayList();
		//设置推荐时展示的照片的imgname和carid
		int i = 0;
		for (Recommendcars bean : beanList) {
			PageRecommendCars prc = tempRows.get(i);
			prc.setCarId(bean.getCars().getId());
			Set<Carimgs> carImgs = bean.getCars().getCarimgses();
			for (Carimgs carImg : carImgs) {
				if(carImg.getMain()==true){
					String imgName = carImg.getImgs().getImgName();
					prc.setImgName(imgName);
					
				}
			}
			rows.add(prc);
			i++;
		}
		//查询total
		Integer total = recommendCarsDao.length(totalHql.toString(),params);

		retJSON.setRows(rows);
		retJSON.setTotal(total);
		//3.返回结果
		return retJSON;
	}
	@Override
	public void addRecommendCar(Admins onlineAdmin, PageRecommendCars pageModel)
			throws Exception {
		//验证601权限（添加推荐汽车权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_ADD_RECOMMEND_CAR)){
			throw new AdminsException("添加推荐汽车权限！");
		}
		//查询是否存在该汽车的推荐
		Recommendcars rc = recommendCarsDao.find("from "+BackStatic.HQL_TABLE_NAME_RECOMMENDCARS+" t where t.cars.id=:carId",BackTools.getHashMap(new String[]{"carId"},new Object[]{pageModel.getCarId()}));
		if(rc!=null){
			throw new RecommendCarsException("该汽车已被推荐！");
		}
		rc = new Recommendcars();
		Cars car = new Cars();
		car.setId(pageModel.getCarId());
		rc.setCars(car);
		rc.setCreateTime(new Timestamp(new Date().getTime()));
		rc.setIntroduction("");
		rc.setId(UUID.randomUUID().toString());
		recommendCarsDao.save(rc);
	}
	@Override
	public void deleteRecommendCar(Admins onlineAdmin, PageRecommendCars pageModel)
			throws Exception {
		//验证602权限（删除推荐汽车权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_DELETE_RECOMMEND_CAR)){
			throw new AdminsException("删除推荐汽车权限！");
		}
		String[] deleteIds = pageModel.getDeleteIds().split(",");
		for (int i = 0; i < deleteIds.length; i++) {
			String deleteId = deleteIds[i];
			//查询是否存在该汽车的推荐
			Recommendcars rc = new Recommendcars();
			rc.setId(deleteId);
			recommendCarsDao.delete(rc);
		}
		
	}
}