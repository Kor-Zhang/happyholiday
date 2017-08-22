package com.happyholiday.front.car.util;

import org.apache.log4j.Logger;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.BeanUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.happyholiday.front.car.Static;

public class Tools {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(Tools.class);
	/**
	 * 写入文件
	 * @param source ：需要写入的文件
	 * @param dir ： 写入的目录
	 * @param fileName ： 新的文件名
	 */
	public static void writeFile(File sourceFile,String dir,String fileName){
		//保存文件
		InputStream is = null;
		OutputStream os = null;
		try {
			is = new FileInputStream(sourceFile);
			// 设置目标文件  
			File toFile = new File(dir,fileName);  
			// 创建一个输出流，等待数据库插入记录后，在写入文件
			os = new FileOutputStream(toFile);
			//写入
			IOUtils.write(IOUtils.toByteArray(is), os);
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally{
			Tools.closeStream(is, os);
		}
		
	}
	/**
	 * 删除文件
	 * @param dir
	 * @param fileName
	 */
	public static void deleteFile(String dir,String fileName){
		File file = new File(dir,fileName);
		if(file.exists()){
			file.delete();
		}
	}
	/**
	 * 获取指定长度随机简体中文
	 * @param length
	 * @return
	 */
    public static String getRandomChinese(Integer length){
		String ret = "";
		for (int i = 0; i < length; i++) {
			String str = null;
			int hightPos, lowPos; // 定义高低位
			Random random = new Random();
			hightPos = (176 + Math.abs(random.nextInt(39))); // 获取高位值
			lowPos = (161 + Math.abs(random.nextInt(93))); // 获取低位值
			byte[] b = new byte[2];
			b[0] = (new Integer(hightPos).byteValue());
			b[1] = (new Integer(lowPos).byteValue());
			try {
				str = new String(b,"gbk"); // 转成中文
			} catch (UnsupportedEncodingException ex) {
				ex.printStackTrace();
			}
			ret += str;
		}
		return ret;
    }
	
	/**
	 * 获取web项目的路径
	 * @param sc
	 * @return
	 */
	public static String getWebAppsPath(ServletContext sc){
		String webAppspath = new File(sc.getRealPath("./")).getAbsolutePath();
		return webAppspath;
	}
	
	/**
	 * 根据bean的名称返回spring的bean的实例。 
	 * @param beanName ：需要获取的实例名
	 * @return
	 */
    public static <T> T getSpringBean(String beanName,ServletContext sc){  
        //通过WebApplicationContextUtils 得到Spring容器的实例。 
        ApplicationContext application = WebApplicationContextUtils.getWebApplicationContext(sc);  
        //返回Bean的实例
        return (T) application.getBean(beanName);  
    }  
    /**
	 * 返回一个json对象
	 * @param o
	 */
	public static void writeJSON(Object o) {
		PrintWriter pt = null;
		try {
			//提示信息
			logger.info("writeJSON:"+o);
			//获取输出流
			pt = ServletActionContext.getResponse().getWriter();
			//序列化对象
			String json = JSON.toJSONStringWithDateFormat(o, "yyyy-MM-dd HH:mm:ss",SerializerFeature.DisableCircularReferenceDetect);
			//写入对象
			pt.write(json);
			pt.flush();
			pt.close();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			//关闭
			pt.close();
		}
	}
	/**
	 * 获取公网ip
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	public static String getInternetIp(HttpServletRequest request){
		
		if (request == null) {
			return "";
		}
		String ipString = request.getHeader("x-forwarded-for");
		if (StringUtils.isBlank(ipString) || "unknown".equalsIgnoreCase(ipString)) {
			ipString = request.getHeader("Proxy-Client-IP");
		}
		if (StringUtils.isBlank(ipString) || "unknown".equalsIgnoreCase(ipString)) {
			ipString = request.getHeader("WL-Proxy-Client-IP");
		}
		if (StringUtils.isBlank(ipString) || "unknown".equalsIgnoreCase(ipString)) {
			ipString = request.getRemoteAddr();
		}

		// 多个路由时，取第一个非unknown的ip
		final String[] arr = ipString.split(",");
		for (final String str : arr) {
			if (!"unknown".equalsIgnoreCase(str)) {
				ipString = str;
				break;
			}
		}
		return ipString;
	}
	/**
	 * url获取json信息
	 * @param url
	 * @return
	 * @throws IOException
	 * @throws JSONException
	 */
	public static JSONObject readJsonFromUrl(String url) throws IOException, JSONException {
	    InputStream is = new URL(url).openStream();
	    try {
	      BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
	      String jsonText = IOUtils.toString(rd);
	      JSONObject json =JSONObject.parseObject(jsonText);
	      return json;
	    } finally {
	      is.close();
	    }
	  }

	/**
	 * 快捷获取hashmap
	 * @author Jhon
	 * @return
	 */
	public static Map<String, Object> getHashMap() {
		
		return new HashMap<String,Object>();
	}
	/**
	 * 快捷获取hashmap,设置参数
	 * @author Jhon
	 * @param <T>
	 * @param <V>
	 * @return
	 */
	public static <T, V> Map<T, V> getHashMap(T[] keys,V[] values) {
		/**
		 * 1.生成map
		 * 2.设置map的键值对
		 * 3.返回map
		 */
		//1.生成map
		Map<T, V> map = new HashMap<T,V>();
		//2.设置map的键值对
		int i = 0;
		for (T key : keys) {
			map.put(key, values[i]);
			i++;
		}
		//3.返回map
		return map;
	}
	/**
	 * 快捷获取ArrayList
	 * @author Jhon
	 * @param <T>
	 * @return
	 */
	public static <T> List<T> getArrayList() {
		
		return new ArrayList<T>();
	}
	
	
	/**
	 * 判断当前会话obj是否在线
	 * @return
	 */
	public static Boolean isObjectOnline(String sessionObjName){
		/**
		 * 1.获取session中的obj对象
		 * 2.判断对象是否为空
		 * 	-返回判断结果
		 */
		//1.获取session中的obj对象
		Object onlineObj = Tools.getSession().getAttribute(sessionObjName);
		//2.判断对象是否为空
		if(onlineObj==null){
			return false;
		}
		return true;
	}
	/**
	 * 获取当前会话中指定的T对象
	 * @return
	 */
	public static <T> T getSessionObject(String sessionObjName){
		return (T) Tools.getSession().getAttribute(sessionObjName);
	}
	/**
	 * 获取struts2封装的的HttpSession
	 * @return
	 */
	public static HttpSession getSession(){
		return ServletActionContext.getRequest().getSession();
	}
	
	/**
	 * 获取struts2封装的的HttpServletResponse
	 * @return
	 */
	public static HttpServletResponse getRes(){
		return ServletActionContext.getResponse();
	}
	/**
	 * 获取struts2封装的的HttpServletRequest
	 * @return
	 */
	public static HttpServletRequest getReq(){
		return ServletActionContext.getRequest();
	}
	/**
	 * List'T'转化为List'S'，注意：T与S中，成员变量名相同成员变量值才可以复制
	 * @author Jhon
	 * @param sourceList 需要转化的list集合（源list）
	 * @param targetClazz 转化后(转化后)的list的类型
	 * @return
	 */
	public static<S,T> List<T> copyPropertiesList(List<S> sourceList,Class<T> targetClazz){
		/**
		 * 1.新建一个list，名为target，作为返回参数，储存转化后的对象
		 * 2.实现sourceList的转化，转置到新的target中
		 * 	-如果sourceList不为空，循环遍历sourceList里面的对象，调用BeanUtils.copyProperties(s, t)方法，实现单个对象的转化，将转换后的每个对象储存入target中
		 * 3.返回target
		 */
		//1.新建target list
		List<T> target = new ArrayList<T>();
		//2.实现sourceList的转置
		if(sourceList!=null&&!sourceList.isEmpty()){
			for (S s : sourceList) {
				T t = null;
				try {
					t = targetClazz.newInstance();
				} catch (InstantiationException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				};
				BeanUtils.copyProperties(s, t);
				target.add(t);

			}
		}
		//2.返回集合
		return target;
	}
	
	/**
	 * 加载properties
	 * @param fileName
	 * @return
	 * @throws Exception
	 */
	public static Properties loadProperties(String fileName) {
		/**
		 *1.新建一个properties对象作为返回参数
		 *2.加载properties文件
		 *	-使用ClassLoader加载类资源 
		 *3.关闭流
		 *4.返回参数
		 */
		//1.新建Properties
		Properties pro = new Properties();
		//2.加载properties文件
		InputStream inStream = Tools.class.getClassLoader()
				.getResourceAsStream(fileName);
		try {
			pro.load(inStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
		//3.关闭流
		Tools.closeStream(inStream, null);
		//4.返回参数
		return pro;
	}
	/**
	 * 关闭流
	 * @param is
	 * @param os
	 */
	public static void closeStream(InputStream is,OutputStream os){
		/**
		 * 1.判断流是否为null
		 * 2.执行操作
		 */
		//1.判断流是否为null
		if(is!=null){
			//2.执行操作
			try {
				is.close(); 
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		//1.判断流是否为null
		if(os!=null){
			//2.执行操作
			try {
				os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
}
