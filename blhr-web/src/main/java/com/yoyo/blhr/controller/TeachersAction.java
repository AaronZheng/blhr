/*package com.yoyo.blhr.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yoyo.blhr.service.TeachersService;

@Controller
public class TeachersAction {

	@Autowired
	private TeachersService teachersService;
	static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	*//**
	 * 查询所有讲师
	 * @param request
	 * @param model
	 * @return
	 *//*
	@ResponseBody
	@RequestMapping(value="/teachersManage",method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public String teachersManage(HttpServletRequest request, Model model){
		List<Map<String, Object>> teachers= this.teachersService.queryTeachers();
		for(Map<String, Object> teacher : teachers){
			String userId = (String) teacher.get("userId");
			Date lrrq = (Date)teacher.get("lrrq");
			teacher.put("lrrq", sdf.format(lrrq));
			//创建课程数
			int courseCount = this.teachersService.queryCourseCountByTeacherId(userId);
			teacher.put("courseCount", courseCount);
		}
		//model.addAttribute("teachers", teachers);
		JSONArray jsonArray = new JSONArray(teachers);
		
		return jsonArray.toString();
	}
	*//**
	 * 查看讲师详细信息
	 * @param request
	 * @param model
	 * @return
	 *//*
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
	*//**
	 * 通过申请/拒绝申请
	 * @param request
	 * @param model
	 * @return
	 *//*
	@RequestMapping(value="/applyRes",method = RequestMethod.POST)
	public String applyRes(HttpServletRequest request, Model model){
		String state = request.getParameter("state");
		String userId = request.getParameter("userId");
		this.teachersService.changeTeacherState(state, userId);
		return "index";
	}
}
*/