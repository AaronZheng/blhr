package com.yoyo.blhr.util;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

import org.apache.log4j.Logger;
import org.json.JSONObject;

/**
 * 
 * 
 * @author zcl
 *
 */
public class InitializationToken {
	
	
	private Logger logger = Logger.getLogger(this.getClass());
	

	public InitializationToken() {
		
		initCommonAcessToken();
	}
	
	/**
	 * @description initialization common access token information  ...
	 * 
	 * @author zcl
	 */
	private void initCommonAcessToken(){
		
		new Timer().schedule(new TimerTask() {
			@Override
			public void run() {
				try {
					JSONObject jsonObj = new JSONObject(CommonUtil.getInformationFromInternet(BlhrConf.getInstance().getCommon_access_token_url()));
			        BlhrArgumentCache.cacheDataInfo(ResourceEnumType.common_access_token.getValue(), jsonObj.getString(Constant.ACCESS_TOKEN));
			        logger.info("==================定时任务刷入token信息为["+BlhrArgumentCache.getCacheData(ResourceEnumType.common_access_token.getValue())+"]");
				    JSONObject jsapiTicket = new JSONObject(CommonUtil.getInformationFromInternet(BlhrConf.getInstance().getJsapi_ticket().replace(Constant.ACCESS_TOKEN_TAG, jsonObj.getString(Constant.ACCESS_TOKEN))));
			        BlhrArgumentCache.cacheDataInfo(ResourceEnumType.jsapi_ticket.getValue(), jsapiTicket.getString(Constant.TICKET));
			        BlhrArgumentCache.cacheDataInfo(ResourceEnumType.share_signature_package.getValue(), generateStr(jsapiTicket.getString(Constant.TICKET)));
			        BlhrArgumentCache.cacheDataInfo(ResourceEnumType.chat_signature_package.getValue(), generateChatSgin(jsapiTicket.getString(Constant.TICKET)));
			        BlhrArgumentCache.cacheDataInfo(ResourceEnumType.pay_signature_package.getValue(), boliPayInfo(jsapiTicket.getString(Constant.TICKET)));
				} catch (Exception e) {
					e.printStackTrace();
					System.exit(0);
				}
			}
			
			/**
			 * @description split joint generate string ...
			 * @param ticket
			 * @return
			 * @throws IOException
			 * @throws NoSuchAlgorithmException 
			 */
			private Map<String,String> generateStr(String ticket) throws IOException, NoSuchAlgorithmException{
				Map<String,String> signPackage = new HashMap<String,String>();
				signPackage.put(Constant.TICKET, ticket);
				signPackage.put(Constant.NONCESTR, SequenceUtil.generateSequeueString());
				signPackage.put(Constant.TIMESTAMP, new Date().getTime()/1000+"");
				StringBuffer sb = new StringBuffer();
				sb.append(Constant.JSAPI_TICKET).append(Constant.EQ_TAG).append(ticket).append(Constant.AND).append(Constant.NONCESTR).append(Constant.EQ_TAG)
				.append(signPackage.get(Constant.NONCESTR)).append(Constant.AND).append(Constant.TIMESTAMP).append(Constant.EQ_TAG)
				.append(signPackage.get(Constant.TIMESTAMP)).append(Constant.AND).append(Constant.URL).append(Constant.EQ_TAG).append(BlhrConf.getInstance().getShare_url());
				signPackage.put(Constant.SIGNATURE, CommonUtil.generateSHA1Code(sb.toString()));
				return signPackage;
			}
			
			
			/**
			 * 
			 * @param ticket
			 * @return
			 * @throws IOException
			 * @throws NoSuchAlgorithmException
			 */
			private Map<String,String> generateChatSgin(String ticket) throws IOException, NoSuchAlgorithmException{
				Map<String,String> signPackage = new HashMap<String,String>();
				signPackage.put(Constant.TICKET, ticket);
				signPackage.put(Constant.NONCESTR, SequenceUtil.generateSequeueString());
				signPackage.put(Constant.TIMESTAMP, new Date().getTime()/1000+"");
				StringBuffer sb = new StringBuffer();
				sb.append(Constant.JSAPI_TICKET).append(Constant.EQ_TAG).append(ticket).append(Constant.AND).append(Constant.NONCESTR).append(Constant.EQ_TAG)
				.append(signPackage.get(Constant.NONCESTR)).append(Constant.AND).append(Constant.TIMESTAMP).append(Constant.EQ_TAG)
				.append(signPackage.get(Constant.TIMESTAMP)).append(Constant.AND).append(Constant.URL).append(Constant.EQ_TAG).append(BlhrConf.getInstance().getChat_url());
				signPackage.put(Constant.SIGNATURE, CommonUtil.generateSHA1Code(sb.toString()));
				return signPackage;
			}
			
			
			/**
			 * @description construct boli pay sign information ...
			 * @param ticket
			 * @return
			 * @throws IOException
			 * @throws NoSuchAlgorithmException
			 */
			public Map<String,String> boliPayInfo(String ticket) throws IOException, NoSuchAlgorithmException{
				
				Map<String,String> signPackage = new HashMap<String,String>();
				signPackage.put(Constant.TICKET, ticket);
				signPackage.put(Constant.NONCESTR, SequenceUtil.generateSequeueString());
				signPackage.put(Constant.TIMESTAMP, System.currentTimeMillis()/1000+"");
				StringBuffer sb = new StringBuffer();
				sb.append(Constant.JSAPI_TICKET).append(Constant.EQ_TAG).append(ticket).append(Constant.AND).append(Constant.NONCESTR).append(Constant.EQ_TAG)
				.append(signPackage.get(Constant.NONCESTR)).append(Constant.AND).append(Constant.TIMESTAMP).append(Constant.EQ_TAG)
				.append(signPackage.get(Constant.TIMESTAMP)).append(Constant.AND).append(Constant.URL).append(Constant.EQ_TAG).append(BlhrConf.getInstance().getInit_pay_url());
				signPackage.put(Constant.SIGNATURE, CommonUtil.generateSHA1Code(sb.toString()));
				return signPackage;
			
			}
			
		}, 0, 5400000);
		
	}
	
	
	
	

}
