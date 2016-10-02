package com.yoyo.blhr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yoyo.blhr.dao.impl.PayTypeDao;
import com.yoyo.blhr.dao.model.PayType;

@Service("boliPayService")
public class BoliPayService {
	
	@Autowired(required=false)
	private PayTypeDao payTypeDao;
	
	/**
	 * 
	 * @param payCode
	 * @return
	 */
	public PayType queryPayTypeByCode(String payCode){
		
		return payTypeDao.queryPayTypeByCode(payCode);
	}
	
	
	

}
