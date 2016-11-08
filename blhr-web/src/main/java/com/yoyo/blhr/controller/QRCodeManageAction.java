package com.yoyo.blhr.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yoyo.blhr.dao.model.QRCode;
import com.yoyo.blhr.service.QRCodeManageService;
import com.yoyo.blhr.util.BlhrArgumentCache;
import com.yoyo.blhr.util.CommonUtil;
import com.yoyo.blhr.util.EasyUiDataHandlerUtil;
import com.yoyo.blhr.util.ResourceEnumType;
import com.yoyo.blhr.util.SequenceUtil;


@Controller
public class QRCodeManageAction {
	
	@Autowired
	private QRCodeManageService qrCodeManageService;
	
	@RequestMapping("/initQRCodePage")
	public ModelAndView initQRCodePage(){
		
		return new ModelAndView("/blhrb/qrCodeManage");
	}
	
	
	@ResponseBody
	@RequestMapping(value="savePushCompany",produces="application/json;charset=UTF-8")
	public String savePushCompany(String companyName) throws IOException{
		
		
		QRCode qrCode = new QRCode();
		qrCode.setCompanyName(companyName);
		qrCode.setCompanyId(SequenceUtil.generateSequeueString());
		qrCode.setLevel(1);
		
		String qrCodeAddress = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token="+BlhrArgumentCache.getCacheData(ResourceEnumType.common_access_token.getValue());
		String message = "{"+
				 "\"action_name\": \"QR_LIMIT_SCENE\","+
				 "\"action_info\": {"+
				 "\"scene\": {"+
				 "\"scene_id\": "+new Random().nextInt(1000)+""+
				 "}"+
				 "}"+
				 "}";
		String mge = CommonUtil.sendMessageToInternetByPost(qrCodeAddress, message);
		qrCode.setCompanyQrcode("https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket="+new JSONObject(mge).get("ticket"));
		qrCodeManageService.savePushCompany(qrCode);
		qrCode.setLrrq(new Date());
		List<Map<String,Object>> maps = qrCodeManageService.queryQRCode();
		for(Map<String,Object> map:maps)
			map.put("company_qrcode", "<img style=\"width: 80px; hight: 80px;\" src=\""+map.get("company_qrcode")+"\">");
		return EasyUiDataHandlerUtil.ConvertListMapToUiGrid2(maps, maps == null ? 0 :maps.size());
	}
	
	@ResponseBody
	@RequestMapping(value="queryQRCodeInfo",produces="application/json;charset=UTF-8")
	public String queryQRCodeInfo(){
		List<Map<String,Object>> maps = qrCodeManageService.queryQRCode();
		for(Map<String,Object> map:maps)
			map.put("company_qrcode", "<img style=\"width: 80px; hight: 80px;\" src=\""+map.get("company_qrcode")+"\">");
		return EasyUiDataHandlerUtil.ConvertListMapToUiGrid2(maps, maps == null ? 0 :maps.size());
	}
	

}
