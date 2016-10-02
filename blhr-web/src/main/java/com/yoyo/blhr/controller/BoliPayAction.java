package com.yoyo.blhr.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;
import com.yoyo.blhr.dao.model.Members;
import com.yoyo.blhr.dao.model.Orders;
import com.yoyo.blhr.dao.model.User;
import com.yoyo.blhr.dao.model.WechatRetnMessage;
import com.yoyo.blhr.service.BoliPayService;
import com.yoyo.blhr.service.MemberService;
import com.yoyo.blhr.service.OrderManageService;
import com.yoyo.blhr.service.UserInfoService;
import com.yoyo.blhr.util.BlhrArgumentCache;
import com.yoyo.blhr.util.BlhrConf;
import com.yoyo.blhr.util.CommonUtil;
import com.yoyo.blhr.util.Constant;
import com.yoyo.blhr.util.MessagePackage;
import com.yoyo.blhr.util.ResourceEnumType;
import com.yoyo.blhr.util.SequenceUtil;


@Controller
public class BoliPayAction {
	
	@Autowired
	private BoliPayService boliPayService;
	@Autowired
	private OrderManageService orderManageService;
	@Autowired
	private UserInfoService userInfoService;
	@Autowired
	private MemberService memberService;
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	/**
	 * @description action pay handle ...
	 * @param req
	 * @param code
	 * @param state
	 * @return
	 * @throws IOException
	 * @throws NoSuchAlgorithmException
	 */
    @RequestMapping("/bolipayt")
    public ModelAndView initBoliPayPaget(HttpServletRequest req,String code,String state) throws IOException, NoSuchAlgorithmException{
    	String openId = accessHandler(code);
    	ModelAndView mv = new ModelAndView("/blhrf/member");
    	String nonceStr = SequenceUtil.generateSequeueString();
    	String tradeNo = System.currentTimeMillis()+"";
    	String signValue = initPrepareBillInfo("支付测试","玻璃海支付",null,nonceStr,openId,tradeNo,CommonUtil.getIp(req),"1");
    	String message = CommonUtil.generatePayMessage("支付测试", "玻璃海支付", "1",openId,nonceStr, null, null, signValue,tradeNo);
    	logger.debug("=========message["+message+"]=======");
    	String retn = CommonUtil.sendMessageToInternet(BlhrConf.getInstance().getPay_url(),message);
    	logger.debug("=========返回报文["+retn+"]==========");
    	String timestamp = System.currentTimeMillis()/1000+"";
    	mv.addObject(Constant.APPID, BlhrConf.getInstance().getAppID());
    	mv.addObject(Constant.TIME_STAMP_U, timestamp);
    	mv.addObject(Constant.NONCESTR_U, nonceStr);
    	String packages = retn.substring(retn.indexOf(Constant.PACKAGE_START_TAG)+Constant.PACKAGE_START_TAG.length(), retn.indexOf(Constant.PACKAGE_END_TAG));
    	mv.addObject(Constant.PACKAGE, "prepay_id="+packages);
    	mv.addObject(Constant.PAY_SIGN, initMapSign(timestamp,packages,nonceStr));
    	mv.addObject(ResourceEnumType.pay_signature_package.getValue(), BlhrArgumentCache.getCacheData(ResourceEnumType.pay_signature_package.getValue()));
    	return mv;
    }
    
    
    
