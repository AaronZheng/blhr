package com.yoyo.blhr.util;

import java.util.Arrays;
import java.util.Map;
import java.util.Set;

import org.apache.commons.codec.digest.DigestUtils;


/**
 * @description .....
 * 
 * @author zcl
 *
 */
public class MessagePackage {
	
	
	
	/**
	 * @description generate package ...
	 * 
	 * @param packageMap
	 * @return
	 */
	public static String packageMessage(Map<String,String> packageMap,boolean encode){
		
		if(packageMap == null||packageMap.size() == 0)
			return null;
		
		Set<String> keySet = packageMap.keySet();
		Object[] keys = keySet.toArray();
		Arrays.sort(keys);
		StringBuffer sb = new StringBuffer();
		boolean isFirst = true;
		for(Object key:keys){
			if(isFirst){
				sb.append(key).append(Constant.EQ_TAG).append(packageMap.get(key));
				isFirst = false;
			}else{
				sb.append(Constant.AND).append(key).append(Constant.EQ_TAG).append(packageMap.get(key));
			}
		}
		return sb.toString();
	}

	
	
	/**
	 * 
	 * @description package sign information ...
	 * 
	 * @param params
	 * 
	 * @param paternerKey
	 * 
	 * @return
	 */
	public static String packageSign(Map<String,String> params,String paternerKey){
		
		String signValue = DigestUtils.md5Hex(packageMessage(params,false)+ "&key=" + paternerKey).toUpperCase();
		
		return packageMessage(params,true) + "&sign=" + signValue;
	}
	
	
}
