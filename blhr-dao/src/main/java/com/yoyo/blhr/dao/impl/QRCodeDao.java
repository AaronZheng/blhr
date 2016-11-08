package com.yoyo.blhr.dao.impl;

import java.util.List;
import java.util.Map;

import com.yoyo.blhr.dao.model.QRCode;


/**
 * 
 * @author zhengchenglei
 *
 */
public interface QRCodeDao {
	
	void saveQRCode(QRCode qrCode);
	
	List<Map<String,Object>> queryQRCode();

}
