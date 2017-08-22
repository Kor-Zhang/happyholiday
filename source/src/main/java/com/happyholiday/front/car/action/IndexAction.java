package com.happyholiday.front.car.action;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSONObject;
import com.happyholiday.action.BaseAction;
import com.happyholiday.front.car.Static;
import com.happyholiday.front.car.service.IndexServiceI;
import com.happyholiday.pagemodel.PageIndex;
import com.opensymphony.xwork2.ModelDriven;

@Namespace("/")
@Action(value = "indexAction", results = {
		@Result(name = "success", location = "/index.jsp"),
})
public class IndexAction extends BaseAction implements ModelDriven<PageIndex> {
	private PageIndex pageIndex = new PageIndex();

	@Override
	public PageIndex getModel() {
		// TODO 自动生成的方法存根
		return pageIndex;
	}

	private IndexServiceI indexService;

	public IndexServiceI getIndexService() {
		return indexService;
	}

	@Autowired
	public void setIndexService(IndexServiceI indexService) {
		this.indexService = indexService;
	}
	
	/**
	 * 利用AJAX来刷新 图片轮播
	 */
	public void   getCarouselInfo() {
			JSONObject jo =new JSONObject();
			List<PageIndex> ic = new ArrayList<PageIndex>();
			try {
				ic = indexService.getCarouselsImg(pageIndex);
				jo.put("rows", ic);
				jo.put("total",ic.size());
			/*	Tools.getSession().setAttribute(Static.CarouselsInfo, ic);*/
			} catch (Exception e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
			 super.writeJSON(jo.toJSONString());
	}

	public void getCarouselsImg() {
		String imgName = pageIndex.getCarouselsImgName();
		String indexImgPath = Static.indexPath;
		// 请求的图片资源
		String imgDir = indexImgPath + File.separator + imgName;
		File imgFile = new File(imgDir);
		writeImg(imgFile);
	}

}
