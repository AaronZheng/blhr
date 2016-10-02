package com.yoyo.blhr.dao.impl;

import com.yoyo.blhr.dao.model.PayType;

/**
 * 
 * 
 * @author zcl
 *
 */
public interface PayTypeDao {
	
	
	/**
	 * @description query Pay Type by code information ...
	 * 
	 * @param payTypeCode
	 * 
	 * @return
	 */
	public PayType queryPayTypeByCode(String payTypeCode);

}