    /**
     * @description test pay handle ...
     * @param req
     * @param code
     * @param state
     * @return
     * @throws IOException
     * @throws NoSuchAlgorithmException
     */
    @RequestMapping("/bolipay")
    public ModelAndView initBoliPayPage(HttpServletRequest req,String code,String state) throws IOException, NoSuchAlgorithmException{
    	logger.debug("==============传入参数 state["+state+"]====");
    	String price = state.split("\\|")[0];
    	String orderNum = state.split("\\|")[1];
    	String payType = state.split("\\|")[2];
    	logger.debug("==============传入参数["+price+"] 订单号["+orderNum+"]====");
    	price = Double.parseDouble(price)*100+"";
    	String openId = accessHandler(code);
    	ModelAndView mv = new ModelAndView("/blhrf/pay");
    	String nonceStr = (orderNum == null?SequenceUtil.generateSequeueString():orderNum);
    	String tradeNo = System.currentTimeMillis()+"";
    	String signValue = initPrepareBillInfo("支付测试","玻璃海支付",null,nonceStr,openId,tradeNo,CommonUtil.getIp(req),(Integer.parseInt(price.split("\\.")[0]))+"");
    	String message = CommonUtil.generatePayMessage("支付测试", "玻璃海支付", (Integer.parseInt(price.split("\\.")[0]))+"",openId,nonceStr, null, null, signValue,tradeNo);
    	logger.debug("=========message["+message+"]=======");
    	String retn = CommonUtil.sendMessageToInternet(BlhrConf.getInstance().getPay_url(),message);
    	logger.debug("=========返回报文["+retn+"]==========");
    	String timestamp = System.currentTimeMillis()/1000+"";
    	mv.addObject(Constant.APPID, BlhrConf.getInstance().getAppID());
    	mv.addObject(Constant.TIME_STAMP_U, timestamp);
    	mv.addObject(Constant.NONCESTR_U, nonceStr);
    	String packages = retn.substring(retn.indexOf(Constant.PACKAGE_START_TAG)+Constant.PACKAGE_START_TAG.length(), retn.indexOf(Constant.PACKAGE_END_TAG));
    	mv.addObject(Constant.PACKAGE, "prepay_id="+packages);
    	mv.addObject(Constant.PAY_SIGN, initMapSign(timestamp,packages,nonceStr));
    	mv.addObject(Constant.USER_ID, openId);
    	mv.addObject(ResourceEnumType.pay_signature_package.getValue(), BlhrArgumentCache.getCacheData(ResourceEnumType.pay_signature_package.getValue()));
    	Orders oldOrder = orderManageService.queryOrderByOpenId(openId);
    	Orders order = generateOrder(openId,payType,nonceStr,oldOrder);
    	orderManageService.saveOrders(order);
    	return mv;
    }
    
    
    
    /**
     * 
     * @param order
     * @return
     */
    public Members generateMember(Orders order,Members members){
    	if(members == null){
	    	Members member = new Members();
	    	member.setExpireTime(order.getEndTime());
	    	member.setLrrq(new Date());
	    	member.setYxbj("Y");
	    	member.setChageTime(new Date());
	    	member.setPayType(order.getPayTypeId());
	    	member.setUserId(order.getUserId());
	    	return member;
    	}else{
    		members.setChageTime(new Date());
    		members.setPayType(order.getPayTypeId());
    		switch(Integer.parseInt(order.getPayTypeId())){
        	case 1: {Calendar cal = Calendar.getInstance(); cal.setTime(order.getStartTime());
        	cal.add(Calendar.YEAR, 1);members.setExpireTime(cal.getTime());}break;
        	case 2:{Calendar cal = Calendar.getInstance(); cal.setTime(order.getStartTime());
        	cal.add(Calendar.MONTH, 6);members.setExpireTime(cal.getTime());}break;
            case 3:{Calendar cal = Calendar.getInstance(); cal.setTime(order.getStartTime());
    	    cal.add(Calendar.MONTH, 1);members.setExpireTime(cal.getTime());}break;
            case 4:{Calendar cal = Calendar.getInstance(); cal.setTime(order.getStartTime());
    	    cal.add(Calendar.DATE, 1);members.setExpireTime(cal.getTime());}break;
    	}
    	    return members;

    	}
    }
    
