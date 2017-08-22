package com.happyholiday.front.car.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
/**
 * 放置于application的一个map集合
 * @author Jhon
 *
 * @param <K>
 * @param <V>
 */
public class SessionMap<K,V>{
	private Map<K,V> sessionMap = null;
	private ServletContext app = null;
	private String mapName = "";
	
	
	
	public SessionMap(String mapName) {
		this.mapName = mapName;
		this.app = Tools.getSession().getServletContext();
		//如果app中含有sessionmap，那么获取
		Map<K,V> sessionMap = (Map<K, V>) this.app.getAttribute(mapName);
		if(sessionMap==null){
			//初始化map
			this.sessionMap = new HashMap<K,V>();
			//存入map到app
			this.app.setAttribute(mapName, this.sessionMap);
		}else{
			//初始化map
			this.sessionMap = sessionMap;
			
		}
		
	}
	

	/**
	 * 获取app中的map
	 * @return
	 */
	private Map<K, V> getSessionMap(String mapName) {
		return (Map<K, V>) app.getAttribute(mapName);
	}

	/**
	 * 设置map到app
	 * @param mapName
	 */
	private void setSessionMap(String mapName,Map<K, V> sessionMap) {
		app.setAttribute(mapName,sessionMap);
	}

	/**
	 * 添加参数
	 * @param key
	 * @param value
	 */
	public void addAttribute(K key,V value){
		Map<K,V> sessionMap = this.getSessionMap(this.mapName);
		sessionMap.put(key, value);
		this.setSessionMap(mapName, sessionMap);
		
	}
	/**
	 * 移除参数
	 * @param key
	 */
	public void removeAttribute(String key){
		Map<K,V> sessionMap = this.getSessionMap(this.mapName);
		sessionMap.remove(key);
		this.setSessionMap(mapName, sessionMap);
		
	}
}
