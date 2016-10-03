package ch;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.NoSuchAlgorithmException;

import com.sun.xml.internal.messaging.saaj.util.ByteOutputStream;

public class T {
	
	
	public static void main(String[] args) throws UnsupportedEncodingException, IOException, NoSuchAlgorithmException {
		
	//	System.out.println(new String(new BASE64Decoder().decodeBuffer("56ug6LeD5bmzQE1WUDAx"),"UTF-8"));
	//	System.out.println(SequenceUtil.generateMd5EncryptString("zhangsan"));
		
		//System.out.println(SequenceUtil.generateMd5EncryptString("zhangsan"));
		
		//System.out.println("http:\\/\\/wx.qlogo.cn\\/mmopen\\/vDwntJFbiafsico1Hv1Gvp3MYyibWznthv7flTvNB4ERoGERLGibicNC5yhtQuC09uuFVh6eptUrQnhmZmTkRCoa19A\\/0".replace("\\/0", "\\/46"));
	
		String json = "{\"action_name\": \"QR_LIMIT_SCENE\", \"action_info\": {\"scene\": {\"scene_str\": \"afdfefaf\"}}}";
		String content = getInformationFromInternet("https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=yPqhEBpriCW58ho0qjjfc7GgrQp-iuyX0R1EP5jZmCjkJalWejlI19O2eF4urJs1P478UuP-ugXrtTcv1XjUJVvIcLgqs2zK4YkvID4SC5KR236RPvdrv9zi1DZvDPISUJUbADABQB",json);
		System.out.println(content);
	}
	
	
	public static String getInformationFromInternet(String URL,String json) throws IOException{
		URL urlGet = new URL(URL);
		HttpURLConnection http = (HttpURLConnection) urlGet.openConnection();
		http.setRequestMethod("POST"); 
		http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
		http.setDoOutput(true);
		http.setDoInput(true);
		System.setProperty("sun.net.client.defaultConnectTimeout", "30000");
		System.setProperty("sun.net.client.defaultReadTimeout", "30000");
		http.getOutputStream().write(json.getBytes());
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


}
