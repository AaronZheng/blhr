package com.yoyo.blhr.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.sun.xml.internal.messaging.saaj.util.ByteOutputStream;
import com.yoyo.blhr.dao.model.Courses;
import com.yoyo.blhr.dao.model.LearnRecords;
import com.yoyo.blhr.dao.model.Members;
import com.yoyo.blhr.dao.model.User;
import com.yoyo.blhr.service.CourseManageService;
import com.yoyo.blhr.service.MemberService;
import com.yoyo.blhr.service.MyClassroomService;
import com.yoyo.blhr.service.UserManageService;
import com.yoyo.blhr.util.BlhrArgumentCache;
import com.yoyo.blhr.util.BlhrConf;
import com.yoyo.blhr.util.CommonUtil;
import com.yoyo.blhr.util.Constant;
import com.yoyo.blhr.util.EasyUiDataHandlerUtil;
import com.yoyo.blhr.util.ResourceEnumType;
import com.yoyo.blhr.util.SequenceUtil;

/**
 * 
 * @author zcl
 *
 */
@Controller
public class CourseManageAction {
	
	@Autowired
	private CourseManageService courseManageService;
	
	private final static String EDIT_REPORT = "发布预告";
	
	private final static String DELETE = "删除";
	
	//private final static String REVIEW = "审核预告";
	
	private final static String COURSE_DETAIL = "课程详情";
	
	private final static String PUSH_NOTICE = "推送通知";
	
	private final static String COURSE_REVIEW = "课程审核";
	
	private final static String BROADCAST_REVIEW = "直播审核";
	
	private final static String FUNCTION_EDIT_REPORT = "editReport";
	
	private final static String FUNCTION_DELETE = "deleteCourse";
	
	//private final static String FUNCTION_REVIEW_REPORT = "reviewReport";
	
	private final static String FUNCTION_REVIEW_COURSE = "reviewCourse";
	
	private final static String FUNCTION_REVIEW_BROADCAST = "reviewBroadcast";
	
	private final static String FUNCTION_OPEN_COURSE_DETIAL = "openCourseDetail";
	
	private final static String FUNCTION_PUSH_NOTICE = "pushNotice";
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private UserManageService userManageService;
	@Autowired
	private MyClassroomService myClassroomService;
	@Autowired
	private MemberService memberService;

	
	
	/**
	 * @description query all course information ...
	 * @param startPage
	 * @param pageSize
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/queryCourseInfo" ,produces="application/json;charset=UTF-8")
	public String queryCourseInfo(String page,String rows){
		List<Map<String,Object>> lismap = courseManageService.queryAllCourseInfo((Integer.parseInt(page)-1)*10, Integer.parseInt(rows));
		int total = courseManageService.queryAllCourseNum();
		return EasyUiDataHandlerUtil.ConvertListMapToUiGrid2(lismap, total);
	}
	
	
	/**
	 * @description 查询直播课程
	 * 
	 * @param
	 */
	@ResponseBody
	@RequestMapping(value="/queryBroadcastCourseb",produces="application/json;charset=UTF-8")
	public String queryBroadcastCourse(String page,String rows){
		
		List<Map<String,Object>> lismap = this.courseManageService.queryBroadcastCourse((Integer.parseInt(page)-1)*10, Integer.parseInt(rows),"2");
		handlerResult(lismap);
		int total = courseManageService.queryBroadcastCourseNum();
		return EasyUiDataHandlerUtil.ConvertListMapToUiGrid2(lismap,total);
	}
	
