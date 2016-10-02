package com.yoyo.blhr.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.json.JSONException;
import org.json.JSONObject;

import sun.misc.BASE64Decoder;

import com.sun.xml.internal.messaging.saaj.util.ByteOutputStream;
import com.yoyo.blhr.dao.model.User;

/**
 * 
 * @author zcl
 *
 */
public class CommonUtil {
	
	private static Logger logger = Logger.getLogger(CommonUtil.class);
	

    /**
     * 将字节数组转换为十六进制字符串
     * 
     * @param byteArray
     * @return
     */
    public static String byteToStr(byte[] byteArray) {
        String strDigest = "";
        for (int i = 0; i < byteArray.length; i++) {
            strDigest += byteToHexStr(byteArray[i]);
        }
        return strDigest;
    }
    
    /**
	 * @description 获取ip
	 * 
	 * @param request
	 * 
	 * @return
	 */
	public static String getIp(HttpServletRequest request) {
		if (request == null)
			return "";
		String ip = request.getHeader("X-Requested-For");
		if (StringUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip))
			ip = request.getHeader("X-Forwarded-For");
		if (StringUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip))
			ip = request.getHeader("Proxy-Client-IP");
		if (StringUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip))
			ip = request.getHeader("WL-Proxy-Client-IP");
		if (StringUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip))
			ip = request.getHeader("HTTP_CLIENT_IP");
		if (StringUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip))
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		if (StringUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip))
			ip = request.getRemoteAddr();
		return ip;
	}

    /**
     * 将字节转换为十六进制字符串
     * 
     * @param mByte
     * @return
     */
    private static String byteToHexStr(byte mByte) {
        char[] Digit = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A',
                'B', 'C', 'D', 'E', 'F' };
        char[] tempArr = new char[2];
        tempArr[0] = Digit[(mByte >>> 4) & 0X0F];
        tempArr[1] = Digit[mByte & 0X0F];

        String s = new String(tempArr);
        return s;
    }

    public static void sort(String a[]) {
        for (int i = 0; i < a.length - 1; i++) {
            for (int j = i + 1; j < a.length; j++) {
                if (a[j].compareTo(a[i]) < 0) {
                    String temp = a[i];
                    a[i] = a[j];
                    a[j] = temp;
                }
            }
        }
    }
    
    
    
    /**
     * 
     * @param userId
     * @return
     * @throws IOException 
     * @throws UnsupportedEncodingException 
     */
    public static String getUserNameByUserId(String userId) throws UnsupportedEncodingException, IOException{
    	User user = (User)BlhrArgumentCache.getCacheData(userId);
    	return (user.getUsername()==null||"".equals(user.getUsername())? new String(new BASE64Decoder().decodeBuffer(user.getWechatname()),"UTF-8"):user.getUsername());
    }
    
    
   
    /**
     * @description generate boli pay message ...
     * @param appId
     * @param title
     * @param body
     * @param shopId
     * @return
     * @throws IOException 
     */
    public static String generatePayMessage(String title,String body,String total_fee,String openId,
    		String nonce_str,Map<String,List<Map<String,String>>> goodsDetail,String ip,String sign,String trade_no) throws IOException{
    	
    	Document document = DocumentHelper.createDocument();
    	Element ele = document.addElement("xml");
    	ele.addElement("appid").setText(BlhrConf.getInstance().getAppID());
    	ele.addElement("attach").setText(title);
    	ele.addElement("body").setText(body);
    	ele.addElement("mch_id").setText(BlhrConf.getInstance().getMch_id());
    	//ele.addElement("detail").addCDATA(new JSONObject(goodsDetail).toString());
    	ele.addElement("nonce_str").setText(nonce_str);
    	ele.addElement("notify_url").setText(BlhrConf.getInstance().getNotifyUrl());
    	ele.addElement("openid").setText(openId);
    	ele.addElement("out_trade_no").setText(trade_no);
    	ele.addElement("spbill_create_ip").setText("127.0.0.1");
    	ele.addElement("total_fee").setText(total_fee);
    	ele.addElement("trade_type").setText("JSAPI");
    	ele.addElement("sign").setText(sign);
    	return ele.asXML();
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
	
	/**
	 * @param fileName
	 * 
	 * @return
	 * 
	 * @throws TscpBaseException 
	 * 
	 * @throws IOException 
	 */
	@SuppressWarnings("deprecation")
	public static String readStrFromFile(String fileName,String encode) throws Throwable{
		
		InputStream in = null;
		ByteOutputStream bos = null;
		try{
			in = CommonUtil.class.getResourceAsStream("/"+fileName);
			if(in == null)
				throw new FileNotFoundException("The file ["+fileName+"]don't be exist !");
			bos = new ByteOutputStream();
			bos.write(in);
			return new String(bos.toByteArray(),encode);
		}catch(Throwable e){
			throw e;
		}finally{
			if(in != null)
				in.close();
			if(bos != null)
				bos.close();
		}
	}
	
	/**
	 * @param URL
	 * @return
	 * @throws IOException
	 */
	@SuppressWarnings("deprecation")
	public static String getInformationFromInternet(String URL) throws IOException{
		URL urlGet = new URL(URL);
		HttpURLConnection http = (HttpURLConnection) urlGet.openConnection();
		http.setRequestMethod("POST"); 
		http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
		http.setDoOutput(true);
		http.setDoInput(true);
		System.setProperty("sun.net.client.defaultConnectTimeout", "30000");
		System.setProperty("sun.net.client.defaultReadTimeout", "30000");
		http.connect();
		InputStream is = null;
		ByteOutputStream bos = null;
		try{
			is = http.getInputStream();
			byte[] _b = new byte[1024];
			int l = 0 ;
		    bos = new ByteOutputStream();
			while((l= is.read(_b))>0){
				bos.write(_b, 0, l);
				l = 0 ;
			}
			return new String(bos.toByteArray(), "UTF-8");
		}finally{
			if(is != null)
				is.close();
			if(bos != null)
				bos.close();
		}
	}
	
	/**
	 * 
	 * @param URL
	 * @return
	 * @throws IOException
	 */
	public static void StoreInformationFromInternet(String URL,String filePath) throws IOException{
		URL urlGet = new URL(URL);
		HttpURLConnection http = (HttpURLConnection) urlGet.openConnection();
		http.setRequestMethod("GET"); 
		http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
		http.setDoOutput(true);
		http.setDoInput(true);
		System.setProperty("sun.net.client.defaultConnectTimeout", "30000");
		System.setProperty("sun.net.client.defaultReadTimeout", "30000");
		http.connect();
		File file = new File(filePath);
		if(!file.getParentFile().exists()) file.getParentFile().mkdirs();
		InputStream is = null; OutputStream out = null;
		try{
			is = http.getInputStream();
			byte[] _b = new byte[1024];
			int l = 0 ; out = new FileOutputStream(file);
			while((l= is.read(_b))>0){
				out.write(_b, 0, l);
				l = 0 ;
			}
		}finally{
			if(is != null)
				is.close();
			if(out != null)
				out.close();
		}
	}
	
	
	/**
	 * 
	 * @param url
	 * @param message
	 * @return
	 * @throws IOException 
	 */
	@SuppressWarnings("deprecation")
	public static String sendMessageToInternet(String url,String message) throws IOException{
		
		InputStream in =null;
		OutputStream out = null;
		try{
			URL urlGet = new URL(url);
			HttpURLConnection http = (HttpURLConnection) urlGet.openConnection();
			http.setRequestMethod("GET"); 
			http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
			http.setDoOutput(true);
			http.setDoInput(true);
			System.setProperty("sun.net.client.defaultConnectTimeout", "30000");// 连接超时30秒
			System.setProperty("sun.net.client.defaultReadTimeout", "30000"); // 读取超时30秒
			http.connect();
			out = http.getOutputStream();
			out.write(message.getBytes("UTF-8"));
			in = http.getInputStream();
			ByteOutputStream bos = new ByteOutputStream();
			byte[] b = new byte[1024];
			int l;
			while((l=in.read(b))>0){
				bos.write(b,0,l);
			}
			bos.close();
			return new String(bos.toByteArray(),"UTF-8");
		}finally{
			if(in != null)
				in.close();
			if(out != null)
				out.close();
		}
	}
	
	
	
	/**
	 * 
	 * @param src
	 * @param encode
	 * @return
	 * @throws UnsupportedEncodingException
	 * @throws IOException
	 */
	public static String base64ToString(String src,String encode) throws UnsupportedEncodingException, IOException{
	
		return new String(new BASE64Decoder().decodeBuffer(src),encode);
		
	}
	
	/**
	 * 
	 * @param url
	 * @param message
	 * @return
	 * @throws IOException 
	 */
	@SuppressWarnings("deprecation")
	public static String sendMessageToInternet(String url) throws IOException{
		
		InputStream in =null;
		//OutputStream out = null;
		try{
			URL urlGet = new URL(url);
			HttpURLConnection http = (HttpURLConnection) urlGet.openConnection();
			http.setRequestMethod("GET"); 
			http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
			http.setDoOutput(true);
			http.setDoInput(true);
			System.setProperty("sun.net.client.defaultConnectTimeout", "30000");// 连接超时30秒
			System.setProperty("sun.net.client.defaultReadTimeout", "30000"); // 读取超时30秒
			http.connect();
			//out = http.getOutputStream();
			//out.write(message.getBytes("UTF-8"));
			in = http.getInputStream();
			ByteOutputStream bos = new ByteOutputStream();
			byte[] b = new byte[1024];
			int l;
			while((l=in.read(b))>0){
				bos.write(b,0,l);
			}
			bos.close();
			return new String(bos.toByteArray(),"UTF-8");
		}finally{
			if(in != null)
				in.close();
		}
	}
	
	
	/**
	 * 
	 * @param in
	 * @return
	 * @throws UnsupportedEncodingException
	 * @throws IOException
	 */
    public static final String inputStream2String(InputStream in) throws UnsupportedEncodingException, IOException{
        if(in == null)
            return "";
        
        StringBuffer out = new StringBuffer();
        byte[] b = new byte[4096];
        for (int n; (n = in.read(b)) != -1;) {
            out.append(new String(b, 0, n, "UTF-8"));
        }
        return out.toString();
    }
    
    /**
     * 
     * @param token
     * @param signature
     * @param timestamp
     * @param nonce
     * @return
     * @throws NoSuchAlgorithmException 
     */
    public static final boolean checkSignature(String token,String signature,String timestamp,String nonce) throws NoSuchAlgorithmException{
        List<String> params = new ArrayList<String>();
        params.add(token);
        params.add(timestamp);
        params.add(nonce);
        Collections.sort(params,new Comparator<String>() {
            @Override
            public int compare(String o1, String o2) {
                return o1.compareTo(o2);
            }
        });
        String temp = params.get(0)+params.get(1)+params.get(2);
        return generateSHA1Code(temp).equals(signature);
    }
    
    
    /**
     * 支付回调校验签名
     * @param timestamp
     * @param noncestr
     * @param openid
     * @param issubscribe
     * @param appsignature
     * @return
     * @throws IOException 
     */
    public static boolean verifySign(long timestamp,String noncestr, String openid, int issubscribe, String appsignature) throws IOException {
        Map<String, String> paras = new HashMap<String, String>();
        paras.put("appid", BlhrConf.getInstance().getAppID());
        paras.put("appkey",BlhrConf.getInstance().getPartnerKey());
        paras.put("timestamp", String.valueOf(timestamp));
        paras.put("noncestr", noncestr);
        paras.put("openid", openid);
        paras.put("issubscribe", String.valueOf(issubscribe));
        String string1 = MessagePackage.packageMessage(paras, false);
        String paySign = DigestUtils.sha1Hex(string1);
        return paySign.equalsIgnoreCase(appsignature);
    }
    
    /**
     * @param code
     * @return
     * @throws JSONException
     * @throws IOException
     */
    public static Map<String,String> getUserInfoByWechat(String code) throws JSONException, IOException{
        
    	String response = CommonUtil.getInformationFromInternet(BlhrConf.getInstance().getAccess_token_url().replace(Constant.CODE_TAG, code));
    	logger.debug("=====获取OPENID信息为["+response+"]");
    	JSONObject acessjsonobj = new JSONObject(response);
    	logger.debug("====获取用户信息链接信息["+BlhrConf.getInstance().getPull_userinfo_url().
    			replace(Constant.ACCESS_TOKEN_TAG, acessjsonobj.getString(Constant.ACCESS_TOKEN)).replace(Constant.OPEN_ID_TAG, acessjsonobj.getString(Constant.OPENID))+"]");
    	String userInfo = CommonUtil.getInformationFromInternet(BlhrConf.getInstance().getPull_userinfo_url().
    			replace(Constant.ACCESS_TOKEN_TAG, acessjsonobj.getString(Constant.ACCESS_TOKEN)).replace(Constant.OPEN_ID_TAG, acessjsonobj.getString(Constant.OPENID)));
    	logger.debug("=========获取用户信息为["+userInfo+"]");
    	JSONObject userjsonobj = new JSONObject(userInfo);
    	Map<String,String> usermap = new HashMap<String,String>();
    	usermap.put(Constant.NICKNAME, userjsonobj.getString(Constant.NICKNAME));
    	usermap.put(Constant.OPENID, acessjsonobj.getString(Constant.OPENID));
    	usermap.put(Constant.SEX, userjsonobj.getInt(Constant.SEX)+"");
    	return usermap;
    	
    }
    

}
