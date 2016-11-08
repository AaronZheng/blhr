package com.yoyo.blhr.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yoyo.blhr.dao.impl.QRCodeDao;
import com.yoyo.blhr.dao.model.QRCode;

/**
 * 
 * @author zhengchenglei
 *
 */
@Service
public class QRCodeManageService {
	
	@Autowired
	private QRCodeDao qrCodeDao;
	
	public void savePushCompany(QRCode qrCode){
		
		qrCodeDao.saveQRCode(qrCode);
	}
	
	
	public List<Map<String,Object>> queryQRCode(){
	
		return qrCodeDao.queryQRCode();
	}
	

}
