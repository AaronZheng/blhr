package com.yoyo.blhr.dao.impl;

import java.util.List;
import java.util.Map;

import com.yoyo.blhr.dao.model.Orders;

public interface OrderDao {

	/**
	 * 
	 * @return
	 */
	List<Map<String, Object>> queryOrders();

	/**
	 * 
	 * @param format
	 * @return
	 */
	List<Map<String, Object>> ordersSta(String format);
	
	/**
	 * 
	 * @param orderId
	 * @return
	 */
	Orders queryOrdersById(String orderId);
	
	/**
	 * 
	 * @param openId
	 * @return
	 */
	Orders queryOrderByOpenId(String openId);
	
	
	/**
	 * 
	 * @param order
	 */
	void saveOrders(Orders order);
	
	/**
	 * 
	 * @param nonce_Str
	 */
	void updateOrder(String nonce_Str);
	

	/**
	 * 
	 * @param format
	 * @return
	 */
	Integer totalOrdersBef7days(String format);

}
