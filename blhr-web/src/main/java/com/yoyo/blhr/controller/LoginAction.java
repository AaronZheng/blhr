package com.yoyo.blhr.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import com.yoyo.blhr.dao.model.Members;
import com.yoyo.blhr.dao.model.User;
import com.yoyo.blhr.service.LoginService;
import com.yoyo.blhr.service.MemberService;
import com.yoyo.blhr.service.UserInfoService;
import com.yoyo.blhr.util.BlhrArgumentCache;
import com.yoyo.blhr.util.BlhrConf;
import com.yoyo.blhr.util.CommonUtil;
import com.yoyo.blhr.util.Constant;
/**
 * Created by zcl on 2016/7/12.
 */
@Controller
public class LoginAction {

    @Autowired
    private LoginService loginService;
    @Autowired
    private UserInfoService userInfoService;
    @Autowired
    private MemberService  memberService;
    
    private Logger logger = Logger.getLogger(this.getClass());

    
    @RequestMapping("/initLogin")
    public String initLogin(){
    	return "/blhrb/login/login";
    }
   
    
    
    /**
     * 
     * @param request
     * @param model
     * @return
     * @throws NoSuchAlgorithmException
     */
    @ResponseBody
    @RequestMapping(value="/validateLoginInfo",method = RequestMethod.GET)
    public String loginAction(HttpServletRequest request, Model model) throws NoSuchAlgorithmException{
    	String username = request.getParameter("username");
    	String password = request.getParameter("password");
        User user = this.loginService.loginService(username,password);
        if(user != null){
        	request.getSession().setAttribute("username", username);
        	request.getSession().setAttribute("backuserId", user.getUserId());
        	request.getSession().setAttribute("password", password);
        	return "1";
        }else
            return "2";
    }
    
    
    @ResponseBody
    @RequestMapping(value="/validateTeacherLoginInfo",method = RequestMethod.GET)
    public String validateTeacherLoginInfo(HttpServletRequest request) throws NoSuchAlgorithmException{
    	String username = request.getParameter("username");
    	String password = request.getParameter("password");
    	User user = this.loginService.loginService(username,password);
    	if(user != null){
    		request.getSession().setAttribute("username", username);
    		request.getSession().setAttribute("password", password);
    		return "{\"state\":\"1\",\"userId\":\""+user.getUserId()+"\"}";
    	}else
    		return "{\"state\":\"2\"}";
    }
    
    
    /**
     * @description login to main page ...
     * @param request
     * @return
     */
    @RequestMapping("/loginMainPage")
    public ModelAndView loginMainPage(HttpServletRequest request){
    	ModelAndView mv = new ModelAndView("/blhrb/frame");
    	mv.addObject("username", request.getSession().getAttribute("username"));
    	mv.addObject("userId", request.getSession().getAttribute("password"));
    	return mv;
    }
    
    
    
    
    /**
     * @description initialization index page information ... 
     * 
     * @return ModelAndView
     */
    @RequestMapping(value="/index",method = RequestMethod.GET)
    public ModelAndView indexAction(){
    	List<Map<String,Object>> courseTitleList = loginService.queryCourseList();
    	ModelAndView mv = new ModelAndView("/blhrf/index");
    	mv.addObject("courseTitleList", courseTitleList);
    	return mv;
    }
    
    /**
     * @description wechat login handler ...
     * 
     * @return ModelAndView
     * 
     * @throws IOException 
     */
    @RequestMapping("/wechatlogin")
    public ModelAndView wechatLoginAction(HttpServletRequest req,String code,String state,String userId) throws IOException{
    	logger.debug("=====微信登录获取code为["+code+"]状态值为state["+state+"] userId["+userId+"]====");
    	User user = null;
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
		Members member = memberService.queryUserByCondiation(user.getUserId());
		req.getSession().setAttribute(Constant.USER_ID, user);
    	ModelAndView mv = new ModelAndView("/blhrf/ke_back");
    	List<Map<String,Object>> courseTitleList = loginService.queryCourseListAndNum();
    	logger.debug("=====username["+user.getWechatname()+"openid["+user.getOpenid()+"]");
    	List<Map<String, Object>> banner = loginService.queryBanner();
    	mv.addObject("username", new String(new BASE64Decoder().decodeBuffer(user.getWechatname()),"UTF-8"));
    	mv.addObject("openId", user.getOpenid());
    	mv.addObject("userType", member != null ? 2 : 0);
    	mv.addObject("courseTitleList", courseTitleList);
    	mv.addObject("userInfo", user.getUsername());
    	mv.addObject("userId", user.getUserId());
    	mv.addObject("banner", banner);
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

}