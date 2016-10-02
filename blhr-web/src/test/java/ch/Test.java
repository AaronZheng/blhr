package ch;

import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.apache.commons.codec.digest.DigestUtils;
import org.json.JSONObject;

import com.yoyo.blhr.util.CommonUtil;
import com.yoyo.blhr.util.Constant;
import com.yoyo.blhr.util.MessagePackage;

public class Test {
	
	public static void main(String[] args) throws NoSuchAlgorithmException {
	/*	StringBuffer sb = new StringBuffer();
		sb.append("<xml>")
		.append("<appid>wx2421b1c4370ec43b</appid>")
		.append("<attach>支付测试</attach>")
		.append("<body>JSAPI支付测试</body>")
		.append("<mch_id>10000100</mch_id>")
		.append("<detail><![CDATA[{ \"goods_detail\":[ { \"goods_id\":\"iphone6s_16G\", \"wxpay_goods_id\":\"1001\", \"goods_name\":\"iPhone6s 16G\", \"quantity\":1, \"price\":528800, \"goods_category\":\"123456\", \"body\":\"苹果手机\" }, { \"goods_id\":\"iphone6s_32G\", \"wxpay_goods_id\":\"1002\", \"goods_name\":\"iPhone6s 32G\", \"quantity\":1, \"price\":608800, \"goods_category\":\"123789\", \"body\":\"苹果手机\" } ] }]]></detail>")
		.append("<nonce_str>1add1a30ac87aa2db72f57a2375d8fec</nonce_str>")
		.append("<notify_url>http://wxpay.weixin.qq.com/pub_v2/pay/notify.v2.php</notify_url>")
		.append("<openid>oUpF8uMuAJO_M2pxb1Q9zNjWeS6o</openid>")
		.append("<out_trade_no>1415659990</out_trade_no>")
		.append("<spbill_create_ip>14.23.150.211</spbill_create_ip>")
		.append("<total_fee>1</total_fee>")
		.append("<trade_type>JSAPI</trade_type>")
		.append("<sign>0CB01533B8C1EF103065174F50BCA001</sign>")
	    .append("</xml>");
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("appid", "wx2421b1c4370ec43b");
		map.put("attach", "支付测试");map.put("body", "JSAPI支付测试");
		map.put("mch_id", "10000100"); map.put("detail", "{ \"goods_detail\":[ { \"goods_id\":\"iphone6s_16G\", \"wxpay_goods_id\":\"1001\", \"goods_name\":\"iPhone6s 16G\", \"quantity\":1, \"price\":528800, \"goods_category\":\"123456\", \"body\":\"苹果手机\" }, { \"goods_id\":\"iphone6s_32G\", \"wxpay_goods_id\":\"1002\", \"goods_name\":\"iPhone6s 32G\", \"quantity\":1, \"price\":608800, \"goods_category\":\"123789\", \"body\":\"苹果手机\" } ] }");
		map.put("nonce_str", "1add1a30ac87aa2db72f57a2375d8fec");
		map.put("notify_url", "http://wxpay.weixin.qq.com/pub_v2/pay/notify.v2.php");
		map.put("openid", "oUpF8uMuAJO_M2pxb1Q9zNjWeS6o");
		map.put("out_trade_no", "1415659990");
		map.put("spbill_create_ip", "14.23.150.211");
		map.put("total_fee", "1");
		map.put("trade_type", "JSAPI");
		
		Map<String,String> map2 = new HashMap<String,String>();
	//	<sign>9A0A8659F005D6984697E2CA0A9CF3B7</sign>
		map2.put("appid", "wxd930ea5d5a258f4f");
		map2.put("mch_id", "10000100");
		map2.put("device_info", "1000");
		map2.put("body", "test"); map2.put("nonce_str", "ibuaiVcKdpRxkhJA");
		
		System.out.println(packageSign(map2,"192006250b4c09247ec02edce69f6a2d"));
		*/
		Map<String,String> map2 = new HashMap<String,String>();
		
		map2.put("appId","wx2421b1c4370ec43b");     //公众号名称，由商户传入     
		map2.put("timeStamp"," 1395712654");         //时间戳，自1970年以来的秒数     
		map2.put("nonceStr","e61463f8efa94090b1f366cccfbbb444"); //随机串     
		map2.put("package","prepay_id=u802345jgfjsdfgsdg888");     
	//	map2.put("signType","MD5");         //微信签名方式：     
	//	map2.put("paySign","70EA570631E4BB79628FBCA90534C63FF7FADD89"); //微信签名 
		
		System.out.println(DigestUtils.md5Hex(packageMessage(map2,false)).toUpperCase());
		
	//	JSONObject jsonobj = new JSONObject("{ \"goods_detail\":[ { \"goods_id\":\"iphone6s_16G\", \"wxpay_goods_id\":\"1001\", \"goods_name\":\"iPhone6s 16G\", \"quantity\":1, \"price\":528800, \"goods_category\":\"123456\", \"body\":\"苹果手机\" }, { \"goods_id\":\"iphone6s_32G\", \"wxpay_goods_id\":\"1002\", \"goods_name\":\"iPhone6s 32G\", \"quantity\":1, \"price\":608800, \"goods_category\":\"123789\", \"body\":\"苹果手机\" } ] }");
	//	System.out.println(jsonobj.);
		
	}
	
