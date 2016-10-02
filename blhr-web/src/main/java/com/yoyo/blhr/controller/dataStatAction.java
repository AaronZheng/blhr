package com.yoyo.blhr.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yoyo.blhr.service.DataStatService;

@Controller
public class dataStatAction {

	@Autowired
	private DataStatService dataStatService;
	static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	/**
	 * 数据统计
	 * @param request
	 * @return
	 * @throws ParseException 
	 */
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value="/dataStat",method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
	public String dataStat(HttpServletRequest request) throws ParseException{
		GetBeforeDay t = new GetBeforeDay();
		Date[] d = t.getDayBetween(7);
		System.out.println(d);
		String fre = request.getParameter("fre");//查询频率：7天/1个月/6个月
		String type = request.getParameter("type");//查询类型：订单/用户
		
		Map<String, Object> retMap = this.dataStatService.querydataStat(fre, type);
		List<Map<String, Object>> dataStat = (List<Map<String, Object>>) retMap.get("addList");
		Integer total_bef7 = (Integer) retMap.get("befCount");
		List<Map<String, Object>> retlist = new ArrayList<Map<String,Object>>();
		for(int i =0; i < d.length; i++){
			boolean flag = true;
			String time = sdf.format(d[i]);
			Map<String, Object> retTmp = new HashMap<String, Object>();
			for(Map<String, Object> map : dataStat){
				Date lrrq = (Date) map.get("lrrq");
				String dbtime = sdf.format(lrrq);
				if(time.equals(dbtime)){
					retTmp.put("lrrq", time);
					retTmp.put("add", map.get("count"));
					retlist.add(retTmp);
					flag = false;
					break;
				}
			} 
			if(flag){
				retTmp.put("lrrq", time);
				retTmp.put("add", 0L);
				retlist.add(retTmp);
			}
		}
		for(int i =retlist.size()-1; i >=0; i--){
			Integer ii = new Integer(((Long) retlist.get(i).get("add")).intValue());
			Integer total = ii+total_bef7;
			retlist.get(i).put("total", total);
			total_bef7 = ii+total_bef7;
		}
		
		
		JSONArray jsonArray = new JSONArray(retlist);
		return jsonArray.toString();
	}
	
}
