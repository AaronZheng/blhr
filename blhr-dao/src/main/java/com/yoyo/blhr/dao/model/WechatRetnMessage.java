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
	
	// 鏀粯璇ョ瑪璁㈠崟鐨勭敤鎴�ID
	private String OpenId;	
	// 鍏紬鍙�id
	private String appid;		
	// 鐢ㄦ埛鏄惁鍏虫敞浜嗗叕浼楀彿銆� 涓哄叧娉紝0 涓烘湭鍏虫敞
	private int IsSubscribe;
	// 鏃堕棿鎴�	private long TimeStamp;	
	// 闅忔満瀛楃涓诧紱瀛楁鏉ユ簮锛氬晢鎴风敓鎴愮殑闅忔満瀛楃
	private String NonceStr;	
	// 瀛楁鍚嶇О锛氱鍚�	private String AppSignature;
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
	/*public long getTimeStamp() {
		return TimeStamp;
	}
	public void setTimeStamp(long timeStamp) {
		TimeStamp = timeStamp;
	}*/
	public String getNonceStr() {
		return NonceStr;
	}
	public void setNonceStr(String nonceStr) {
		NonceStr = nonceStr;
	}
	/*public String getAppSignature() {
		return AppSignature;
	}
	public void setAppSignature(String appSignature) {
		AppSignature = appSignature;
	}*/
	public String getSignMethod() {
		return SignMethod;
	}
	public void setSignMethod(String signMethod) {
		SignMethod = signMethod;
	}

	/*@Override
	public String toString() {
		return "WeChatBuyPost [OpenId=" + OpenId + ", AppId=" + appid
				+ ", IsSubscribe=" + IsSubscribe + ", TimeStamp=" + TimeStamp
				+ ", NonceStr=" + NonceStr + ", AppSignature=" + AppSignature
				+ ", SignMethod=" + SignMethod + "]";
	}*/
}