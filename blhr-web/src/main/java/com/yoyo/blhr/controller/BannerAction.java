package com.yoyo.blhr.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.yoyo.blhr.service.BannerService;

@Controller
public class BannerAction {
	
	@Autowired
	private BannerService bannerService;
	
	
	@RequestMapping("/initBannerPage")
	public ModelAndView initBannerPage(){
		
		ModelAndView mv = new ModelAndView("/blhrb/banner");
		List<Map<String,Object>> lismap = bannerService.queryBannerInfo();
		for(Map<String,Object> map:lismap){
			if(1 == (Integer)map.get("pic_sort")){
				mv.addObject("pic_link1", map.get("pic_link"));
				mv.addObject("pic_address1", map.get("pic_address"));
			}else if(2 == (Integer)map.get("pic_sort")){
				mv.addObject("pic_link2", map.get("pic_link"));
				mv.addObject("pic_address2", map.get("pic_address"));
			}else if(3 == (Integer)map.get("pic_sort")){
				mv.addObject("pic_link3", map.get("pic_link"));
				mv.addObject("pic_address3", map.get("pic_address"));
			}
		}
		return mv;
		
	}

}
