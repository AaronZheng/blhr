package com.yoyo.blhr.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yoyo.blhr.dao.impl.UserInfoDao;
import com.yoyo.blhr.dao.model.User;

/**
 * 
 * 
 * @author zcl
 *
 */
@Service("userInfoService")
public class UserInfoService {
	
	@Autowired(required=false)
	private UserInfoDao userInfoDao;
	
	/**
	 * @description save user information into the database ...
	 * 
	 * @param user user entry information ...
	 * 
	 */
	public void saveUserInfo(User user){
		userInfoDao.saveUserInfo(user);
	}
	
	
	/**
	 * @description query user information by condition ... 
	 * 
	 * @param category user category ..
	 * 
	 * @return
	 */
	public List<User> queryUserInfoByCondition(String category){
		return userInfoDao.queryUserInfoByCondition(category);
	}
	
	/**
	 * @description query user information by userId ... 
	 * 
	 * @param userId
	 * 
	 * @return
	 */
	public User queryUserByUserId(String userId){
		
		return userInfoDao.queryUserByUserId(userId);
	}
	
	/**
	 * @description check current user whether exist in database or not ....
	 * 
	 * @param username
	 * 
	 * @param password
	 * 
	 * @param openId
	 * 
	 * @return
	 */
	public Boolean isExist(String openId){

		if(userInfoDao.isUserExist(openId)>0)
			return true;
		return false;
	}
	

}
