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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yoyo.blhr.dao.model.Members;
import com.yoyo.blhr.dao.model.PayType;
import com.yoyo.blhr.dao.model.User;
import com.yoyo.blhr.service.UserManageService;
import com.yoyo.blhr.util.CommonUtil;
import com.yoyo.blhr.util.EasyUiDataHandlerUtil;

@Controller
public class UserManageAction {
	
	static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	@Autowired
	private UserManageService userManageService;
	
	
	
	@RequestMapping(value="/usersManage",method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String usersManage(String page,String rows) throws IOException{
		//分页
		//(Integer.parseInt(page)-1)*10, Integer.parseInt(rows))
		List<Map<String, Object>> retList = new ArrayList<Map<String,Object>>();
		List<User> users= this.userManageService.usersManagePage((Integer.parseInt(page)-1)*10, Integer.parseInt(rows));
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
				//会员结束时间
				map.put("expireTime", sdf.format(member.getExpireTime()));
			}else{
				map.put("isMember","否");
				map.put("typeName","-");
				map.put("expireTime","-");
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
		int total = userManageService.queryAllUsersNum();
		return EasyUiDataHandlerUtil.ConvertListMapToUiGrid2(retList, total);
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
	}
}
