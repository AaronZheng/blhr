package com.yoyo.blhr.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yoyo.blhr.util.BlhrArgumentCache;
import com.yoyo.blhr.util.CommonUtil;
import com.yoyo.blhr.util.ResourceEnumType;

@Controller
public class TestAction {
	
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
	

}
