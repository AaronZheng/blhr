package com.yoyo.blhr.util;

import java.io.IOException;
import java.io.Serializable;
import java.util.Map;


/**
 * 
 * @system configuration information
 * 
 * @author zcl
 *
 */
public class BlhrConf implements Serializable {

	private static final long serialVersionUID = 6519495931910431799L;
	
	private String appID;
	
	private String appSecret;
	
	private String user_authorize_url;
	
	private String access_token_url;
	
	private String refresh_token_url;
	
	private String pull_userinfo_url;
	
	private String common_access_token_url;
	
	private String jsapi_ticket;
	
	private String share_url;
	
	private String chat_url;
	
	private String pay_url;
	
	private String mch_id;
	
	private String notifyUrl;
	
	private String partnerKey;
	
	private String init_pay_url;
	
	private static BlhrConf instance;
	
	
	/**
	 * @description initialization system configuration information ...
	 * 
	 * @throws IOException
	 */
	private BlhrConf() throws IOException {
		Map<Object,Object> map = CommonUtil.loadProperties("/wechat.properties");
		if(map == null)
			return ;
		this.appID = (String) map.get("AppID");
		this.appSecret = (String) map.get("AppSecret");
		this.user_authorize_url = (String) map.get("user_authorize_url");
		this.access_token_url = (String) map.get("access_token_url");
		this.refresh_token_url = (String) map.get("refresh_token_url");
		this.pull_userinfo_url = (String) map.get("pull_userinfo_url");
		this.common_access_token_url = (String) map.get("common_access_token_url");
		this.share_url = (String) map.get("share_url");
		this.jsapi_ticket = (String) map.get("jsapi_ticket");
		this.pay_url = (String) map.get("pay_url");
		this.mch_id = (String) map.get("mch_id");
		this.notifyUrl = (String) map.get("notifyUrl");
		this.partnerKey = (String) map.get("partnerKey");
		this.init_pay_url = (String) map.get("init_pay_url");
		this.chat_url = (String) map.get("chat_url");
	}
	
	
	/**
	 * @description generate single instance ...
	 * 
	 * @return
	 * 
	 * @throws IOException
	 */
	public synchronized static BlhrConf getInstance() throws IOException{
		
		if(instance == null)
 			instance = new BlhrConf();
		return instance;
		
	}

	public String getAppID() {
		return appID;
	}

	public String getAppSecret() {
		return appSecret;
	}

	public String getUser_authorize_url() {
		return user_authorize_url;
	}

	public String getAccess_token_url() {
		return access_token_url;
	}

	public String getRefresh_token_url() {
		return refresh_token_url;
	}

	public String getPull_userinfo_url() {
		return pull_userinfo_url;
	}

	public String getCommon_access_token_url() {
		return common_access_token_url;
	}

	public String getJsapi_ticket() {
		return jsapi_ticket;
	}

	public String getShare_url() {
		return share_url;
	}

	public String getPay_url() {
		return pay_url;
	}

	public String getMch_id() {
		return mch_id;
	}

	public String getNotifyUrl() {
		return notifyUrl;
	}

	public String getPartnerKey() {
		return partnerKey;
	}


	public String getInit_pay_url() {
		return init_pay_url;
	}

	public String getChat_url() {
		return chat_url;
	}
	
}
