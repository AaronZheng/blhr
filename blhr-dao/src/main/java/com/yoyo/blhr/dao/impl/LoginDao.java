package com.yoyo.blhr.dao.impl;

import org.springframework.stereotype.Repository;

import com.yoyo.blhr.dao.model.User;

import java.util.List;
import java.util.Map;

/**
 * Created by zcl on 2016/7/15.
 */
@Repository(value="loginDao")
public interface LoginDao {

	
	/**
	 * 
	 * @param username
	 * @return
	 */
    public List<Map<String,Object>> queryUserMap(String username);
    
    /**
     * @description Query index page course information ... 
     * 
     * @return
     */
    public List<Map<String,Object>> queryCourseList();
    
    /**
     * 
     * @return
     */
    public List<Map<String,Object>> queryCourseListAndNum();
    
    
    
    /**
     * @zm
     * @param map
     * @return
     */
    public User queryUserInfoByCondition(Map<String,String> map);

    /**
     * zm
     * @return
     */
    public List<User> queryAllUsers();
    
    /**
     * zm
     * @param date
     * @return
     */
    public List<Map<String, Object>> dataSta(String date);
    

	public int totalBefore7days(String format);
}