	/**
	 * 
	 * @description package sign information ...
	 * 
	 * @param params
	 * 
	 * @param paternerKey
	 * 
	 * @return
	 */
	public static String packageSign(Map<String,String> params,String paternerKey){
		
		String signValue = DigestUtils.md5Hex(packageMessage(params,false)+ "&key=" + paternerKey).toUpperCase();
		
		return packageMessage(params,true) + "&sign=" + signValue;
	}
	
	
	
	
	
	/**
	 * @description generate package ...
	 * 
	 * @param packageMap
	 * @return
	 */
	public static String packageMessage(Map<String,String> packageMap,boolean encode){
		
		if(packageMap == null||packageMap.size() == 0)
			return null;
		
		Set<String> keySet = packageMap.keySet();
		Object[] keys = keySet.toArray();
		Arrays.sort(keys);
		StringBuffer sb = new StringBuffer();
		boolean isFirst = true;
		for(Object key:keys){
			if(isFirst){
				sb.append(key).append(Constant.EQ_TAG).append(packageMap.get(key));
				isFirst = false;
			}else{
				sb.append(Constant.AND).append(key).append(Constant.EQ_TAG).append(packageMap.get(key));
			}
		}
		return sb.toString();
	}

	

	 /**
     * @description generate SHA1 code ...
     * 
     * @param data
     * 
     * @return
     * 
     * @throws NoSuchAlgorithmException
     */
    public static String generateSHA1Code(String data) throws NoSuchAlgorithmException{

		MessageDigest digest = java.security.MessageDigest.getInstance("SHA-1");
		digest.update(data.getBytes());
		byte messageDigest[] = digest.digest();
		StringBuffer hexString = new StringBuffer();
		// 字节数组转换为 十六进制 数
		for (int i = 0; i < messageDigest.length; i++) {
			String shaHex = Integer.toHexString(messageDigest[i] & 0xFF);
			if (shaHex.length() < 2) {
				hexString.append(0);
			}
			hexString.append(shaHex);
		}
		return hexString.toString();
    }
    
    
    
    
	/**
	 * @param propertiesName
	 * 
	 * @return
	 * 
	 * @throws IOException
	 */
	public static Map<Object,Object> loadProperties(String propertiesName) throws IOException{
		
		Properties properties = null;
		InputStream in = null;
		try{
			in = CommonUtil.class.getResourceAsStream(propertiesName);
			properties = new Properties();
			properties.load(in);
		}finally{
			if(in != null)
				in.close();
		}
		
		return properties;
	}
	

}