	/**
	 * @description 创建直播...
	 * @param courseName
	 * @param profile
	 * @param teacherId
	 * @param playTime
	 * @param courseType
	 * @param payType
	 * @param personLimit
	 * @param courseState
	 * @param category
	 * @return
	 * @throws ParseException
	 */
	@ResponseBody
	@RequestMapping(value="/createBroadcastReport",produces="application/json;charset=UTF-8")
	public String createBroadcastReport(String courseName,String profile,String teacherId,String playTime,
			String courseType,String payType,String personLimit,String courseState,String category, String weight) throws ParseException{
		int weight_ = Integer.parseInt(weight);
		Courses course = new Courses();
		course.setCourseId(SequenceUtil.generateSequeueString());
		course.setTeacherId(teacherId);
		course.setUserId(teacherId);
		course.setCourseProfile(profile);
		course.setCourseName(courseName);
		//course.setPersonLimit(Integer.parseInt(personLimit));
		course.setCreatePerson("");
		//course.setPlayTime(new Date());
		course.setCourseType(courseType);
		course.setPayType(payType);
		course.setCategory("1");
		course.setYxbj("Y");
		course.setCreateTime(new Date());
		course.setLrrq(new Date());
		course.setCourseType(courseType);
		course.setAvailable("1");
		course.setCategory(category);
		course.setCourseState(courseState);
		course.setWeight(weight_);
		this.courseManageService.saveCourseTitle(course);
		return "1";
	}
	
	
	/**
	 * 
	 * @param itemId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/deleteCourseDetailItem",produces="application/json;charset=UTF-8")
	public String deleteCourseDetailItem(String itemId){
	Map<String,Object> map = this.courseManageService.queryDetailByItemId(itemId);
/*		if(map.get(key))	*/	
			this.courseManageService.deleteCourseDetailByItemId(itemId);
		return "1";
	}
	
	
	/**
	 * 
	 * @param itemId
	 * @param textContent
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/updateCourseItem",produces="application/json;charset=UTF-8")
	public String updateCourseItem(String itemId,String textContent){
		List<Map<String,String>> lismap = new ArrayList<Map<String,String>>();
		Map<String,String> map = new HashMap<String,String>();
		map.put("course_detail_id", itemId);
		map.put("content_item", textContent);
		lismap.add(map);
		this.courseManageService.updateCourseDetailByBath(lismap);
		return "1";
	}
	
	
	/**
	 * @description hide course information ... 
	 * @param page
	 * @param rows
	 * @param course_id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/hideCourse" ,produces="application/json;charset=UTF-8")
	public String hideCourse(String page,String rows,String course_id){
		
		courseManageService.updateCourseState(course_id);
		
		return EasyUiDataHandlerUtil.ConvertListMapToUiGrid(courseManageService.queryAllCourseInfo((Integer.parseInt(page)-1)*10, Integer.parseInt(rows)));
	}
	
	
	/**
	 * @description query course detail information by course_id ..
	 * @param page
	 * @param rows
	 * @param course_id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/queryCourseDetailInfo" ,produces="application/json;charset=UTF-8")
	public String queryCourseDetailInfo(String page,String rows,String course_id){
		
		return EasyUiDataHandlerUtil.ConvertListMapToUiGrid(courseManageService.queryCourseDetailInfo((Integer.parseInt(page)-1)*10,Integer.parseInt(rows),course_id));
	}
	
	
	/**
	 * @description update course detail information ... 
	 * @param page
	 * @param rows
	 * @param course_detail
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="saveupdateCourseDetail" ,produces="application/json;charset=UTF-8")
	public String saveupdateCourseDetail(String page,String rows,String course_detail){
		
		JSONArray arrayJson = (JSONArray) new JSONObject(course_detail).get("updateData");
		List<Map<String,String>> lismap = new ArrayList<Map<String,String>>();
		String course_id = null;
		for(int i = 0;i<arrayJson.length();i++){
			Map<String,String> map = new HashMap<String,String>();
			map.put("course_detail_id", arrayJson.getJSONObject(i).getString("course_detail_id"));
			map.put("content_item", arrayJson.getJSONObject(i).getString("content_item"));
			if(course_id == null)                                 
				course_id = arrayJson.getJSONObject(i).getString("course_id");
			lismap.add(map);
		}
		courseManageService.updateCourseDetailByBath(lismap);
		return EasyUiDataHandlerUtil.ConvertListMapToUiGrid(courseManageService.queryCourseDetailInfo((Integer.parseInt(page)-1)*10,Integer.parseInt(rows),course_id));
	}
	
	
	
	/**
	 * 
	 * @param page
	 * @param rows
	 * @param course_id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="deleteCourseByCourseId" ,produces="application/json;charset=UTF-8")
	public String deleteCourseByCourseId(String page,String rows,String course_id){
		courseManageService.deleteCourseDetailByCourseId(course_id);
		courseManageService.deleteCourseById(course_id);
		int total = courseManageService.queryAllCourseNum();
		return EasyUiDataHandlerUtil.ConvertListMapToUiGrid2(courseManageService.queryAllCourseInfo((Integer.parseInt(page)-1)*10,Integer.parseInt(rows)), total);
	}
	
	@ResponseBody
	@RequestMapping(value="deleteCourseByCourseIdb" ,produces="application/json;charset=UTF-8")
	public String deleteCourseByCourseIdb(String page,String rows,String course_id){
		courseManageService.deleteCourseDetailByCourseId(course_id);
		courseManageService.deleteCourseById(course_id);;
		List<Map<String,Object>> lismap = this.courseManageService.queryBroadcastCourse((Integer.parseInt(page)-1)*10,Integer.parseInt(rows),"2");
		handlerResult(lismap);
		int total = courseManageService.queryBroadcastCourseNum();
		return EasyUiDataHandlerUtil.ConvertListMapToUiGrid2(lismap, total);
	}
	
	
	@ResponseBody
	@RequestMapping(value="updateCourseState" ,produces="application/json;charset=UTF-8")
	public String updateCourseState(String page,String rows,String course_id){

		courseManageService.updateCourseToEnd(course_id, "4");
		List<Map<String,Object>> lismap = this.courseManageService.queryBroadcastCourse((Integer.parseInt(page)-1)*10,Integer.parseInt(rows),"2");
		handlerResult(lismap);
		int total = courseManageService.queryBroadcastCourseNum();
		return EasyUiDataHandlerUtil.ConvertListMapToUiGrid2(lismap, total);
	
	}
	
	
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping("/queryBroadCastCourse")
	public ModelAndView queryBroadCastCourse(String userId){
		ModelAndView mv = new ModelAndView("/blhrf/zb_zbkc");
		List<Map<String,Object>> courses = this.courseManageService.queryBroadCastCourseByType();
		mv.addObject("userId", userId);
		mv.addObject("courseTitleList", courses);
		return mv;
	}
	
	
	@RequestMapping("/queryBroadCastCourseByType")
	public ModelAndView queryBroadCastCourseByType(String userId){
		ModelAndView mv = new ModelAndView("/blhrf/zb_zbkc");
		List<Map<String,Object>> courses = this.courseManageService.queryBroadCastCourseByType();
		mv.addObject("userId", userId);
		mv.addObject("courseTitleList", courses);
		return mv;
	}
	
	
	/**
	 * 
	 * @param userId
	 * @param courseState
	 * @return
	 */
	@RequestMapping("/openBackBroadcast")
	public ModelAndView openBackBroadcast(String userId,String courseId){
		ModelAndView mv = new ModelAndView("/blhrb/inputWatch");
		Map<String,Object> map = courseManageService.queryCourseById(courseId);
		List<Map<String,Object>> detailMap = courseManageService.queryCourseDetailById(courseId);
		User user = userManageService.queryUserById((String)map.get("user_id"));
		/*for(Map<String,Object> dmp:detailMap){
			dmp.put("item_length", ((Integer)dmp.get("item_length"))+55);
		}*/
		mv.addObject("courseName", map.get("course_name"));
		mv.addObject("courseId", map.get("course_id"));
		mv.addObject("userId", map.get("userId"));
		mv.addObject("photo", user.getPhoto() == null ?"":user.getPhoto());
		mv.addObject("userType", user.getCategory());
		mv.addObject("courseItem", detailMap);
		return mv;
	}
	
	/**
	 * 
	 * @param userId
	 * @param courseState
	 * @return
	 */
	@RequestMapping("/reviewCourse")
	public ModelAndView reviewCourse(String userId,String courseId){
		ModelAndView mv = new ModelAndView("/blhrb/reviewInputWatch");
		Map<String,Object> map = courseManageService.queryCourseById(courseId);
		User user = userManageService.queryUserById((String)map.get("user_id"));
		List<Map<String,Object>> detailMap = courseManageService.queryCourseDetailById(courseId);
		mv.addObject("courseName", map.get("course_name"));
		mv.addObject("courseId", map.get("course_id"));
		mv.addObject("userId", map.get("user_id"));
		mv.addObject("photo", user.getPhoto());
		mv.addObject("userType", user.getCategory());
		mv.addObject("courseItem", detailMap);
		return mv;
	}

	
	
	/**
	 * 
	 * @param maps
	 */
	private void handlerResult(List<Map<String,Object>> maps){
		for(Map<String,Object> map:maps){
			StringBuffer sb = new StringBuffer();
			if("1".equals(map.get("course_state"))){
				map.put("course_state", "直播未发布预告");
				sb.append(generateHref(EDIT_REPORT,FUNCTION_EDIT_REPORT,map.get("course_id"))).
				append(generateHref(DELETE,FUNCTION_DELETE,map.get("course_id"))).
				append(generateHref(COURSE_DETAIL,FUNCTION_OPEN_COURSE_DETIAL,map.get("course_id")));
			}else if("2".equals(map.get("course_state"))){
				map.put("course_state", "正在直播");
				sb.append(generateHref(BROADCAST_REVIEW,FUNCTION_REVIEW_BROADCAST,map.get("course_id"))).
				append(generateHref(COURSE_DETAIL,FUNCTION_OPEN_COURSE_DETIAL,map.get("course_id")));
			}else if("3".equals(map.get("course_state"))){
				map.put("course_state", "已结束已通过审核");
				sb.append(generateHref(COURSE_REVIEW,FUNCTION_REVIEW_COURSE,map.get("course_id")));
				sb.append(generateHref(COURSE_DETAIL,FUNCTION_OPEN_COURSE_DETIAL,map.get("course_id")));
			}else if("4".equals(map.get("course_state"))){
				map.put("course_state", "已发布预告未推送");
				sb.append(generateHref(PUSH_NOTICE,FUNCTION_PUSH_NOTICE,map.get("course_id"))).
				append(generateHref(COURSE_DETAIL,FUNCTION_OPEN_COURSE_DETIAL,map.get("course_id")));
			}else if("5".equals(map.get("course_state"))){
				map.put("course_state", "已发布预告已推送");
				sb.append(generateHref(PUSH_NOTICE,FUNCTION_PUSH_NOTICE,map.get("course_id"))).
				append(generateHref(COURSE_DETAIL,FUNCTION_OPEN_COURSE_DETIAL,map.get("course_id")));
			}else if("6".equals(map.get("course_state"))){
				map.put("course_state", "直播结束未审核");
				sb.append(generateHref(COURSE_REVIEW,FUNCTION_REVIEW_COURSE,map.get("course_id")));
				sb.append(generateHref(COURSE_DETAIL,FUNCTION_OPEN_COURSE_DETIAL,map.get("course_id")));
			}
			map.put("handler", sb.toString());
		}
	}
	
	
	/**
	 * 
	 * @param caption
	 * @param function
	 * @param url
	 * @return
	 */
	private String generateHref(String caption,String function,Object url){
		
		return "&nbsp;&nbsp;<a style=\"curosr:pointer\" onclick=\""+function+"('"+url+"')\">"+caption+"</a>";
	}
	
	
	
	/**
	 * @param courseName
	 * @param courseIntro
	 * @param userId
	 * @return
	 * @throws IOException
	 * @throws ParseException 
	 */
	@ResponseBody
	@RequestMapping(value="/saveCourseTitle",produces="application/json;charset=UTF-8", method=RequestMethod.POST)
	public ModelAndView saveCourseTitle(String courseName,String courseIntro,String courseType,
			String playTime,String playLimit,String userId,String category,String courseId) throws IOException, ParseException{
		
		Courses course = null;
		boolean isNew = false;
		ModelAndView mv ;
		if(StringUtils.isBlank(courseId)){
			//TODO 已完成  ....
			isNew = true;
			course = new Courses();
			course.setCourseId(SequenceUtil.generateSequeueString());
			course.setCourseName(courseName);
			course.setCourseProfile(courseIntro);
			course.setTeacherId(userId);
			course.setCategory(category);
			if("1".equals(course)){
				course.setCourseState("7");
			}else
				course.setCourseState("2");
			course.setUserId(userId);
			course.setLrrq(new Date());
			course.setCreateTime(new Date());
			course.setCourseType(courseType);
			course.setCreatePerson(((User)BlhrArgumentCache.getCacheData(userId)).getUsername());
			if(playTime != null)
				course.setPlayTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(playTime));
			if(playLimit != null)
				course.setPersonLimit(Integer.parseInt(playLimit));
			else
				course.setPersonLimit(200);
			course.setLrrq(new Date());
			course.setYxbj("Y");
			course.setAvailable("1");
			courseId = course.getCourseId();
		}
		if("3".equals(category)){
			if(isNew)
				course.setCourseState("7");
			else{
				courseManageService.updateCourseById(courseId, courseName, courseIntro, null, courseType, null);
			}
			mv = new ModelAndView("/blhrf/lrInputWatch");
			List<Map<String,Object>> detailMap = courseManageService.queryCourseDetailById(courseId);
			mv.addObject("courseItem", detailMap);
		}else
			mv = new ModelAndView("/blhrf/inputWatch");
		if(isNew)
			courseManageService.saveCourseTitle(course);
		else
			mv.addObject("totalSize",courseManageService.queryCourseDetailSize(courseId));
		mv.addObject("appId", BlhrConf.getInstance().getAppID());
		mv.addObject(ResourceEnumType.chat_signature_package.getValue(), BlhrArgumentCache.getCacheData(ResourceEnumType.chat_signature_package.getValue()));
		mv.addObject("courseId", courseId);
		mv.addObject("photoPath", StringUtils.isBlank(CommonUtil.getUserByUserId(userId).getPhoto())?"":CommonUtil.getUserByUserId(userId).getPhoto().replace("\\", "/"));
		mv.addObject("userId", userId);
		mv.addObject("courseName", courseName);
		return mv;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="createBroadcaseb",produces="application/json;charset=UTF-8")
	public String createBroadcaseb(String courseName,String courseIntro,String courseType,
			String playTime,String playLimit,String userId,String category,String courseId){

		Courses course = new Courses();
		course.setCourseId(SequenceUtil.generateSequeueString());
		course.setCourseName(courseName);
		course.setCourseProfile(courseIntro);
		course.setTeacherId(userId);
		course.setCategory(category);
		course.setCourseState("1");
		course.setUserId(userId);
		course.setLrrq(new Date());
		course.setCreateTime(new Date());
		course.setCourseType(courseType);
		course.setCreatePerson(((User)BlhrArgumentCache.getCacheData(userId)).getUsername());
		if(playTime != null)
			try {
				course.setPlayTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(playTime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		if(playLimit != null)
			course.setPersonLimit(Integer.parseInt(playLimit));
		else
			course.setPersonLimit(200);
		course.setLrrq(new Date());
		course.setYxbj("Y");
		course.setAvailable("1");
		courseId = course.getCourseId();
		courseManageService.saveCourseTitle(course);
		return "1";
	}
	
	
	/**
	 * 
	 * @param courseId
	 * @param courseName
	 * @param userId
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/continueInput")
	public ModelAndView continueInput(String courseId,String courseName,String courseProfile,String userId) throws IOException{
		ModelAndView mv = new ModelAndView("/blhrf/ke_kelr");
		Map<String,Object> map = courseManageService.queryCourseById(courseId);
		mv.addObject("courseId", courseId);
		mv.addObject("userId", userId);
		mv.addObject("courseName", courseName);
		mv.addObject("courseProfile", map.get("course_profile"));
		mv.addObject("courseType",map.get("course_type"));
		return mv;

	}
	
/*	@RequestMapping("/continueInput")
	public ModelAndView continueInput(String courseId,String courseName,String userId) throws IOException{
		ModelAndView mv = new ModelAndView("/blhrf/lrInputWatch");
		List<Map<String,Object>> detailMap = courseManageService.queryCourseDetailById(courseId);
		mv.addObject("courseItem", detailMap);
		mv.addObject("appId", BlhrConf.getInstance().getAppID());
		mv.addObject(ResourceEnumType.chat_signature_package.getValue(), BlhrArgumentCache.getCacheData(ResourceEnumType.chat_signature_package.getValue()));
		mv.addObject("courseId", courseId);
		mv.addObject("userId", userId);
		mv.addObject("courseName", courseName);
		return mv;
		
	}
	
*/	
	/**
	 * 
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/openCourseDetail")
	public ModelAndView openCourseDetail(String userId,String courseId,String courseName) throws IOException{
		ModelAndView mv = new ModelAndView("/blhrf/broadcastPanel");
		LearnRecords record = new LearnRecords();
		record.setCourse_id(courseId);
		record.setLearn_time(new Date());
		record.setLrrq(new Date());
		record.setUser_id(userId);
		record.setRecordsId(SequenceUtil.generateSequeueString());
		courseManageService.saveLearnedCourse(record);
		mv.addObject("userId", userId);
		mv.addObject("photoPath", StringUtils.isBlank(CommonUtil.getUserByUserId(userId).getPhoto())?"":CommonUtil.getUserByUserId(userId).getPhoto().replace("\\", "/"));
		mv.addObject("courseId", courseId);
		mv.addObject("courseName", courseName);
		return mv;
	}
	
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping("/openBroacast")
	public ModelAndView openBroadCast(){
		
		ModelAndView mv = new ModelAndView("/blhrb/broadcastManage");
		return mv;
	}
	
	
	
	/**
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/cycleQueryCourseDetail")
	public String cycleQueryCourseDetail(String courseId,String rowNum,String pageSize){
		logger.debug("==========打开课程详细入参["+courseId+"] rowNum ["+rowNum+"] pageSize ["+pageSize+"]");
		List<Map<String,Object>> lis = courseManageService.queryCourseDetailByNum(Integer.parseInt(rowNum), Integer.parseInt(pageSize), courseId);
        Long currentSize = new Long(Integer.parseInt(rowNum));
		for(Map<String,Object> m:lis)
        	if(currentSize < (Long)m.get("item_no"))
        		currentSize = (Long)m.get("item_no");
        		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("currentSize", currentSize);
		map.put("data", lis);
		return new JSONObject(map).toString();
	}
	
	
	@RequestMapping("/gotoLvPage")
	public ModelAndView gotoLvPage(String userId,String courseId) throws IOException{
		ModelAndView mv = new ModelAndView("/blhrf/inputWatch");
		mv.addObject("appId", BlhrConf.getInstance().getAppID());
		mv.addObject(ResourceEnumType.chat_signature_package.getValue(), BlhrArgumentCache.getCacheData(ResourceEnumType.chat_signature_package.getValue()));
		mv.addObject("courseId", courseId);
		mv.addObject("userId", userId);
		return mv;
	}
	
	
	/**
	 * 
	 * @param userId
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/gotoLrKc")
	public ModelAndView gotoLrKc(String userId) throws IOException{
		ModelAndView mv = new ModelAndView("/blhrf/ke_kelr");
		mv.addObject("userId", userId);
		return mv;
	}
	
	
	@RequestMapping("/gotoZbKc")
	public ModelAndView gotoZbKc(String userId) throws IOException{
		ModelAndView mv = new ModelAndView("/blhrf/ke_zb");
		mv.addObject("userId", userId);
		return mv;
	}
	
  
	@RequestMapping("/endCourse")
    public ModelAndView endCourse(String userId,String courseId,String category){
    	
    	logger.info("=============用户ID["+userId+"]=============");
    	if("1".equals(category)||"3".equals(category))
    		this.courseManageService.updateCourseToEnd(courseId,"9");
    	else
    		this.courseManageService.updateCourseToEnd(courseId,"3");
    	if(userId == null || "".equals(userId))
    		throw new IllegalAccessError("非法接入，用户标识不存在，请使用手机登了");
    	User user = (User) BlhrArgumentCache.getCacheData(userId);
    	if(user == null )
    		throw new IllegalAccessError("非法接入，用户标识不存在，请使用手机登了");
    	ModelAndView mv = new ModelAndView("/blhrf/ke_mykc");
    	mv.addObject("username", user.getUsername());
    	mv.addObject("userId", userId);
    	return mv;
    }
	
	@ResponseBody
	@RequestMapping(value="/backEndCourse",produces = "text/html;charset=UTF-8", method=RequestMethod.GET)
	public String backEndCourse(String courseId,String state){
		this.courseManageService.updateCourseToEnd(courseId,state);
		return "1";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/pushMessage",produces = "text/html;charset=UTF-8", method=RequestMethod.POST)
	public String pushMessage(String courseId) throws IOException{
		Map<String,Object> map = this.courseManageService.queryCourseById(courseId);
		List<User> users= this.userManageService.usersManage();
		for(User user:users){
			String url = Constant.CONSTOM_MESSAGE_PUSH+BlhrArgumentCache.getCacheData(ResourceEnumType.common_access_token.getValue());
			sendMessageToInternet(url,constructMessage(user.getOpenid(),"您好：["+CommonUtil.base64ToString(user.getWechatname(), "UTF-8")+"]"
					+ " 您收藏的课程 ["+map.get("course_name")+"] 即将开播，请注意查阅!"));
		}
		return "1";
	}
	
	
	
	/**
	 * 
	 * @param userOpenId
	 * @param list
	 * @return
	 */
	private String constructMessage(String userOpenId,String message){
		
		return "{\"touser\": \""+userOpenId+"\", \"msgtype\": \"text\","+
		   		     "\"text\": {\"content\": \""+message+"\"}}";
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
	 * @param userId
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/openCourseProfile")
	public ModelAndView openCourseProfile(String userId,String courseId,String courseName,String teacherId) throws IOException{
		ModelAndView mv = new ModelAndView("/blhrf/playback");
		Members member = memberService.queryUserByCondiation(userId);
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
		mv.addObject("courseId", courseId);
		mv.addObject("userType", member != null?2:0);
		mv.addObject("courseName", courseName);
		mv.addObject("teacherId", teacherId);
		return mv;
	}
	
	
	/**
	 * 
	 * @param userId
	 * @param courseId
	 * @param courseName
	 * @return
	 */
	@RequestMapping(value="openBackCoursePanel",produces = "text/html;charset=UTF-8", method=RequestMethod.GET)
	public ModelAndView openBackCoursePanel(String userId,String courseId,String teacherId){
	
		ModelAndView mv = new ModelAndView("/blhrf/backCoursePanel");
	    if(this.courseManageService.queryWhetherLearn(userId, courseId) <= 0){
	    	LearnRecords record = new LearnRecords();
	    	record.setCourse_id(courseId);
	    	record.setLearn_time(new Date());
	    	record.setLrrq(new Date());
	    	record.setUser_id(userId);
	    	record.setRecordsId(SequenceUtil.generateSequeueString());
	    	courseManageService.saveLearnedCourse(record);
	    }
	    User user = this.userManageService.queryUserById(teacherId);
	    Map<String,Object> map = this.courseManageService.queryCourseById(courseId);
		mv.addObject("userId", userId);
		mv.addObject("photoPath", user.getPhoto());
		mv.addObject("courseId", courseId);
		mv.addObject("courseName", map.get("course_name"));
		return mv;
	}
	
	

	/**
	 * @description 查询待审批课程
	 * @param startPage
	 * @param pageSize
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/querySpCourseInfo" ,produces="application/json;charset=UTF-8")
	public String querySpCourseInfo(String page,String rows){
		//page,rows
		List<Map<String,Object>> lismap = courseManageService.querySpCourseInfo((Integer.parseInt(page)-1)*10, Integer.parseInt(rows));
		int total = courseManageService.queryAllSpCourseNum();
		return EasyUiDataHandlerUtil.ConvertListMapToUiGrid2(lismap, total);
		//return EasyUiDataHandlerUtil.ConvertListMapToUiGrid(courseManageService.querySpCourseInfo((Integer.parseInt(page)-1)*10, Integer.parseInt(rows)));
	}
	
	
	/**
	 * 
	 * @param courseId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/updateCourseProfile" ,produces="application/json;charset=UTF-8")
	public String updateCourseProfile(String courseId){
		
		Map<String,Object> map = courseManageService.queryCourseById(courseId);
		
		return new JSONObject(map).toString();
		
	}
	
	@ResponseBody
	@RequestMapping(value="/saveUpdateCourseProfile" ,produces="application/json;charset=UTF-8")
	public String saveUpdateCourseProfile(String courseId,String courseName,String profile,
			String teacherId,String courseType,String payType,String weight){
		//加入了权重
		int weight_ = 1;
		if(!weight.equals("")){
			weight_ = Integer.parseInt(weight);
		}
		courseManageService.updateCourseByIdAddWeight(courseId,courseName,profile,
				teacherId,courseType,payType,weight_);
		
		return "1";
		
	}
	
	

	/**
	 * 查看待审批课程详细信息
	 * @param request
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/queryDspCourseDetailInfo",method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public String teacherDetail(HttpServletRequest request, Model model){
		String course_id = request.getParameter("course_id");
		Map<String, Object> dspCourseDetail = courseManageService.queryDspCourseByCourseId(course_id);
		List<Map<String, Object>> retList = new ArrayList<Map<String,Object>>();
		retList.add(dspCourseDetail);
		JSONArray jsonArray = new JSONArray(retList);
		return jsonArray.toString();
	}

	@ResponseBody
	@RequestMapping(value="/passCourse" ,produces="application/json;charset=UTF-8")
	public String passCourse(String page,String rows,String course_id){
		
		courseManageService.passDspCourse(course_id);
		
		return EasyUiDataHandlerUtil.ConvertListMapToUiGrid(courseManageService.querySpCourseInfo((Integer.parseInt(page)-1)*10, Integer.parseInt(rows)));

	}
	
	
	
	

}
