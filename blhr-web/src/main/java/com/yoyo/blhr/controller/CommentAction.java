package com.yoyo.blhr.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yoyo.blhr.dao.model.User;
import com.yoyo.blhr.service.CommentService;
import com.yoyo.blhr.util.BlhrArgumentCache;
import com.yoyo.blhr.util.CommonUtil;
import com.yoyo.blhr.util.SequenceUtil;

@Controller
public class CommentAction {
	
	
	@Autowired
	private CommentService commentService;
	

	
	@RequestMapping("/openComment")
	public ModelAndView openComment(String userId,String courseId) throws IOException{
		
		ModelAndView mv = new ModelAndView("/blhrf/comment");
		List<Map<String,Object>> lismap = commentService.queryCommentsByCourseId(courseId);
		for(Map<String,Object> map : lismap)
			map.put("wechatname", CommonUtil.base64ToString((String)map.get("wechatname"),"UTF-8"));
		mv.addObject("comments", lismap);
		mv.addObject("userId",userId);
		mv.addObject("wechatname",CommonUtil.base64ToString(((User)BlhrArgumentCache.getCacheData(userId)).getWechatname(),"UTF-8"));
		mv.addObject("courseId",courseId);
		return mv;
	}
	
	
	
	/**
	 * @description 保存评论信息 ...
	 * @param userId
	 * @param courseId
	 * @param comment
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/saveCommentToDB",produces = "text/html;charset=UTF-8", method=RequestMethod.POST)
	public String saveCommentToDB(String userId,String courseId,String comment){
		this.commentService.saveComments(SequenceUtil.generateSequeueString(), comment, courseId, 
				userId, new Date(), "Y");
		
		return "1";
	}
	
	
	
	
	

}
