package com.yoyo.blhr.service;


import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yoyo.blhr.dao.impl.BannerDao;
import com.yoyo.blhr.dao.impl.LoginDao;
import com.yoyo.blhr.dao.model.User;
import com.yoyo.blhr.util.SequenceUtil;

/**
 * Created by zcl on 2016/7/15.
 */
@Service(value="loginService")
public class LoginService {

    @Autowired(required = false)
    private LoginDao loginDao;
    @Autowired(required = false)
    private BannerDao bannerDao;
    /**
     * @param username
     * @param password
     * @return
     * @throws NoSuchAlgorithmException
     */
    public User loginService(String username,String password) throws NoSuchAlgorithmException{
    	String pwdMD5 =	SequenceUtil.generateMd5EncryptString(password);
        Map<String,String> map = new HashMap<String,String>();
        map.put("username",username);
        map.put("password",pwdMD5);
        User user = this.loginDao.queryUserInfoByCondition(map);
        return user;
    }
    
    
    /**
     * @description Query index page course information ... 
     * 
     * @return List<Map<String,Object>>
     */
    public List<Map<String,Object>> queryCourseList(){
    	
    	return loginDao.queryCourseList();
    }
    
    
    /**
     * 
     * @return
     */
    public List<Map<String,Object>> queryCourseListAndNum(){

    	return loginDao.queryCourseListAndNum();
    }


	public List<Map<String, Object>> queryBanner() {
		return bannerDao.queryBanner();
	}


}
