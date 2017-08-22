package com.happyholiday.front.car.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.front.car.dao.CarsDaoI;
import com.happyholiday.front.car.pageModel.PageCars;
import com.happyholiday.front.car.service.CarsServiceI;
import com.happyholiday.front.car.util.Tools;
import com.happyholiday.model.Carimgs;
import com.happyholiday.model.Cars;

@Service(value = "frontCarsService")
public class CarsServiceImpl implements CarsServiceI {
		private CarsDaoI frontCarsDao;

		public CarsDaoI getCarsDao() {
			return frontCarsDao;
		}
		@Autowired
		public void setCarsDao(CarsDaoI frontCarsDao) {
			this.frontCarsDao = frontCarsDao;
		}
		
		@Override
		public List<PageCars> selectInfo(PageCars pageCar) throws Exception {
			// TODO 自动生成的方法存根
			List<Cars> car = new ArrayList<Cars>();
			String hql = "from Cars   where 1=1 ";
			//判断地点
			hql = hql +"and address like'%"+pageCar.getAddress()+"%'";
			//判断车型
			if(!pageCar.getType().equals("不限")){
				hql = hql +"and type ='"+pageCar.getType()+"'";
			}
			//判断车品牌
			if(!pageCar.getCarBd().equals("不限")){
				hql = hql +"and carBd ='"+pageCar.getCarBd()+"'";
			}
			if(pageCar.getHighPrice()!=-1){
				if(pageCar.getLowPrice()==500){
					hql = hql +"and price >="+pageCar.getLowPrice();
				}else{
					hql = hql +"and price <=" +pageCar.getHighPrice()+"and price >="+pageCar.getLowPrice();
				}
			}
			car = frontCarsDao.get(hql, pageCar.getPage(), pageCar.getRows());
			List<PageCars> pageCars = Tools.copyPropertiesList(car, PageCars.class);
			for (PageCars pc : pageCars) {
				pc.setRentDay(pageCar.getRentDay());
			}
			int i = 0;
			for (Cars c : car) {
				Set<Carimgs> carImgs = c.getCarimgses();
				for (Carimgs carimg : carImgs) {
					if(carimg.getMain()==true){
						pageCars.get(i).setMainImgName(carimg.getImgs().getImgName());
					}
				}
				i++;
			}
			return pageCars;
		}
		
		
		@Override
		public int selectInfoSize(PageCars pageCar) throws Exception {
			// TODO 自动生成的方法存根
			List<Cars> car = new ArrayList<Cars>();
			String hql = "from Cars   where 1=1 ";
			//判断地点
			hql = hql +"and address like'%"+pageCar.getAddress()+"%'";
			
			//判断车型
			if(!pageCar.getType().equals("不限")){
				hql = hql +"and type ='"+pageCar.getType()+"'";
			}
			//判断车品牌
			if(!pageCar.getCarBd().equals("不限")){
				hql = hql +"and carBd ='"+pageCar.getCarBd()+"'";
			}
			if(pageCar.getHighPrice()!=-1){
				if(pageCar.getLowPrice()==500){
					hql = hql +"and price >="+pageCar.getLowPrice();
				}else{
					hql = hql +"and price <=" +pageCar.getHighPrice()+"and price >="+pageCar.getLowPrice();
				}
			}
			car = frontCarsDao.get(hql);
			return car.size();
		}
		@Override
		public PageCars selectCarInfo(PageCars pageCar) throws Exception {
			// TODO 自动生成的方法存根
			String hql ="from  Cars where id='"+pageCar.getId()+"'";
			Cars car  = frontCarsDao.find(hql);
			PageCars c = new PageCars();
			BeanUtils.copyProperties(car, c);
			//获取图片信息
			Set<Carimgs> carImgs = car.getCarimgses();
			List<String> ImgName = new ArrayList<String>();
			for (Carimgs carimg : carImgs) {
					ImgName.add(carimg.getImgs().getImgName());
					c.setOrderCarImgName(ImgName);
			}
			c.setFromDate(pageCar.getFromDate());
			c.setFromAddress(pageCar.getFromAddress());
			c.setBackDate(pageCar.getBackDate());
			c.setBackAddress(pageCar.getBackAddress());
			c.setRentDay(pageCar.getRentDay());
			System.out.println(c);
			return c;
		}
		
		
}
