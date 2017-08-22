package com.happyholiday.admin.officialwebsite.action;

import java.io.File;
import java.util.UUID;

import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.admin.officialwebsite.OwBackStatic;
import com.happyholiday.admin.officialwebsite.pageModel.PageOwNewsBack;
import com.happyholiday.admin.officialwebsite.service.OwNewsBackServiceI;
import com.happyholiday.admin.officialwebsite.util.OwBackReturnJSON;
import com.happyholiday.admin.officialwebsite.util.OwBackTools;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.front.officialwebsite.OwFrontStatic;
import com.happyholiday.model.Admins;
import com.opensymphony.xwork2.ModelDriven;
@Action(value="owNewsUploadBackAction")
public class OwNewsUploadBackAction extends OfficialwebsiteBackBaseAction  implements ModelDriven<PageOwNewsBack>{
	private OwNewsBackServiceI owNewsBackService;
	//注入owNewsBackService
	public OwNewsBackServiceI getOwNewsBackService() {
		return owNewsBackService;
	}
	@Autowired
	public void setOwNewsBackService(
			OwNewsBackServiceI owNewsBackService) {
		this.owNewsBackService = owNewsBackService;
	}
	//注入pageModel
	private PageOwNewsBack pageModel = new PageOwNewsBack();
	@Override
	public PageOwNewsBack getModel() {
		return pageModel;
	}

	
	/**
	 * 上传新闻内容的图片
	 */
	public void uploadNewsTextImg(){
		OwBackReturnJSON<PageOwNewsBack> retJSON = new OwBackReturnJSON<PageOwNewsBack>();
		try {
			
			String uuid = UUID.randomUUID().toString();
			String saveDirPath = OwBackStatic.OFFICIALWEBSITE_NEWS_IMG_PATH;
			String ext = pageModel.getImgFileContentType().split("/")[1];
			String imgName = uuid+"."+ext;
			OwBackTools.writeFile(pageModel.getImgFile(), saveDirPath, imgName);
			retJSON.setError(0);
			retJSON.setMsg("上传成功！");
			//图片的url
			String url = OwBackStatic.WEB_BASE_PATH+OwBackStatic.Ow_BACK_NAMESPACE+"/owNewsBackAction!getNewsTextImgByImgName.action?imgName="+imgName;
			OwBackStatic.log.info(url);
			retJSON.setUrl(url);
		}catch (Exception e) {
			retJSON.setError(1);
			retJSON.setMsg("上传失败！");
			e.printStackTrace();
		}finally{
			super.writeJSON(retJSON);
		}
		
	}
}
