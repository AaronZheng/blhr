package com.yoyo.blhr.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yoyo.blhr.dao.model.Members;
import com.yoyo.blhr.dao.model.PayType;
import com.yoyo.blhr.dao.model.User;
import com.yoyo.blhr.service.UserManageService;
import com.yoyo.blhr.util.CommonUtil;

@Controller
public class UserManageAction {
	
	static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	@Autowired
	private UserManageService userManageService;
	
	
	
	@RequestMapping(value="/usersManage",method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String usersManage(HttpServletRequest request, Model model) throws IOException{
		List<Map<String, Object>> retList = new ArrayList<Map<String,Object>>();
		List<User> users= this.userManageService.usersManage();
		for(User user : users){
			Map<String, Object> map = new HashMap<String, Object>();
			String userId = user.getUserId();
			//查询是否是付费会员
			Members member = this.userManageService.isMember(userId);
			if(member != null){
				map.put("isMember","是");
				//查询付费类型
				String payTypeCode = member.getPayType();
				PayType payType = this.userManageService.queryPayTypeByCode(payTypeCode);
				String typeName = payType.getTypeName();
				map.put("typeName", typeName);
			}else{
				map.put("isMember","否");
				map.put("typeName","-");
			}
			//查询收听课程数
			int recordsCount = this.userManageService.queryRecordsCountByUserId(userId);
			map.put("userId", user.getUserId());
			map.put("username", user.getUsername());
			map.put("category", user.getCategory());
			map.put("wechatname", CommonUtil.base64ToString(user.getWechatname(),"UTF-8"));
			map.put("lrrq", sdf.format(user.getLrrq()));
			map.put("recordsCount", recordsCount);
			retList.add(map);
		}
		//model.addAttribute("users", retList);
		JSONArray jsonArray = new JSONArray(retList);
		String retStr = jsonArray.toString();
		return retStr;
	}
	
	/**
	 * 数据统计-用户
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/usersStat",method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
	public String usersStat(HttpServletRequest request){
		String retStr = null;
		
		return retStr;
	}
	
	@RequestMapping(value="/exit",method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
	public void exit(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String root = request.getContextPath();
		response.sendRedirect("http://www.baidu.com");
		//request.getRequestDispatcher("/blhrb/login/login.jsp").forward(request,response);
	}
}