    public Orders generateOrder(String openId,String payType,String nonceStr,Orders oldOrder){
    	User user = userInfoService.queryUserByUserId(openId);
    	Orders order = new Orders();
    	order.setOrderId(nonceStr);
    	order.setUserId(openId);
    	if(oldOrder != null && oldOrder.getEndTime().getTime() - new Date().getTime() >0)
    		order.setStartTime(oldOrder.getEndTime());
    	else
    		order.setStartTime(new Date());
    	order.setUsername(user.getUsername());
    	order.setWechatName(user.getWechatname());
    	order.setPayTypeId(payType);
    	order.setOrderState("2");
    	switch(Integer.parseInt(payType)){
    	case 1: {Calendar cal = Calendar.getInstance(); cal.setTime(order.getStartTime());
    	cal.add(Calendar.YEAR, 1);order.setEndTime(cal.getTime());}break;
    	case 2:{Calendar cal = Calendar.getInstance(); cal.setTime(order.getStartTime());
    	cal.add(Calendar.MONTH, 6);order.setEndTime(cal.getTime());}break;
        case 3:{Calendar cal = Calendar.getInstance(); cal.setTime(order.getStartTime());
	    cal.add(Calendar.MONTH, 1);order.setEndTime(cal.getTime());}break;
        case 4:{Calendar cal = Calendar.getInstance(); cal.setTime(order.getStartTime());
	    cal.add(Calendar.DATE, 1);order.setEndTime(cal.getTime());}break;
	}
    	order.setYxbj("Y");
    	return order;
    }
    
    
    /**
     * @description initialization first pay request ...
     * @param attach
     * @param body
     * @param detail
     * @param openId
     * @param ip
     * @param money
     * @return
     * @throws IOException
     */
    public String initPrepareBillInfo(String attach,String body,String detail,String nonceStr,String openId,
    		String tradeNo,String ip,String money) throws IOException{
    	Map<String,String> map = new HashMap<String,String>();
    	map.put(Constant.APPID, BlhrConf.getInstance().getAppID());
    	map.put(Constant.ATTACH, attach);map.put(Constant.BODY,body);
    	map.put(Constant.MCH_ID, BlhrConf.getInstance().getMch_id());
    	if(detail != null && "".equals(detail))
    		map.put(Constant.DETAIL, detail);
    	//map.put("detail", "{ \"goods_detail\":[ { \"goods_id\":\"iphone6s_16G\", \"wxpay_goods_id\":\"1001\", \"goods_name\":\"iPhone6s 16G\", \"quantity\":1, \"price\":528800, \"goods_category\":\"123456\", \"body\":\"苹果手机\" }, { \"goods_id\":\"iphone6s_32G\", \"wxpay_goods_id\":\"1002\", \"goods_name\":\"iPhone6s 32G\", \"quantity\":1, \"price\":608800, \"goods_category\":\"123789\", \"body\":\"苹果手机\" } ] }");
    	map.put(Constant.NONCE_STR, nonceStr);
    	map.put(Constant.NOTIFY_URL, BlhrConf.getInstance().getNotifyUrl());
    	map.put(Constant.OPENID, openId);
    	map.put(Constant.OUT_TRADE_NO, tradeNo);
    	map.put(Constant.BILL_IP_ADDRESS, "127.0.0.1");
    	map.put(Constant.TOTAL_FEE, money);
    	map.put(Constant.TRADE_TYPE, Constant.JSPAY);
    	return DigestUtils.md5Hex(MessagePackage.packageMessage(map,false)+ "&key=" + BlhrConf.getInstance().getPartnerKey()).toUpperCase();
    }
    
    
    /**
     * @description initialization sign key .. second validate pay
     * @param timestamp
     * @param packages
     * @return
     * @throws IOException
     */
    public String initMapSign(String timestamp,String packages,String nonceStr) throws IOException{
    	Map<String,String> map4 = new HashMap<String,String>();
    	map4.put("appId", BlhrConf.getInstance().getAppID()); 
    	map4.put("timeStamp", timestamp);
    	map4.put("nonceStr", nonceStr);
    	map4.put("package", "prepay_id="+packages);
    	map4.put("signType","MD5");
    	return DigestUtils.md5Hex(MessagePackage.packageMessage(map4, false)+ "&key=" + BlhrConf.getInstance().getPartnerKey()).toUpperCase();
    }
    
    
    /**
     * 
     * @param userId
     * @param isMember
     * @return
     * @throws IOException 
     * @throws UnsupportedEncodingException 
     */
    @RequestMapping("/openPayMenu")
    public ModelAndView openPayMenu(String userId,String isMember) throws UnsupportedEncodingException, IOException{
    	ModelAndView mv = new ModelAndView("/blhrf/member");
    	mv.addObject("username", CommonUtil.getUserNameByUserId(userId));
    	mv.addObject("category", ((User)BlhrArgumentCache.getCacheData(userId)).getCategory());
    	mv.addObject("photo", ((User)BlhrArgumentCache.getCacheData(userId)).getPhoto());
    	mv.addObject("userId", userId);
    	mv.addObject("isMember", isMember);
    	return mv;
    }
    
    
    /**
     * @param userId
     * @param payType
     * @return
     * @throws IOException 
     * @throws UnsupportedEncodingException 
     */
    @RequestMapping("/payAction")
    public ModelAndView payAction(String userId,String payType) throws UnsupportedEncodingException, IOException{
    	logger.debug("=====入参 ["+userId+"]======payType["+payType+"]========");
    	ModelAndView mv = new ModelAndView("blhrf/cash");
    	mv.addObject("username", CommonUtil.getUserNameByUserId(userId));
    	mv.addObject("category", ((User)BlhrArgumentCache.getCacheData(userId)).getCategory());
		mv.addObject("money", boliPayService.queryPayTypeByCode(payType).getPrice());
    	mv.addObject("photo", ((User)BlhrArgumentCache.getCacheData(userId)).getPhoto());
		mv.addObject("userId", userId);
		mv.addObject("payType", payType);
		mv.addObject("orderNum",SequenceUtil.generateSequeueString());
    	return mv;
    }
    
    
    
    
    /**
     * @param code
     * @return
     * @throws JSONException
     * @throws IOException
     */
    private String accessHandler(String code) throws JSONException, IOException{
    	String response = CommonUtil.getInformationFromInternet(BlhrConf.getInstance().getAccess_token_url().replace(Constant.CODE_TAG, code));
    	logger.debug("=====获取OPENID信息为["+response+"]");
    	return new JSONObject(response).getString(Constant.OPENID);
    }

    
    
