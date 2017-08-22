package com.happyholiday.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.happyholiday.PubStatic;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.util.PubTools;


public class BaseAction {
	
	public void writeJSON(Object o) {
		PubTools.writeJSON(o);
	}
	/**
	 * 返回二进制图片
	 * @param imgFile ：需要写到response的图片文件
	 */
	public void writeImg(File imgFile){
		//提示信息
		PubStatic.log.info("返回图片:"+imgFile.getAbsolutePath());
		//获取response对象
		HttpServletResponse response = null;
		//声明输出流
		OutputStream os = null;
		//声明输入流
		FileInputStream fis = null;
		try {
			//获取response
			response = ServletActionContext.getResponse();
			//获取响应输出流
			os = response.getOutputStream();
			//文件流获取
			fis = new FileInputStream(imgFile);
			response.setHeader("Content-Type", "image/jped");// 设置响应的媒体类型，这样浏览器会识别出响应的是图片
			//写入数据
			os.write(IOUtils.toByteArray(fis));
			
			response.flushBuffer();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			//关闭流
			PubTools.closeStream(fis, os);
			
		}
	}
	
}
