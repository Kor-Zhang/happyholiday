package com.happyholiday.admin.officialwebsite.action;

import java.io.File;
import java.util.UUID;

import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.admin.officialwebsite.OwBackStatic;
import com.happyholiday.admin.officialwebsite.pageModel.PageOwServiceBack;
import com.happyholiday.admin.officialwebsite.service.OwServiceBackServiceI;
import com.happyholiday.admin.officialwebsite.util.OwBackReturnJSON;
import com.happyholiday.admin.officialwebsite.util.OwBackTools;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.front.officialwebsite.OwFrontStatic;
import com.happyholiday.model.Admins;
import com.opensymphony.xwork2.ModelDriven;
@Action(value="owServiceUploadBackAction")
public class OwServiceUploadBackAction extends OfficialwebsiteBackBaseAction  implements ModelDriven<PageOwServiceBack>{
	private OwServiceBackServiceI owServiceBackService;
	//注入owServiceBackService
	public OwServiceBackServiceI getOwServiceBackService() {
		return owServiceBackService;
	}
	@Autowired
	public void setOwServiceBackService(
			OwServiceBackServiceI owServiceBackService) {
		this.owServiceBackService = owServiceBackService;
	}
	//注入pageModel
	private PageOwServiceBack pageModel = new PageOwServiceBack();
	@Override
	public PageOwServiceBack getModel() {
		return pageModel;
	}

	
	/**
	 * 上传业务内容的图片
	 */
	public void uploadServiceTextImg(){
		OwBackReturnJSON<PageOwServiceBack> retJSON = new OwBackReturnJSON<PageOwServiceBack>();
		try {
			
			String uuid = UUID.randomUUID().toString();
			String saveDirPath = OwBackStatic.OFFICIALWEBSITE_SERVICE_IMG_PATH;
			String ext = pageModel.getImgFileContentType().split("/")[1];
			String imgName = uuid+"."+ext;
			OwBackTools.writeFile(pageModel.getImgFile(), saveDirPath, imgName);
			retJSON.setError(0);
			retJSON.setMsg("上传成功！");
			//图片的url
			String url = OwBackStatic.WEB_BASE_PATH+OwBackStatic.Ow_BACK_NAMESPACE+"/owServiceBackAction!getServiceTextImgByImgName.action?imgName="+imgName;
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
