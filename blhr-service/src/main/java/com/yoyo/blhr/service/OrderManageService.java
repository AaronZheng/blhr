package com.yoyo.blhr.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yoyo.blhr.dao.impl.OrderDao;
import com.yoyo.blhr.dao.model.Orders;

@Service("orderManageService")
public class OrderManageService {

	@Autowired(required=false)
	private OrderDao orderDao;

	/**
	 * 
	 * @return
	 */
	public List<Map<String, Object>> queryOrders() {
		List<Map<String, Object>> orders = this.orderDao.queryOrders();
		return orders;
	}
	
	/**
	 * 
	 * @param orderId
	 * @return
	 */
	public Orders queryOrdersById(String orderId){
		
		return this.orderDao.queryOrdersById(orderId);
	}
	
	/**
	 * 
	 * @param openId
	 * @return
	 */
	public Orders queryOrderByOpenId(String openId){
		
		return this.orderDao.queryOrderByOpenId(openId);
	}
	
	/**
	 * 
	 * @param order
	 */
	public void saveOrders(Orders order){
		
		orderDao.saveOrders(order);
	}
	
	/**
	 * 
	 * @param nonce_str
	 */
	public void updateOrder(String nonce_str){
		
		orderDao.updateOrder(nonce_str);
	}

	public List<Map<String, Object>> queryOrdersPage(int startPage,int pageSize) {
		
		return orderDao.queryOrdersPage(startPage, pageSize);
	}

	public int queryAllOrdersNum() {
		return orderDao.queryAllOrdersNum();
	}
	
}
