package com.happyholiday.admin.service.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.UUID;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.admin.cars.dao.CarsDaoI;
import com.happyholiday.admin.cars.dao.OrdersDaoI;
import com.happyholiday.admin.cars.dao.RentCarUsersDaoI;
import com.happyholiday.admin.dao.AdminsDaoI;
import com.happyholiday.admin.dao.MenuTreeDaoI;
import com.happyholiday.admin.service.RepairServiceI;
import com.happyholiday.admin.users.dao.UsersDaoI;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.happyholiday.model.Cars;
import com.happyholiday.model.Menutree;
import com.happyholiday.model.Orders;
import com.happyholiday.model.Rentcarusers;
import com.happyholiday.model.Users;
import com.happyholiday.util.Encrypt;
@Service(value="repairService")
public class RepairServiceImpl implements RepairServiceI{
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger
			.getLogger(RepairServiceImpl.class);
	
	private MenuTreeDaoI menuTreeDao;

	public MenuTreeDaoI getMenuTreeDao() {
		return menuTreeDao;
	}
	@Autowired
	public void setMenuTreeDao(MenuTreeDaoI menuTreeDao) {
		this.menuTreeDao = menuTreeDao;
	}
	
	private AdminsDaoI adminsDao;
	
	public AdminsDaoI getAdminsDao() {
		return adminsDao;
	}
	@Autowired
	public void setAdminsDao(AdminsDaoI adminsDao) {
		this.adminsDao = adminsDao;
	}
	
	//注入usersdao
	private UsersDaoI usersDao;
	
	
	public UsersDaoI getUsersDao() {
		return usersDao;
	}
	@Autowired
	public void setUsersDao(UsersDaoI usersDao) {
		this.usersDao = usersDao;
	}
	//注入ordersdao
	private OrdersDaoI ordersDao;
	
	public OrdersDaoI getOrdersDao() {
		return ordersDao;
	}
	@Autowired
	public void setOrdersDao(OrdersDaoI ordersDao) {
		this.ordersDao = ordersDao;
	}
	//注入carsdao
	private CarsDaoI carsDao;
	
	public CarsDaoI getCarsDao() {
		return carsDao;
	}
	@Autowired
	public void setCarsDao(CarsDaoI carsDao) {
		this.carsDao = carsDao;
	}
	//注入rentCarUsersDao
	private RentCarUsersDaoI rentCarUsersDao;
	
	
	public RentCarUsersDaoI getRentCarUsersDao() {
		return rentCarUsersDao;
	}	
	@Autowired
	public void setRentCarUsersDao(RentCarUsersDaoI rentCarUsersDao) {
		this.rentCarUsersDao = rentCarUsersDao;
	}
	@Override
	public void repairAll(){
		//修复全部内容
		repairUsers();
		repairMenuTree();
		repairAdmins();
		/*repairCars();*/
	}
	
