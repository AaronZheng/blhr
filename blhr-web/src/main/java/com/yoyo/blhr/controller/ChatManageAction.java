package com.yoyo.blhr.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yoyo.blhr.dao.impl.CoursesDao;
import com.yoyo.blhr.dao.model.CourseDetail;
import com.yoyo.blhr.util.BlhrArgumentCache;
import com.yoyo.blhr.util.BlhrConf;
import com.yoyo.blhr.util.CommonUtil;
import com.yoyo.blhr.util.ResourceEnumType;
import com.yoyo.blhr.util.SequenceUtil;

@Controller
public class ChatManageAction {
	
	//@Value("${basePath}")
	private String basePath="/root/blhr/apache-tomcat-7.0.70/webapps/blhr-web/upload";
	@Autowired
	private CoursesDao coursesDao;
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	/**
	 * 
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/initChatPage")
	public ModelAndView initChatPage() throws IOException{

		ModelAndView mv = new ModelAndView("/blhrf/phototest");
		mv.addObject("appId", BlhrConf.getInstance().getAppID());
		mv.addObject(ResourceEnumType.chat_signature_package.getValue(), BlhrArgumentCache.getCacheData(ResourceEnumType.chat_signature_package.getValue()));
        System.out.println(BlhrConf.getInstance().getShare_url());
		System.out.println(BlhrArgumentCache.getCacheData(ResourceEnumType.chat_signature_package.getValue()).toString());
		return mv;
	}
	
	
	/**
	 * 
	 * @param contentId
	 * @return
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping("/uploadChatContent")
	public String uploadChatContent(String courseId,String content,String type) throws IOException{
		
		logger.debug("=====上传同步接入参数courseId["+courseId+"] content["+content+"] type ["+type+"]");
		String fix = null;
		if("p".equals(type)){
			fix = new SimpleDateFormat("yyyyMMdd").format(new Date())+File.separator+SequenceUtil.generateSequeueString()+".jpg";
			String token = (String) BlhrArgumentCache.getCacheData(ResourceEnumType.common_access_token.getValue());
			CommonUtil.StoreInformationFromInternet("https://api.weixin.qq.com/cgi-bin/media/get?access_token="+token+"&media_id="+content+"",basePath+File.separator+fix);
			//String url = CommonUtil.sendMessageToInternet("https://api.weixin.qq.com/cgi-bin/media/get?access_token="+token+"&media_id="+content+"");
			//logger.debug("=================图片请求返回["+url+"]================");
			content = File.separator+"upload"+File.separator+fix;
		}else if("v".equals(type)){
			String title =  new SimpleDateFormat("yyyyMMdd").format(new Date())+File.separator+SequenceUtil.generateSequeueString();
			fix = title +".amr";
			String nfix = title+".mp3";
			String token = (String) BlhrArgumentCache.getCacheData(ResourceEnumType.common_access_token.getValue());
			CommonUtil.StoreInformationFromInternet("https://api.weixin.qq.com/cgi-bin/media/get?access_token="+token+"&media_id="+content+"",basePath+File.separator+fix);
			String url = CommonUtil.sendMessageToInternet("https://api.weixin.qq.com/cgi-bin/media/get?access_token="+token+"&media_id="+content+"");
			logger.debug("=================语音请求返回["+url+"]================");
			Runtime.getRuntime().exec("ffmpeg -i "+(basePath+File.separator+fix)+" "+(basePath+File.separator+nfix));
			content = File.separator+"upload"+File.separator+nfix;
		}else if("t".equals(type)){
		}else
			return "2";
		CourseDetail cd = generateCourseDetail(courseId,content,type);
		coursesDao.saveCourseDetail(cd);
		return cd.getCourseDetailId();
	}
	
	/**
	 * 
	 * @param chatContent
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/sendTextContent",produces = "text/html;charset=UTF-8", method=RequestMethod.POST)
	public String sendTextContent(String courseId,String type,String chatContent){
		CourseDetail cd = generateCourseDetail(courseId,chatContent,type);
		coursesDao.saveCourseDetail(cd);
		return cd.getCourseDetailId();
	}
	
	/**
	 * 
	 * @param courseId
	 * @param type
	 * @param chatContent
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/sendTextContentf",produces = "text/html;charset=UTF-8", method=RequestMethod.POST)
	public String sendTextContentf(String courseId,String type,String chatContent){
		CourseDetail cd = generateCourseDetail(courseId,chatContent,type);
		coursesDao.saveCourseDetail(cd);
		return cd.getCourseDetailId();
	}
	
	
	
	/**
	 * 
	 * @param courseId
	 * @param content
	 * @param type
	 * @return
	 */
	private CourseDetail generateCourseDetail(String courseId,String content,String type){
		
		CourseDetail courseDetail = new CourseDetail();
		courseDetail.setCourseDetailId(SequenceUtil.generateSequeueString());
		courseDetail.setContentType(type);
		courseDetail.setContentItem(content);
		courseDetail.setCourseId(courseId);
		courseDetail.setLrrq(new Date());
		courseDetail.setYxbj("Y");
		return courseDetail;
	}
	

}
