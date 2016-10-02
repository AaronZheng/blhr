package com.yoyo.blhr.dao.model;

import java.io.Serializable;

/**
 * @description convert post xml data to beean ...
 * 
 * @author zcl
 * 
 * @Time 2016/08/01
 *
 */
public class WechatRetnMessage implements Serializable{
	
	
	private static final long serialVersionUID = -1365604754597557984L;
	
	// 支付该笔订单的用户 ID
	private String OpenId;	
	// 公众号 id
	private String appid;		
	// 用户是否关注了公众号。1 为关注，0 为未关注
	private int IsSubscribe;
	// 时间戳
	private long TimeStamp;	
	// 随机字符串；字段来源：商户生成的随机字符
	private String NonceStr;	
	// 字段名称：签名
	private String AppSignature;
	// SHA1
	private String SignMethod;	
	
	
	public String getOpenId() {
		return OpenId;
	}
	public void setOpenId(String openId) {
		OpenId = openId;
	}
	
	public String getAppid() {
		return appid;
	}
	public void setAppid(String appid) {
		this.appid = appid;
	}
	public int getIsSubscribe() {
		return IsSubscribe;
	}
	public void setIsSubscribe(int isSubscribe) {
		IsSubscribe = isSubscribe;
	}
	public long getTimeStamp() {
		return TimeStamp;
	}
	public void setTimeStamp(long timeStamp) {
		TimeStamp = timeStamp;
	}
	public String getNonceStr() {
		return NonceStr;
	}
	public void setNonceStr(String nonceStr) {
		NonceStr = nonceStr;
	}
	public String getAppSignature() {
		return AppSignature;
	}
	public void setAppSignature(String appSignature) {
		AppSignature = appSignature;
	}
	public String getSignMethod() {
		return SignMethod;
	}
	public void setSignMethod(String signMethod) {
		SignMethod = signMethod;
	}

	@Override
	public String toString() {
		return "WeChatBuyPost [OpenId=" + OpenId + ", AppId=" + appid
				+ ", IsSubscribe=" + IsSubscribe + ", TimeStamp=" + TimeStamp
				+ ", NonceStr=" + NonceStr + ", AppSignature=" + AppSignature
				+ ", SignMethod=" + SignMethod + "]";
	}
}