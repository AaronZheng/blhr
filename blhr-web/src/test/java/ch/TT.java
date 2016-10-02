package ch;

public class TT {
	
	public static void main(String[] args) {
		
		String retn = "<xml><return_code><![CDATA[SUCCESS]]></return_code>"+
"<return_msg><![CDATA[OK]]></return_msg>"+
"<appid><![CDATA[wxc46e199f49e7a958]]></appid>"+
"<mch_id><![CDATA[1365312702]]></mch_id>"+
"<nonce_str><![CDATA[sPVq12hVL76LR2Cg]]></nonce_str>"+
"<sign><![CDATA[FB328827E9FF9B022B6B0F53FDE696C4]]></sign>"+
"<result_code><![CDATA[SUCCESS]]></result_code>"+
"<prepay_id><![CDATA[wx20160802015354e7ce50ed530762400700]]></prepay_id>"+
"<trade_type><![CDATA[JSAPI]]></trade_type>"+
"</xml>";
		
		String tmp = "abc<prepay_id><![CDATA[wx20160802015354e7ce50ed530762400700]]></prepay_id>";
		
		String packages = tmp.substring(tmp.indexOf("<prepay_id><![CDATA[")+"<prepay_id><![CDATA[".length(), tmp.indexOf("]]></prepay_id>"));

		System.out.println(tmp.indexOf("<prepay_id><![CDATA["));
		System.out.println(packages);
		
	}

}
