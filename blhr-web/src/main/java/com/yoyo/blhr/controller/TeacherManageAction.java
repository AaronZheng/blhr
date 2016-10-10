package com.yoyo.blhr.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yoyo.blhr.dao.model.Teachers;
import com.yoyo.blhr.dao.model.User;
import com.yoyo.blhr.service.TeachersService;
import com.yoyo.blhr.service.UserManageService;
import com.yoyo.blhr.util.BlhrArgumentCache;
import com.yoyo.blhr.util.CommonUtil;
import com.yoyo.blhr.util.EasyUiDataHandlerUtil;

@Controller
public class TeacherManageAction {
	
	@Autowired
	private TeachersService teachersService;
	@Autowired
	private UserManageService userManageService;
	
	static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
    private Logger logger = Logger.getLogger(this.getClass());

	
	@RequestMapping("/initTeacherApplication")
	public ModelAndView initTeacherApplicationPage(){
		ModelAndView mv = new ModelAndView("/blhrf/teacherApplication");
		return mv;
	}
	
	
	@RequestMapping("/teacherApplication")
	public ModelAndView applicationBeTeacher(String userId,String trueName,String idCard,String phone,String profile){
	
		ModelAndView mv = new ModelAndView();
		Teachers teacher = new Teachers();
		teacher.setUsername(trueName);
		teacher.setIdCard(idCard);
		teacher.setProfile(profile);
		teacher.setApplicationTime(new Date());
		teacher.setYxbj("1");
		teacher.setUserId(userId);
		return mv;
	}
	

	/**
	 * 查询所有讲师
	 * @param request
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws  
	 */
	@ResponseBody
	@RequestMapping(value="/teachersManage",method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public String teachersManage(HttpServletRequest request, Model model) throws IOException{
		List<Map<String, Object>> teachers= this.teachersService.queryTeachers();
		for(Map<String, Object> teacher : teachers){
			String userId = (String) teacher.get("userId");
			Date lrrq = (Date)teacher.get("lrrq");
			teacher.put("lrrq", sdf.format(lrrq));
			teacher.put("wechatname", CommonUtil.base64ToString((String)teacher.get("wechatname"), "UTF-8"));
			//创建课程数
			int courseCount = this.teachersService.queryCourseCountByTeacherId(userId);
			teacher.put("courseCount", courseCount);
			//讲师状态数字转文字
			String state = teacher.get("state")+"";
			if("1".equals(state))
				teacher.put("state", "账户正常");
			else if("2".equals(state))
				teacher.put("state", "资格取消");
		}
		//model.addAttribute("teachers", teachers);
		JSONArray jsonArray = new JSONArray(teachers);
		
		return jsonArray.toString();
	}
	
	
	@ResponseBody
	@RequestMapping(value="/queryTeachers",method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public String queryTeachers(){
		
		List<Map<String, Object>> teachers= this.teachersService.queryTeachers();
		List<Map<String,Object>> rtn = new  ArrayList<Map<String,Object>>();
		for(Map<String,Object> map: teachers){
			Map<String,Object> tmpmap = new HashMap<String,Object>();
			tmpmap.put("userId", map.get("userId"));
			tmpmap.put("fullname", map.get("fullname"));
			rtn.add(tmpmap);
		}
		
		return new JSONArray(rtn).toString();
	}
	
	
	/**
	 * 查看讲师详细信息
	 * @param request
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/teacherDetail",method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public String teacherDetail(HttpServletRequest request, Model model){
		String userId = request.getParameter("userId");
		Map<String, Object> teacherDetail = this.teachersService.queryTeacherDetail(userId);
		//model.addAttribute("teacherDetail", teacherDetail);
		List<Map<String, Object>> retList = new ArrayList<Map<String,Object>>();
		retList.add(teacherDetail);
		JSONArray jsonArray = new JSONArray(retList);
		return jsonArray.toString();
	}
	/**
	 * 通过申请/拒绝申请
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/applyRes",method = RequestMethod.POST)
	public String applyRes(HttpServletRequest request, Model model){
		String state = request.getParameter("state");
		String userId = request.getParameter("userId");
		this.teachersService.changeTeacherState(state, userId);
		return "index";
	}
	
	
	/**
	 * 注册讲师
	 * @param request
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/newTeacher", method = RequestMethod.POST)
	public String newTeacher(HttpServletRequest request, Model model){
		String userId  = request.getParameter("userId");
		String username = request.getParameter("username");
		String fullname = request.getParameter("fullname");
		String profile = request.getParameter("profile");
		String idCard = request.getParameter("idCard");
		Teachers teacher = new Teachers();
		teacher.setUserId(userId);
		teacher.setUsername(username);
		teacher.setFullname(fullname);
		teacher.setJobName(request.getParameter("jobName"));
		teacher.setIdCard(idCard);
		teacher.setProfile(profile);
		teacher.setApplicationTime(new Date());
		teacher.setYxbj("Y");
		teacher.setState("2");
		this.teachersService.newTeacher(teacher);
		//更新用户状态category=2
	//	this.userManageService.updateUserToTeacher(userId);
		return "success";
	}
	

    
    @RequestMapping("/initTeacher")
    public ModelAndView initTeacher(String userId){
    	logger.info("=============用户ID["+userId+"]=============");
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
	@RequestMapping(value="deleteTeacherByTeacherId" ,produces="application/json;charset=UTF-8")
	public String deleteTeacherByTeacherId(HttpServletRequest request,String page,String rows,String teacherId){
		//String startPage = request.getParameter("startPage");
		teachersService.deleteTeacherById(teacherId);
		userManageService.updateTeacherToUser(teacherId);
		return EasyUiDataHandlerUtil.ConvertListMapToUiGrid(teachersService.queryAllTeachersInfo((Integer.parseInt(page)-1)*10,Integer.parseInt(rows)));
	}
	

	
	
	
}