    /**
     * 支付签名
     * @param timestamp
     * @param noncestr
     * @param packages
     * @return
     * @throws IOException 
     */
    public String paySign(String timestamp, String noncestr,String packages) throws IOException {
        Map<String, String> paras = new HashMap<String, String>();
        paras.put("appid", BlhrConf.getInstance().getAppID());
        paras.put("timestamp", timestamp);
        paras.put("noncestr", noncestr);
        paras.put("package", packages);
        paras.put("appkey",BlhrConf.getInstance().getPartnerKey());
        String string1 = MessagePackage.packageMessage(paras, false);
        String paySign = DigestUtils.sha1Hex(string1);
        return paySign;
    }
    
    
	
	/**
	 * @description package pay message ....
	 * 
	 * @return
	 * 
	 * @throws IOException 
	 */
	public String packageMessageToStr(HttpServletRequest req) throws IOException{
		String productName = "测试商品001"; String total_fee = "0.1";
		String orderid = "123456";
		Map<String, String> params = new HashMap<String, String>();
		productName = productName.replaceAll(" ", "");
		productName = productName.length() > 17 ? productName.substring(0, 17) + "..." : productName;
		params.put("body", productName);	//商品描述。
		params.put("total_fee", total_fee);	//订单总金额
		params.put("fee_type", "1");	//现金支付币种,取值： 1 （人民币）
		params.put("out_trade_no", orderid); //商户系统内部的订单号
		params.put("spbill_create_ip", CommonUtil.getIp(req)); // ip
	    // 公共参数
        params.put("bank_type", "WX");
        params.put("attach", "玻璃海支付");
        params.put("partner", BlhrConf.getInstance().getMch_id());
        params.put("notify_url", BlhrConf.getInstance().getNotifyUrl());
        params.put("input_charset", "UTF-8");
        return MessagePackage.packageSign(params,BlhrConf.getInstance().getPartnerKey());
	}
	
	
	/**
	 * @description call back ...
	 * @param req
	 * @param resp
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/notifyPay")
	public void notifyPayMessage(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		logger.debug("=================return call 进入回调流程=============");
		ServletInputStream in = req.getInputStream();
		XStream xs = new XStream(new DomDriver());
		xs.alias("xml", WechatRetnMessage.class);
		String xmlMsg = CommonUtil.inputStream2String(in);
		logger.info("============收到支付返回报文["+xmlMsg+"]=============");
    	String packages = xmlMsg.substring(xmlMsg.indexOf(Constant.NONCE_STR_START_TAG)+Constant.NONCE_STR_START_TAG.length(), xmlMsg.indexOf(Constant.NONCE_STR_END_TAG));
    	String openId = xmlMsg.substring(xmlMsg.indexOf(Constant.OPENID_START_TAG)+Constant.OPENID_START_TAG.length(), xmlMsg.indexOf(Constant.OPENID_END_TAG));
        orderManageService.updateOrder(packages);
        Orders order = orderManageService.queryOrdersById(packages);
        Members member = memberService.queryUserByCondiation(openId);
    	if(member == null)
    		memberService.saveMember(generateMember(order,member));
    	else
    		memberService.updateMember((generateMember(order,member)));
	
	}
	
	
	/**
	 * 
	 * @param req
	 * @return
	 * @throws IOException
	 * @throws NoSuchAlgorithmException 
	 */
   /* @RequestMapping("/bolipay")
	public ModelAndView initBoliPayPage(String code,String state) throws IOException, NoSuchAlgorithmException{
    	String openId = accessHandler(code);
		ModelAndView mv = new ModelAndView("/blhrf/pay");
		Map<String,String> map = new HashMap<String,String>();
		map.put("appid", BlhrConf.getInstance().getAppID());
		map.put("attach", "支付测试");map.put("body", "玻璃海支付");
		map.put("mch_id", BlhrConf.getInstance().getMch_id()); 
		//map.put("detail", "{ \"goods_detail\":[ { \"goods_id\":\"iphone6s_16G\", \"wxpay_goods_id\":\"1001\", \"goods_name\":\"iPhone6s 16G\", \"quantity\":1, \"price\":528800, \"goods_category\":\"123456\", \"body\":\"苹果手机\" }, { \"goods_id\":\"iphone6s_32G\", \"wxpay_goods_id\":\"1002\", \"goods_name\":\"iPhone6s 32G\", \"quantity\":1, \"price\":608800, \"goods_category\":\"123789\", \"body\":\"苹果手机\" } ] }");
	    String nonce_str = SequenceUtil.generateSequeueString();
		map.put("nonce_str", nonce_str);
		map.put("notify_url", BlhrConf.getInstance().getNotifyUrl());
		map.put("openid", openId);
		String trade_no = System.currentTimeMillis()/1000+"";
		map.put("out_trade_no", trade_no);
		map.put("spbill_create_ip", "127.0.0.1");
		map.put("total_fee", "1");
		map.put("trade_type", "JSAPI");
		
		String signValue = DigestUtils.md5Hex(MessagePackage.packageMessage(map,false)+ "&key=" + BlhrConf.getInstance().getPartnerKey()).toUpperCase();
		String message = CommonUtil.generatePayMessage("支付测试", "玻璃海支付", "1",openId, 
				nonce_str, null, null, signValue,trade_no);
		logger.debug("=========message["+message+"]");
		String retn = CommonUtil.sendMessageToInternet(BlhrConf.getInstance().getPay_url(),message);
		logger.debug("=========返回报文["+retn+"]");
		String timestamp = System.currentTimeMillis()/1000+"";
		mv.addObject("appid", BlhrConf.getInstance().getAppID());
		//mv.addObject("partnerId",BlhrConf.getInstance().getMch_id());
		mv.addObject("timeStamp", timestamp);
		mv.addObject("nonceStr", "1add1a30ac87aa2db72f57a2375d8fec");
		String packages = retn.substring(retn.indexOf("<prepay_id><![CDATA[")+"<prepay_id><![CDATA[".length(), retn.indexOf("]]></prepay_id>"));
		mv.addObject("package", "prepay_id="+packages);
		//mv.addObject("prepayid", packages);
	//	map.put("appid", BlhrConf.getInstance().getAppID());
		Map<String,String> map4 = new HashMap<String,String>();
		map4.put("appId", BlhrConf.getInstance().getAppID()); 
		map4.put("timeStamp", timestamp);
		map4.put("timeStamp", timestamp);
		map4.put("nonceStr", "1add1a30ac87aa2db72f57a2375d8fec");
		map4.put("package", "prepay_id="+packages);
		map4.put("signType","MD5");
		mv.addObject("paySign", DigestUtils.md5Hex(MessagePackage.packageMessage(map4, false)+ "&key=" + BlhrConf.getInstance().getPartnerKey()).toUpperCase());
		mv.addObject(ResourceEnumType.pay_signature_package.getValue(), BlhrArgumentCache.getCacheData(ResourceEnumType.pay_signature_package.getValue()));
		mv.addObject("isweixin", 1);
		return mv;
	}*/
	
}
