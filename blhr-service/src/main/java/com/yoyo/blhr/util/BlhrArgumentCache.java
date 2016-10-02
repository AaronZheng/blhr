package com.yoyo.blhr.util;

import java.util.HashMap;
import java.util.Map;

/**
 * 
 * 
 * @author zcl
 *
 */
public class BlhrArgumentCache {
	
	private static Map<String,Object> cacheData = new HashMap<String,Object>();
	
	
	/**
	 * @description put data into data cache ....
	 * @param key
	 * @param value
	 */
	public static void cacheDataInfo(String key,Object value){
		cacheData.put(key, value);
	}
	
	/**
	 * @description get cache data ...
	 * @param key
	 * @return
	 */
	public static Object getCacheData(String key){
		return cacheData.get(key);
	}
	
	/**
	 * @description clear data cache .....
	 * 
	 * @return
	 */
	public static void clearCache(){
		cacheData.clear();
		cacheData = null;
	}
	

}