	@Override
	public void repairMenuTree() {
		//修复做左部树菜单
		
		
		
		Menutree root = new Menutree();
		root.setId("root");
		root.setText("首页");
		root.setMenutree(null);
		menuTreeDao.saveOrUpdate(root);
		
		
		
		
		//日志管理
		Menutree rzgl = new Menutree();
		rzgl.setId("rzgl");
		rzgl.setText("日志管理");
		rzgl.setMenutree(root);
		menuTreeDao.saveOrUpdate(rzgl);

		Menutree yhrz = new Menutree();
		yhrz.setId("yhglrz");
		yhrz.setText("用户管理日志");
		yhrz.setUrl("/admins/yhglrz.jsp");
		yhrz.setMenutree(rzgl);
		menuTreeDao.saveOrUpdate(yhrz);
		
		Menutree yhdlrz = new Menutree();
		yhdlrz.setId("yhdlrz");
		yhdlrz.setText("用户登录日志");
		yhdlrz.setUrl("/admins/yhdlrz.jsp");
		yhdlrz.setMenutree(rzgl);
		menuTreeDao.saveOrUpdate(yhdlrz);
		
		/*Menutree yhzxrz = new Menutree();
		yhzxrz.setId("yhzxrz");
		yhzxrz.setText("用户注销日志");
		yhzxrz.setMenutree(rzgl);
		menuTreeDao.svaeOrUpdate(yhzxrz);*/
		
		Menutree qxglrz = new Menutree();
		qxglrz.setId("qxglrz");
		qxglrz.setText("权限管理日志");
		qxglrz.setMenutree(rzgl);
		qxglrz.setUrl("/admins/qxglrz.jsp");
		menuTreeDao.saveOrUpdate(qxglrz);
		
		Menutree glydlrz = new Menutree();
		glydlrz.setId("glydlrz");
		glydlrz.setText("管理员登录日志");
		glydlrz.setMenutree(rzgl);
		glydlrz.setUrl("/admins/glydlrz.jsp");
		menuTreeDao.saveOrUpdate(glydlrz);
		
		
		/*Menutree glyzxrz = new Menutree();
		glyzxrz.setId("glyzxrz");
		glyzxrz.setText("管理员注销日志");
		glyzxrz.setMenutree(rzgl);
		menuTreeDao.svaeOrUpdate(glyzxrz);*/
		
		
		
		//系统管理
		Menutree xtgl = new Menutree();
		xtgl.setId("xtgl");
		xtgl.setText("系统管理");
		xtgl.setMenutree(root);
		menuTreeDao.saveOrUpdate(xtgl);
		
		Menutree yhgl = new Menutree();
		yhgl.setId("yhgl");
		yhgl.setText("用户管理");
		yhgl.setUrl("/admins/yhgl.jsp");
		yhgl.setMenutree(xtgl);
		menuTreeDao.saveOrUpdate(yhgl);
		
		Menutree qxgl = new Menutree();
		qxgl.setId("qxgl");
		qxgl.setText("权限管理");
		qxgl.setUrl("/admins/qxgl.jsp");
		qxgl.setMenutree(xtgl);
		menuTreeDao.saveOrUpdate(qxgl);
		
		Menutree qcgl = new Menutree();
		qcgl.setId("qcgl");
		qcgl.setText("汽车管理");
		qcgl.setUrl("/admins/qcgl.jsp");
		qcgl.setMenutree(xtgl);
		menuTreeDao.saveOrUpdate(qcgl);
		
		Menutree ddgl = new Menutree();
		ddgl.setId("ddgl");
		ddgl.setText("订单管理");
		ddgl.setMenutree(xtgl);
		ddgl.setUrl("/admins/ddgl.jsp");
		menuTreeDao.saveOrUpdate(ddgl);
		
		Menutree sylbgl = new Menutree();
		sylbgl.setId("sylbgl");
		sylbgl.setText("首页轮播管理");
		sylbgl.setMenutree(xtgl);
		sylbgl.setUrl("/admins/sylbgl.jsp");
		menuTreeDao.saveOrUpdate(sylbgl);
		
		Menutree zdgl = new Menutree();
		zdgl.setId("zdgl");
		zdgl.setText("字典管理");
		zdgl.setMenutree(xtgl);
		zdgl.setUrl("/admins/zdgl.jsp");
		menuTreeDao.saveOrUpdate(zdgl);
		
	}
	@Override
	public void repairAdmins() {
		//修复用户
		Admins admin = null;
		int i = 0;
		
		//恢复管理员
		
		i = 0;
		while(i<200){

			admin = new Admins();
			//设置信息
			admin.setIsSuperAdmin(0);
			admin.setStatus(0);
			admin.setIntroduction("");
			admin.setIsDelete(false);
			admin.setTheme("bootstrap");

			admin.setCreateTime(new Timestamp(new Date().getTime()));
			admin.setId("999999999"+i);
			admin.setPassword(Encrypt.e("999999999"+i));
			adminsDao.saveOrUpdate(admin);
			/*pai.CreateIndex(admin);*/
			i++;
		}
		//超级管理员
		admin = new Admins();
		//设置信息
		admin.setIsSuperAdmin(1);
		admin.setStatus(1);
		admin.setCreateTime(new Timestamp(new Date().getTime()));
		admin.setIntroduction("");
		admin.setIsDelete(false);
		admin.setTheme("bootstrap");
		
		admin.setId("1138829222");
		admin.setPassword(Encrypt.e("ZK19951217."));
		adminsDao.saveOrUpdate(admin);
		
	}
	
