package com.yoyo.blhr.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.yoyo.blhr.dao.model.FavoriteCourseVo;
import com.yoyo.blhr.dao.model.LearnRecordsVo;
import com.yoyo.blhr.dao.model.User;
import com.yoyo.blhr.service.MyClassroomService;
import com.yoyo.blhr.service.UserInfoService;
import com.yoyo.blhr.util.BlhrArgumentCache;
import com.yoyo.blhr.util.BlhrConf;
import com.yoyo.blhr.util.CommonUtil;
import com.yoyo.blhr.util.Constant;

import sun.misc.BASE64Encoder;

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
   /* @Autowired
    private MemberService  memberService;*/
    @Autowired
    private UserInfoService userInfoService;
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
	public ModelAndView initMyClassroomPageInfo(HttpServletRequest req,String code,String state,String userId) throws UnsupportedEncodingException, IOException{
		logger.debug("==========userId为:["+userId+"]========");
		logger.debug("=====微信登录获取code为["+code+"]状态值为state["+state+"] userId["+userId+"]====");
    	User user = null;
    	if(StringUtils.isBlank(userId)){
	    	if(user == null && req.getSession().getAttribute(Constant.USER_ID) != null)
	    		user = (User) req.getSession().getAttribute(Constant.USER_ID);
	    	if(user == null && userId != null && !"".equals(userId))
	    		user = userInfoService.queryUserByUserId(userId);
	    	else if(user == null){	
	    		user = accessHandler(code);
	    	}
	    	if(user == null){
	    		ModelAndView mv = new ModelAndView("/blhrf/failure");
	    		return mv;
	    	}
	    	BlhrArgumentCache.cacheDataInfo(user.getUserId(), user);
			BlhrArgumentCache.cacheDataInfo(code, user.getUserId());
			//Members member = memberService.queryUserByCondiation(user.getUserId());
			userId = user.getUserId();
    	}
		req.getSession().setAttribute(Constant.USER_ID, user);
		 Map<String,String> map = myClassroomService.initMyClassRoom(userId);
		 ModelAndView mv = new ModelAndView("/blhrf/myclassroom");
		 mv.addObject("memberInfo", map);
		 mv.addObject("userId",userId);
		return mv;
	}
	
	
    /**
     * @param code
     * @return
     * @throws JSONException
     * @throws IOException
     */
    private User accessHandler(String code) throws JSONException, IOException{
    
    	String response = CommonUtil.getInformationFromInternet(BlhrConf.getInstance().getAccess_token_url().replace(Constant.CODE_TAG, code));
    	logger.debug("=====获取OPENID信息为["+response+"]");
    	JSONObject acessjsonobj = new JSONObject(response);
    	logger.debug("====获取用户信息链接信息["+BlhrConf.getInstance().getPull_userinfo_url().
    			replace(Constant.ACCESS_TOKEN_TAG, acessjsonobj.getString(Constant.ACCESS_TOKEN)).replace(Constant.OPEN_ID_TAG, acessjsonobj.getString(Constant.OPENID))+"]");
    	String userInfo = CommonUtil.getInformationFromInternet(BlhrConf.getInstance().getPull_userinfo_url().
    			replace(Constant.ACCESS_TOKEN_TAG, acessjsonobj.getString(Constant.ACCESS_TOKEN)).replace(Constant.OPEN_ID_TAG, acessjsonobj.getString(Constant.OPENID)));
    	logger.debug("=========获取用户信息为["+userInfo+"]");
    	User userDB = userInfoService.queryUserByUserId(acessjsonobj.getString(Constant.OPENID));
    	if(userDB != null)
    		return userDB;
    	JSONObject userjsonobj = new JSONObject(userInfo);
    	User user = getUserInfo(userjsonobj,acessjsonobj);
    	userInfoService.saveUserInfo(user);
    	return user;
    }
    
    /**
     * @param userjsonobj
     * @param acessjsonobj
     * @return
     * @throws JSONException
     * @throws UnsupportedEncodingException
     */
    private User getUserInfo(JSONObject userjsonobj,JSONObject acessjsonobj) throws JSONException, UnsupportedEncodingException{
    	User user = new User();
    	user.setUserId(acessjsonobj.getString(Constant.OPENID));
		user.setWechatname(userjsonobj.getString(Constant.NICKNAME)!=null?new BASE64Encoder().encode(userjsonobj.getString(Constant.NICKNAME).getBytes("UTF-8")):"");
		user.setOpenid(acessjsonobj.getString(Constant.OPENID));
		user.setPhoto(StringUtils.isBlank(userjsonobj.getString(Constant.HEADIMGURL))?"":
			userjsonobj.getString(Constant.HEADIMGURL).substring(0, userjsonobj.getString(Constant.HEADIMGURL).length()-1)+"46");
		user.setLrrq(new Date());
		user.setYxbj("Y");
		user.setCategory("1");
		user.setSex(userjsonobj.getInt(Constant.SEX)+"");
    	return user;
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
	@ResponseBody
	@RequestMapping(value="/scCourse",produces="application/json;charset=UTF-8")
	public String scCourse(String courseId, String userId) throws IOException {
		boolean isExist = myClassroomService.queryIsMyFavCourseByUserIdAndCourseId(userId,courseId);
		if(isExist == true)
			this.myClassroomService.insertMyFavCourse(userId, courseId);
		else 
			return "2";
		return "1";
		
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
