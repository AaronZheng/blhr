package com.yoyo.blhr.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yoyo.blhr.dao.model.FavoriteCourseVo;
import com.yoyo.blhr.dao.model.LearnRecordsVo;
import com.yoyo.blhr.service.MyClassroomService;

/**
 * 
 * @author zcl
 *
 */
@Controller
public class MyClassroomAction {
	
	@Autowired
	private MyClassroomService myClassroomService;
	private Logger logger = Logger.getLogger(this.getClass());

	static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	static SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	
	
	/**
	 * 
	 * @param userId
	 * @return
	 * @throws IOException 
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/initMyClassInfo",method = RequestMethod.GET)
	public ModelAndView initMyClassroomPageInfo(String userId) throws UnsupportedEncodingException, IOException{
		logger.debug("==========userId为:["+userId+"]========");
		 Map<String,String> map = myClassroomService.initMyClassRoom(userId);
		 ModelAndView mv = new ModelAndView("/blhrf/myclassroom");
		 mv.addObject("memberInfo", map);
		 mv.addObject("userId",userId);
		return mv;
	}
	
	
	/**
	 * @param userId
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/queryFavoriteCourse")
	public ModelAndView queryMyFavoriteCourseInfoByUserId(String userId)
			throws IOException {
		//userId="oA4ZPwOtm1nGXf8LveH2PaidrAcg";//别忘了去掉
		List<FavoriteCourseVo> favCourses = myClassroomService.queryUserFavoriteCourseById(userId);
		ModelAndView mv = new ModelAndView("/blhrf/ke_sckc");
		List<Map<String, Object>> retlist = new ArrayList<Map<String,Object>>();
		for(FavoriteCourseVo vo : favCourses){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("courseName", vo.getCourseName());
			map.put("teacherName", vo.getTeacherName());
			map.put("photo",vo.getPhoto());
			retlist.add(map);
		}
		mv.addObject("favCourses", retlist);
		mv.addObject("userId", userId);
		return mv;
	}

	/**
	 * @description query learn records information ...
	 * 
	 * @param userId
	 * 
	 * @return
	 */
	@RequestMapping("/queryLearnedCourse")
	public ModelAndView queryLearnedCourse(String userId) {
		//userId="oA4ZPwOtm1nGXf8LveH2PaidrAcg";//别忘了去掉
		List<LearnRecordsVo> courses = myClassroomService
				.queryLearnedCourseByUserId(userId);
		ModelAndView mv = new ModelAndView("/blhrf/ke_tgkc");
		List<Map<String, Object>> retlist = new ArrayList<Map<String,Object>>();
		for(LearnRecordsVo vo : courses){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("courseName", vo.getCourseName());
			map.put("teacherName", vo.getTeacherName());
			map.put("learnTime", sdf.format(vo.getLearnTime()));
			map.put("photo",vo.getPhoto());
			retlist.add(map);
		}
		
		mv.addObject("cloursesInfo", retlist);
		mv.addObject("userId", userId);
		return mv;
	}
	
	

	/**
	 * 讲师查询自己录过的课程
	 * @param userId
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/searchMyCourses")
	public ModelAndView searchMyCourses(String userId)
			throws IOException {
		//userId="oA4ZPwOtm1nGXf8LveH2PaidrAcg";//别忘了去掉
		List<Map<String, Object>> myCourses = this.myClassroomService.searchMyCourses(userId);
		ModelAndView mv = new ModelAndView("/blhrf/ke_myke");
		List<Map<String, Object>> wfbCourses = new ArrayList<Map<String,Object>>();//未发布
		List<Map<String, Object>> yfbCourses = new ArrayList<Map<String,Object>>();//已发布
		for(Map<String, Object> map : myCourses){
			map.put("lrrq", sdf2.format(map.get("lrrq")));
			if(!"8".equals(map.get("courseState"))&&!"3".equals(map.get("courseState"))){
				wfbCourses.add(map);
			}else if("8".equals(map.get("courseState"))||"3".equals(map.get("courseState"))){
				yfbCourses.add(map);
			}
		}
		mv.addObject("wfbCourses", wfbCourses);
		mv.addObject("yfbCourses", yfbCourses);
		mv.addObject("userId", userId);
		return mv;
	}
	
	
	
	/**
	 * 收藏课程
	 * @param userId
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/scCourse")
	public ModelAndView scCourse(String courseId, String userId) throws IOException {
		
		ModelAndView mv = new ModelAndView();
		this.myClassroomService.insertMyFavCourse(userId, courseId);
		mv.addObject("userId", userId);
		return mv;
		
	}

	/**
	 * 课程介绍
	 * @param courseId
	 * @return
	 */
	@RequestMapping("/playback")
	public ModelAndView playBackCourse(String courseId, String userId) {
		//courseId = "09f3d8b121ca43678e287c125d8280dc";
		ModelAndView mv = new ModelAndView("/blhrf/playback");
		//讲师简介
		Map<String, Object> teacherProfile = this.myClassroomService.queryTeacherProfileByCourseId(courseId);
		//课程简介
		Map<String, Object> courseProfile = this.myClassroomService.queryCourseProfileByCourseId(courseId);
		//讲师所有课程
		List<Map<String, Object>> allCourses = this.myClassroomService.queryAllCoursesByTeacherId(teacherProfile.get("userId").toString());
		mv.addObject("teacherProfile", teacherProfile);
		mv.addObject("courseProfile", courseProfile);
		mv.addObject("allCourses", allCourses);
		mv.addObject("userId", userId);
		return mv;
	}
	
	

}
