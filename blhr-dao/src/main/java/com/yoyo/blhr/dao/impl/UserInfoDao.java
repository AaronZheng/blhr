package com.yoyo.blhr.dao.impl;

import java.util.List;
import java.util.Map;

import com.yoyo.blhr.dao.model.User;

/**
 * 
 * 
 * @author zcl
 *
 */
public interface UserInfoDao {
	
	/**
	 * 
	 * @param user
	 */
	public void saveUserInfo(User user);
	

	/**
	 * @description query user information by condition ...
	 * 
	 * @param category
	 * 
	 * @return
	 */
	public List<User> queryUserInfoByCondition(String category);
	
	
	/**
	 * @description check user whether exist in database  .... 
	 * 
	 * @param username
	 * 
	 * @param password
	 * 
	 * @param openId
	 * 
	 * @return
	 */
	public int isUserExist(String openid);
	
	
	/**
	 * 
	 * @param userId
	 * @return
	 */
	public User queryUserByUserId(String userId);
	

	/**
	 * 
	 * @param map
	 */
	public void updateUserToTeacher(Map<String, Object> map);
	
	/**
	 * 
	 * @param userId
	 */
	void updateTeacherToUser(String userId);
	

}
