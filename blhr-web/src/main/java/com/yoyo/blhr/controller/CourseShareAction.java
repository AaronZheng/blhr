package com.yoyo.blhr.controller;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yoyo.blhr.util.BlhrArgumentCache;
import com.yoyo.blhr.util.BlhrConf;
import com.yoyo.blhr.util.ResourceEnumType;

/**
 * @description share course to QQ, wechat and other platform ...
 * @Time 
 * @author zcl
 */
@Controller
public class CourseShareAction {
	
	
	/**
	 * @description initialization course share page ...
	 * 
	 * @param courseId
	 * 
	 * @return
	 * 
	 * @throws IOException
	 */
	@RequestMapping("/initsharePage")
	public ModelAndView initSharePage(String courseId) throws IOException{
		ModelAndView mv = new ModelAndView("/blhrf/share");
		mv.addObject("appId", BlhrConf.getInstance().getAppID());
		mv.addObject(ResourceEnumType.share_signature_package.getValue(), BlhrArgumentCache.getCacheData(ResourceEnumType.share_signature_package.getValue()));
        System.out.println(BlhrConf.getInstance().getShare_url());
		System.out.println(BlhrArgumentCache.getCacheData(ResourceEnumType.share_signature_package.getValue()).toString());
		return mv;
	}
	

}
