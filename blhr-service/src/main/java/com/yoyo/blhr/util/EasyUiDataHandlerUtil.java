package com.yoyo.blhr.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.json.JSONObject;


/**
 * 
 * @author zcl
 *
 */
public class EasyUiDataHandlerUtil {
	
	private final static String TOTAL = "total";
	
	private final static  String ROWS = "rows";
	
	
	
	/**
	 * @description generate grid data ... 
	 * 
	 * @param lismap
	 * @return
	 */
	public static String ConvertListMapToUiGrid(List<Map<String,Object>> lismap){
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		if(lismap == null || lismap.size() == 0){
			map.put(TOTAL, 0);
			map.put(ROWS, new ArrayList<Map<String,Object>>());	
			return  new JSONObject(map).toString();
		}
		map.put(TOTAL, lismap.size());
		map.put(ROWS, lismap);	
		return new JSONObject(map).toString();
		
	}
	
	
	
	
	
	

}
