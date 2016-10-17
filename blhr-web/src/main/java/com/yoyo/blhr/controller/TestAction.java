package com.yoyo.blhr.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yoyo.blhr.dao.impl.LoginDao;
import com.yoyo.blhr.dao.model.VenderCarrierRelation;
import com.yoyo.blhr.util.BlhrArgumentCache;
import com.yoyo.blhr.util.CommonUtil;
import com.yoyo.blhr.util.ResourceEnumType;

@Controller
public class TestAction {
	
	@Autowired
    private LoginDao loginDao;
	
	@RequestMapping("/getPictureInfoTest")
	public String getPictureInfo() throws IOException{
		
		String serverId ="L_vnxV6EgF2QcC7LKaKE-xUNcc70sKqW7oxlg0YsqmliEBrfkzGTrWyKKFRhovT1";
		String token = (String) BlhrArgumentCache.getCacheData(ResourceEnumType.common_access_token.getValue());
		CommonUtil.StoreInformationFromInternet("https://api.weixin.qq.com/cgi-bin/media/get?access_token="+token+"&media_id="+serverId+"","E:/wechat/v.map3");
		String url = CommonUtil.sendMessageToInternet("https://api.weixin.qq.com/cgi-bin/media/get?access_token="+token+"&media_id="+serverId+"");
		System.out.println(url);
		return null;
	}
	
	@RequestMapping("/createDir")
	public void createDir(){
		
		File file = new File("/root/blhr/apache-tomcat-6.0.45/webapps/blhr-web/upload"+File.separator+new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
		file.mkdirs();
		
	}
	
	@RequestMapping("/insertRelation")
	public ModelAndView insertRelation(){
		
		ModelAndView mv = new ModelAndView("index");
		VenderCarrierRelation vcr = new VenderCarrierRelation();
		vcr.setVenderId(123L);
		vcr.setCarrierId(456L);
		//vcr.setIsDefault(null);
		vcr.setYn(0);
		loginDao.insertRelation(vcr);
		return mv;
	}
	
	
	

}
