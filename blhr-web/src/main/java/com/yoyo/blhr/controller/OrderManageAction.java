package com.yoyo.blhr.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.yoyo.blhr.service.OrderManageService;
import com.yoyo.blhr.util.CommonUtil;
import com.yoyo.blhr.util.EasyUiDataHandlerUtil;

@Controller
public class OrderManageAction {

	@Autowired
	private OrderManageService orderManageService;
	static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	/**
	 * 订单管理-用户
	 * @param request
	 * @return
	 * @throws IOException 
	 * @throws  
	 */
	@ResponseBody
	@RequestMapping(value="/orderManage",method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
	public String orderManage(String page,String rows) throws IOException{
		List<Map<String,Object>> orders = orderManageService.queryOrdersPage((Integer.parseInt(page)-1)*10, Integer.parseInt(rows));
		int total = orderManageService.queryAllOrdersNum();
		//List<Map<String, Object>> orders = this.orderManageService.queryOrders();
		for(Map<String, Object> map : orders){
			Date startTime = (Date)map.get("startTime");
			Date endTime = (Date)map.get("endTime");
			map.put("startTime",sdf.format(startTime));
			map.put("endTime",sdf.format(endTime));
			map.put("wechatname", CommonUtil.base64ToString((String)map.get("wechatname"), "UTF-8"));
			String orderState = (String)map.get("orderState");
			if("1".equals(orderState))
				map.put("orderState", "已支付");
			else if("2".equals(orderState))
				map.put("orderState", "未支付");
		} 
		/*JSONArray jsonArray = new JSONArray(orders);
		return jsonArray.toString();*/
		return EasyUiDataHandlerUtil.ConvertListMapToUiGrid2(orders, total);
				
	}
}
