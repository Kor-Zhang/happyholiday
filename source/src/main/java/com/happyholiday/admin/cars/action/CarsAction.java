package com.happyholiday.admin.cars.action;

import java.io.File;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.AdminsBaseAction;
import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.cars.pageModel.PageCars;
import com.happyholiday.admin.cars.pageModel.PageImgs;
import com.happyholiday.admin.cars.service.CarsServiceI;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.happyholiday.model.Imgs;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 配置action
 * 
 * @author Jhon
 * 
 */
@Namespace("/")
@Action(value = "carsAction")

public class CarsAction extends AdminsBaseAction implements ModelDriven<PageCars> {

	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(CarsAction.class);
	private PageCars pageCar = new PageCars();

	@Override
	public PageCars getModel() {
		return pageCar;
	}
	

	
	private CarsServiceI carsService;
	public CarsServiceI getCarsService() {
		return carsService;
	}
	@Autowired
	public void setCarsService(CarsServiceI carsService) {
		this.carsService = carsService;
	}
	/**
	 * 获取汽车管理的datagrid数据
	 * @author Jhon
	 */
	public void getCarsDatagrid(){
		/**
		 * 获取当前在线admin
		 * 执行事务
		 * 返回结果
		 */
		BackReturnJSON<PageCars> retJSON = new BackReturnJSON<PageCars>();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务
			retJSON = carsService.getDatagrid(onlineAdmin,pageCar);
			retJSON.setMsg("");
			retJSON.setSuccess(true);
		} catch (AdminsException e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			//返回结果
			super.writeJSON(retJSON);
		}
	}
	/**
	 * 获取指定id的car信息
	 */
	public void getSingleCarDatagridById(){
		/**
		 * 获取当前在线admin
		 * 执行事务
		 * 返回结果
		 */
		BackReturnJSON<PageCars> retJSON = new BackReturnJSON<PageCars>();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务
			retJSON = carsService.getSingleCarDatagridById(onlineAdmin,pageCar);
			retJSON.setMsg("");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}
		//返回结果
		super.writeJSON(retJSON);
	}
	/**
	 * 通过imgname获取车辆图片
	 */
	public void getCarsImgByCarImgName(){
		String imgName = pageCar.getImgName();
		
		//汽车图片资源目录
		String carsImgPath = BackStatic.carsImgPath;
		//请求的图片资源
		String imgDir = carsImgPath+File.separator+imgName;
		File imgFile = new File(imgDir);
		writeImg(imgFile);
	}
	
	/**
	 * 获取制定id的车辆的图片的imgs对象
	 */
	public void getCarsImgDatagridByCarId(){
		/**
		 * 1.获取当前的admin，用户验证权限
		 * 2.查询信息
		 * 3.返回结果
		 */
		BackReturnJSON<PageImgs> retJSON = new BackReturnJSON<PageImgs>();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务

			retJSON = carsService.getCarsImgDatagrid(onlineAdmin,pageCar);
			//设置结果
			
			retJSON.setMsg("");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}
		//3.返回结果
		super.writeJSON(retJSON);
	}
	/**
	 * 删除制定carid的img
	 */
	public void deleteCarImgs(){
		/**
		 * 1.获取当前的admin，用户验证权限
		 * 2.查询信息
		 * 3.返回结果
		 */
		BackReturnJSON retJSON = new BackReturnJSON();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务

			carsService.deleteCarImgs(onlineAdmin,pageCar);
			//设置结果
			retJSON.setMsg("删除成功！");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}
		//3.返回结果
		super.writeJSON(retJSON);
	}
	/**
	 * 删除car
	 */
	public void deleteCars(){
		/**
		 * 1.获取当前的admin，用户验证权限
		 * 2.查询信息
		 * 3.返回结果
		 */
		BackReturnJSON retJSON = new BackReturnJSON();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务

			logger.info(onlineAdmin);
			carsService.deleteCars(onlineAdmin,pageCar);
			//设置结果
			retJSON.setMsg("删除成功！");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}
		//3.返回结果
		super.writeJSON(retJSON);
	}
	/**
	 * 跟新指定id的car信息（不更新图片）
	 */
	public void updateCar(){
		/**
		 * 1.获取当前的admin，用户验证权限
		 * 2.查询信息
		 * 3.返回结果
		 */
		BackReturnJSON retJSON = new BackReturnJSON();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务

			carsService.updateCar(onlineAdmin,pageCar);
			//设置结果
			retJSON.setMsg("更新成功！");
			retJSON.setSuccess(true);
		} catch (AdminsException e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		} catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			//3.返回结果
			super.writeJSON(retJSON);
		}
	}
	
}
