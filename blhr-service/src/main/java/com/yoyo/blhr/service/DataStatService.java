package com.yoyo.blhr.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yoyo.blhr.dao.impl.LoginDao;
import com.yoyo.blhr.dao.impl.OrderDao;

@Service("dataStatService")
public class DataStatService {

	@Autowired(required = false)
	private LoginDao loginDao;
	@Autowired(required = false)
	private OrderDao orderDao;
	
	static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	/**
	 * 
	 * @param fre
	 * @param type
	 * @return
	 */
	public Map<String, Object> querydataStat(String fre, String type) {
		List<Map<String, Object>> dataStat = new ArrayList<Map<String, Object>>();
		Integer total_bef7 = 0;
		Map<String, Object> retMap = new HashMap<String, Object>();
		
		int count = 7;
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		System.out.println("date:" + new Date());
		calendar.add(Calendar.DATE, -(count-1));
		Date date = calendar.getTime();
		
		if(type.equals("user")){
			//每天新增的
			dataStat = this.loginDao.dataSta(sdf.format(date));
			//7天前的总数量
			total_bef7 = this.loginDao.totalBefore7days(sdf.format(date));
			
		}else if(type.equals("order")){
			//每天新增的
			dataStat = this.orderDao.ordersSta(sdf.format(date));
			//7天前的总量
			total_bef7 = this.orderDao.totalOrdersBef7days(sdf.format(date));
		}
		retMap.put("addList", dataStat);
		retMap.put("befCount", total_bef7);
		System.out.println(retMap);
			
		return retMap;
	}

}
