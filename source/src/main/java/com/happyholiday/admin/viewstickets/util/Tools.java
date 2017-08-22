package com.happyholiday.admin.viewstickets.util;

import org.apache.log4j.Logger;

import java.awt.image.BufferStrategy;
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
import java.lang.reflect.Field;
import java.net.URL;
import java.nio.Buffer;
import java.nio.charset.Charset;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.Set;

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
import com.alibaba.fastjson.parser.Feature;
import com.alibaba.fastjson.serializer.SerializerFeature;

import com.happyholiday.dao.BaseDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.Adminpower;
import com.happyholiday.model.Admins;

public class Tools {
	
	/**
	 * set集合转化为list集合
	 * @param set
	 * @return
	 */
	public static <T> List<T> SetToList(Set<T> set){
		List<T> list = Tools.getArrayList();
		for (T s : set) {
			list.add(s);
		}
		return list;
	}
	/**
	 * 将pageModel的search*，max*，min*字段，设置为多条hql语句的where条件
	 * @param hqls ：为多个hql语句的的集合，都会加上相同的where语句，hql形式为“from Users t where 1=1”；
 * 					 要求：1.表名为t；2.且已有where 1=1 等类型的语句（本方法添加的hql语句将以and开头，连接到参数条件的后部）
	 * @param pageModel ：里面携带search*，表示模糊或则等于搜索，且*必须为数据库某列的名字；
	 * 					   里面携带的max*，和min*表示范围搜索，且*必须为数据库某列的名字
	 * 		 		            例如：需要检索的数据库字段名为status，那么pageModel字段为searchStatus，searchStatus的值为需要模糊查询的字符串
	 * 					   值情况：1.search*="null"，那么表示查询""；2.如果search*="",那么表示不查询；3.如果search*="其他字符串"，代表搜索
	 * @param params ： 需要将需要检索的字段参数添加带哦params，便于外部函数调用dao
	 */
	public static <T> void setSearchWhere(List<StringBuffer> hqls,T pageModel,Map<String,Object> params) {
		 try {
			Integer status = 0;
			//保存区间搜索的条件
			 Map<String,Object> maxMap = Tools.getHashMap();
			 Map<String,Object> minMap = Tools.getHashMap();
			 //保存属于表的字段，用户检测用户自定义的search*，max*，min*的合法性
			 List<String> tableCol = new ArrayList<String>();
			 
			 //获取非检索字段
			 Field[] fields = pageModel.getClass().getDeclaredFields();  
			 for (int j = 0; j < fields.length; j++) {  
				 fields[j].setAccessible(true);  
			     // 当前字段名
			     String everyfieldName = fields[j].getName();
			     tableCol.add(everyfieldName);
			 }
			 //遍历字段
			 for (int j = 0; j < fields.length; j++) {  
				 fields[j].setAccessible(true);  
			     // 当前字段名
			     String fieldName = fields[j].getName();
			     //以search，min，max开头的字段，便是需要检索的字段
			     if(fieldName.indexOf("search")==0||fieldName.indexOf("max")==0||fieldName.indexOf("min")==0){
			    	 //数据库中该字段的列名
			    	 String searchTableColName = "";
			    	 
			    	 if(fieldName.indexOf("search")==0){
			        	 searchTableColName = fieldName.replaceAll("search", "");
			        	 status = 0;
			    	 }else if(fieldName.indexOf("max")==0){
			    		 searchTableColName = fieldName.replaceAll("max", "");
			        	 status = 1;
			    	 }else if(fieldName.indexOf("min")==0){
			    		 searchTableColName = fieldName.replaceAll("min", "");
			        	 status = 2;
			    	 }
			    	 
			    	 //将第一个字母小写
			    	 searchTableColName = Tools.firstLetterToLowerCase(searchTableColName);
			    	 //获取对象指定字段
			    	 Object fieldValue = Tools.getFieldValue(fields[j], pageModel);
			    	 /*Static.log.info("检索字段==========================fieldName："+fieldName);
			    	 Static.log.info("检索字段的值==========================fieldValue："+fieldValue);
			    	 Static.log.info("检索字段的表列==========================searchTableColName："+searchTableColName);
					*/ 
			    	//如果是区间搜索
			    	 if(status==1&&fieldValue!=null){
			    		 maxMap.put(searchTableColName, fieldValue);
			    		 continue;
			    	 }
			    	 if(status==2&&fieldValue!=null){
			    		 minMap.put(searchTableColName, fieldValue);
			    		 continue;
			    	 }
			    	 //判断截取后的字段是否与表字段相同，如果不存在该表字段，那么结束，进行下一直字段的检索
			    	 //即检测用户自定义的search*，max*，min*的合法性
			    	 if(!tableCol.contains(fieldName)){
			    		 continue;
			    	 }
			    	//判断是否筛选phone
			 		if(fieldValue!=null){
			 			 //对list中的所有需要添加where的hql语句循环遍历
			        	 String queryFun = "like";
			        	 String add = "%%";
			        	 if(fieldValue.equals("")){
			        		 queryFun = "=";
			        		 add = "";
			        	 }
			        	 //采取何种查询
			        	 for (StringBuffer hql : hqls) {
			 				 //将类型转化为varchar进行查询
			        		 
			 				hql.append(" and cast(t."+searchTableColName+" as string) "+queryFun+" :"+fieldName);
			 			 }
			  			 //填写参数
			 			 params.put(fieldName,add+fieldValue+add);
			        	
			 		}
			    	  
			     }
			 }
			 //添加区间搜索添加
			 Set<String> keys = maxMap.keySet();
			 if(minMap.keySet().size()>=maxMap.keySet().size()){
				 keys = minMap.keySet();
			 }
			 
			 /*Static.log.info("minMap or maxMap Size:"+keys.size());*/
			 for (String key : keys) {
				//获取区间搜索的最大值，最小值
				Object minValue = minMap.get(key);
				Object maxValue = maxMap.get(key);
				if(minValue==null||minValue.equals("")){
					minValue = null;
				}
				if(maxValue==null||maxValue.equals("")){
					maxValue = null;
				}
				//设置参数列
				String filedMinName = "min"+Tools.firstLetterToUpperCase(key);
				String filedMaxName = "max"+Tools.firstLetterToUpperCase(key);
				
				if(minValue!=null){
					//采取何种查询
			   	 	for (StringBuffer hql : hqls) {
						 //将类型转化为varchar进行查询
						hql.append(" and t."+key+">= :"+filedMinName);
					 }
			   	 	//填写参数
				    params.put(filedMinName,minValue);
				}
				if(maxValue!=null){
					//采取何种查询
			   	 	for (StringBuffer hql : hqls) {
						 //将类型转化为varchar进行查询
						hql.append(" and t."+key+"<= :"+filedMaxName);
					 }
			   	 	//填写参数
			   	 params.put(filedMaxName,maxValue);
				}
				
				 
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} 
		
	}
	/**
	 * 获取obj对象的字段field的值
	 * @param field
	 * @param obj
	 * @return
	 * 如果val==null，那么 返回值=null；
	 * 如果val=""，那么 返回值=null；
	 * 如果val="null"，那么 返回值=""；
	 * 如果val="其他字符串"，那么 返回值="其他字符串"；
	 */
	public static Object getFieldValue(Field field,Object obj){
		//获取字段值，null代表部查询此字段，非null代表需要查询此字段
		Object fieldValue = null;
		//当前字段类型
	   	String fieldClazz = field.getType().getName();
		//如果为string
   	 	try {
			if(fieldClazz.equals(String.class.getName())){
				 String val = (String) field.get(obj);
				 //判断对字段如何处理，如果val==null，那么不做处理；
				 //如果val的字符串值为null，那么查询表中该该字段为""的信息；
				 if(val==null||val.trim().equals("")){
					 fieldValue = null;
				 }else if(val.trim().equals("null")){
					 fieldValue = "";
				 }else{
					 fieldValue = val;
				 }
			 //如果为integer
			 }else if(fieldClazz.equals(Integer.class.getName())){
				 fieldValue = (Integer) field.get(obj);
			 //如果为boolean
			 }else if(fieldClazz.equals(Boolean.class.getName())){
				 fieldValue = (Boolean) field.get(obj);
			 //如果为Timestamp
			 }else if(fieldClazz.equals(Timestamp.class.getName())){
				 fieldValue = (Timestamp) field.get(obj);
			 //如果为java.sql.Date
			 }else if(fieldClazz.equals(Date.class.getName())){
				 fieldValue = (Date) field.get(obj);
             //如果为java.util.Date
			 }else if(fieldClazz.equals(java.util.Date.class.getName())){
				 fieldValue = (java.util.Date) field.get(obj);
			 }else if(fieldClazz.equals(Double.class.getName())){
				 fieldValue = (Double) field.get(obj);
			 }
		}catch (Exception e) {
			e.printStackTrace();
		}
   	 	return fieldValue;
	}
	/**
	 * 将字符串的第一个字符转化为小写
	 * @param str
	 * @return
	 */
	public static String firstLetterToLowerCase(String str){
		return str.substring(0,1).toLowerCase()+str.substring(1,str.length());
	}
	/**
	 * 将字符串的第一个字符转化为大写
	 * @param str
	 * @return
	 */
	public static String firstLetterToUpperCase(String str){
		return str.substring(0,1).toUpperCase()+str.substring(1,str.length());
	}
	/**
	 * 判断一个字符串去点两边的空格后是否为空字符串
	 * @param str
	 * @return
	 */
	public static Boolean isEmptyTrimString(String str){
		if(str!=null&&!str.toString().trim().equals("")){
			return false;
		}
		return true;
	}
	
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
			String json = JSON.toJSONStringWithDateFormat(o, "yyyy-MM-dd HH:mm:ss", SerializerFeature.DisableCircularReferenceDetect);
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
	 * 快捷获取ArrayList,并且填写内容
	 * @param Contents
	 * @return
	 */
	public static <T> List<T> getArrayList(T[] Contents) {
		List<T> list = new ArrayList<T>();
		for (T t : Contents) {
			list.add(t);
		}
		return list;
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
	 * 获取当前在线admin对象，并且连接数据库更新
	 * @return
	 * @throws AdminsException 
	 */

	/**
	 * 获取当前在线t对象
	 * @param onlineObjectName
	 * @return
	 */
	public static <T> T getOnlineObject(String onlineObjectName){
		return (T) Tools.getSession().getAttribute(onlineObjectName);
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

	/**
	 * 验证admin是否具有某项权限
	 * @param adminId：需要验证的admin的id
	 * @param powerId：需要验证的权限的id
	 * @return
	 */
	
	/**
	 * 获取当前会话中指定的T对象
	 * @return
	 */
	public static <T> T getSessionObject(String sessionObjName){
		return (T) Tools.getSession().getAttribute(sessionObjName);
	}
}
