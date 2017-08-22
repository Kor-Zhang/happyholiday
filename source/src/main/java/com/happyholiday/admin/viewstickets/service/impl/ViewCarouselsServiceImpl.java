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
import java.util.UUID;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.admin.viewstickets.Static;
import com.happyholiday.admin.viewstickets.dao.ImgsDaoI;
import com.happyholiday.admin.viewstickets.dao.ViewCarouselsDaoI;
import com.happyholiday.admin.viewstickets.pageModel.PageViewCarouselUpload;
import com.happyholiday.admin.viewstickets.pageModel.PageViewCarousels;
import com.happyholiday.admin.viewstickets.service.ViewCarouselsServiceI;
import com.happyholiday.admin.viewstickets.util.ReturnJSON;
import com.happyholiday.admin.viewstickets.util.Tools;
import com.happyholiday.model.Admins;
import com.happyholiday.model.Imgs;
import com.happyholiday.model.ViewticketCarousels;
@Service("viewCarouselservice")
public class ViewCarouselsServiceImpl implements ViewCarouselsServiceI{
	
	//配置dao
	private ViewCarouselsDaoI viewCarouselsdao;
	
	public ViewCarouselsDaoI getViewCarouselsdao() {
		return viewCarouselsdao;
	}
	@Autowired
	public void setViewCarouselsdao(ViewCarouselsDaoI viewCarouselsdao) {
		this.viewCarouselsdao = viewCarouselsdao;
	}
	
	private ImgsDaoI imgsViewsdao;
	
	public ImgsDaoI getImgsViewsdao() {
		return imgsViewsdao;
	}
	@Autowired
	public void setImgsViewsdao(ImgsDaoI imgsViewsdao) {
		this.imgsViewsdao = imgsViewsdao;
	}
	@Override
	public ReturnJSON<PageViewCarousels> getViewCarouselsDatagrid(
			PageViewCarousels pageModel,Admins onlineAdmin) throws Exception {

		// 验证权限
		BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_QUERY_VIEW_CAROUSRL);
		ReturnJSON<PageViewCarousels> retJSON = new ReturnJSON<PageViewCarousels>();
		List<ViewticketCarousels> carousels = viewCarouselsdao.get("from ViewticketCarousels  where 1 =  1 ", pageModel.getPage(), pageModel.getRows());
		List<PageViewCarousels> rows = Tools.copyPropertiesList(carousels, PageViewCarousels.class);
		int index = 0;
		for (ViewticketCarousels cs : carousels) {
			 Imgs img = cs.getImgs();
			 rows.get(index).setImgName(img.getImgName());
			 index ++;
		}
		Integer total = viewCarouselsdao.length("select count(*) from ViewticketCarousels  where 1 =  1");
		retJSON.setRows(rows);
		retJSON.setTotal(total);
		return retJSON;
	}

	@Override
	public void addCarouselImg(PageViewCarouselUpload pageModel,Admins onlineAdmin)
			throws Exception {// 验证权限
		BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_ADD_VIEW_CAROUSRL);
		InputStream is = null;
		OutputStream os = null;
		//上传的文件
		File uploadFile =pageModel.getUploadFile();
		//上传文件类型
		String uploadFileContentType = pageModel.getUploadFileContentType();
		//获取图片后缀
		String ext = uploadFileContentType.split("/")[1];
		//carousels的id
		String carouselsId = UUID.randomUUID().toString();
		//保存图片的名字
		String imgName = carouselsId + "."+ext;
		//基于myFile创建一个文件输入流  
		is = new FileInputStream(uploadFile);  
		// 设置上传文件目录  
		String uploadPath = Static.viewCarouselPath;
		// 设置目标文件  
		File toFile = new File(uploadPath,imgName);  
		// 创建一个输出流，等待数据库插入记录后，在写入文件
		os = new FileOutputStream(toFile);
		//写入数据库
		Imgs img = new Imgs();
		ViewticketCarousels vc  = new ViewticketCarousels();
		
		img.setId(UUID.randomUUID().toString());
		img.setImgName(imgName);
		imgsViewsdao.save(img);
		
		vc.setId(carouselsId);
		vc.setImgs(img);
		vc.setCreateTime(new Timestamp(new Date().getTime()));
		viewCarouselsdao.save(vc);
		//写入图片文件
		IOUtils.write(IOUtils.toByteArray(is), os);
		Tools.closeStream(is, os);
		
	}

	@Override
	public void deleteCarouselImg(PageViewCarousels pageModel,Admins onlineAdmin) throws Exception {
		// 验证权限
				BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_DELETE_VIEW_CAROUSRL);
		//获取需要删除的轮播对象
		ViewticketCarousels carousels = viewCarouselsdao.findById(ViewticketCarousels.class,pageModel.getId());
		//获取Img对象
		Imgs img = carousels.getImgs();
		//获取ImgName
		String imgName = img.getImgName();
		imgsViewsdao.delete(img);
		
		//删除文件
		Tools.deleteFile(Static.viewCarouselPath, imgName);
	}

}
