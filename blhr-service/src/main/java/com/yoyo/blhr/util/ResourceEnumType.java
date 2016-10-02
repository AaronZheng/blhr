package com.yoyo.blhr.util;

/**
 * 
 * 
 * @author zcl
 *
 */
public enum ResourceEnumType {
	
	common_access_token("common_access_token","通用ACESS_TOKEN"),
	
	code_access_token("code_access_token","页面授权TOKEN"),
	
	share_signature_package("share_signature_package","sha1签名"),
	
	chat_signature_package("chat_signature_package","sha1签名"),
	
	pay_signature_package("pay_signature_package","sha1签名"),
	
	jsapi_ticket("jsapi_ticket","JS票据信息");
	
	private String name;
	
	private String value;

	/**
	 * @param name
	 * 
	 * @param value
	 */
    ResourceEnumType(String name, String value) {
		this.name = name;
		this.value = value;
	}
    
    
    /**
     * 
     * @return
     */
    public String getValue(){
    	return this.name;
    }
    
    /**
     * 
     * @return
     */
    public String getComment(){
    	return this.value;
    }
	
	

}