	@Override
	public void repairUsers() {
		// 修复用户
		
		Integer i = 0;

		// 恢复用户

		i = 0;
		while (i < 10) {
			Users user = new Users();
			// 设置信息
			user.setCardClazz("身份证");
			user.setCardNumber("999");
			user.setEmail("11388292"+i+"@qq.com");
			user.setStatus(1);
			user.setIsDelete(false);
			user.setRealName("rentcar");
			user.setStatus(1);
			user.setUserName("rentcar");
			user.setId(UUID.randomUUID().toString());
			user.setPhone("1111111111"+ i);
			user.setPassword(Encrypt.e("9999999999" + i));
			user.setHead("default.png");
			usersDao.saveOrUpdate(user);
			/* pai.CreateIndex(admin); */
			i++;
		}
	}

	@Override
	public void repairCars() {
		// 修复用户
		Cars car = null;
		int i = 0;
		// 恢复用户
		i = 0;
		while (i < 100) {
			car = new Cars();
			// 设置信息
			car.setIsDelete(false);
			car.setAirSacNumber(i%4);
			car.setCarBd(BackTools.getRandomChinese(2));
			car.setDisplacement(i%200);
			car.setDrivingMode(BackTools.getRandomChinese(2));
			car.setDvd("dvd");
			car.setEngineIntakeForm(BackTools.getRandomChinese(2));
			car.setFuelTankage(i%155);
			car.setFuelType(BackTools.getRandomChinese(2));
			car.setGps("gps");
			car.setIsDelete(false);
			car.setNumber(i);
			car.setPrice(i%77);
			car.setReverseSensor(BackTools.getRandomChinese(2));
			car.setSeatNumber(i);
			car.setSeatType(BackTools.getRandomChinese(2));
			car.setSkyWindow(BackTools.getRandomChinese(2));
			car.setSoundBox(BackTools.getRandomChinese(2));
			car.setTransmissionType(BackTools.getRandomChinese(2));
			car.setType(BackTools.getRandomChinese(2));
			car.setYear(new Date());
			car.setCreateTime(new Timestamp(new Date().getTime()));
			//设置id字段
			String id = UUID.randomUUID().toString();
			car.setId(id);
			//设置图片字段
			String img = id+".png";
			/*car.setImg(img);*/
			
			carsDao.saveOrUpdate(car);
			i++;
		}
	}
	@Override
	public void repairOrders() throws Exception {
		Integer index = 0;
		while(index<20){
			Orders order = new Orders();
			Cars car;
			try {
				car = carsDao.get("from Cars t").get(0);
			} catch (Exception e) {
				throw new Exception("请保证car至少有一条记录");
			}
			order.setCars(car);
			Users user;
			try {
				user = usersDao.get("from Users t").get(0);
			} catch (Exception e) {
				throw new Exception("请保证user至少有一条记录");
			}
			order.setUsers(user);
			order.setGetCarAddress(BackTools.getRandomChinese(2));
			order.setGetCarTime(new Timestamp(new Date().getTime()));
			order.setIsDelete(false);
			Rentcarusers rentCarUser;
			try{
				rentCarUser = rentCarUsersDao.get("from Rentcarusers t ").get(0);
			}catch(Exception e){
				throw new Exception("请保证rentCarUser至少有一条记录");
			}
			
			order.setRentcarusers(rentCarUser);
			order.setReturnCarAddress(BackTools.getRandomChinese(2));
			order.setReturnCarTime(new Timestamp(new Date().getTime()));
			order.setStatus(0);
			order.setSubmitTime(new Timestamp(new Date().getTime()));
			order.setTotalPrice(1000d+index);
			order.setId(UUID.randomUUID().toString());
			ordersDao.save(order);
			index++;
		}
		
		
	}
	
}
