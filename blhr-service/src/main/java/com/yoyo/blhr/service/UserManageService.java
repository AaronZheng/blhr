package com.yoyo.blhr.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yoyo.blhr.dao.impl.LearnedRecordsDao;
import com.yoyo.blhr.dao.impl.LoginDao;
import com.yoyo.blhr.dao.impl.MemberDao;
import com.yoyo.blhr.dao.impl.PayTypeDao;
import com.yoyo.blhr.dao.impl.UserInfoDao;
import com.yoyo.blhr.dao.model.Members;
import com.yoyo.blhr.dao.model.PayType;
import com.yoyo.blhr.dao.model.User;

@Service(value="userManageService")
public class UserManageService {

	@Autowired(required = false)
	private LoginDao loginDao;
	@Autowired(required = false)
	private MemberDao memberDao;
	@Autowired(required = false)
	private PayTypeDao payTypeDao;
	@Autowired(required = false)
	private LearnedRecordsDao learnRecordDao;
	@Autowired
	private UserInfoDao userInfoDao;
	

	/**
	 * 用户
	 * @return
	 */
	public List<User> usersManage() {
		List<User> users = this.loginDao.queryAllUsers();
		return users;
	}
	
	
	/**
	 * 
	 * @param userId
	 * @return
	 */
	public User queryUserById(String userId){
		return userInfoDao.queryUserByUserId(userId);
	}
	
	public void updateUserInfo(User user){
		userInfoDao.updateUserInfo(user);
	}

	/**
	 * 判断用户是否为付费会员
	 * @param userId
	 * @return
	 */
	public Members isMember(String userId) {
		Members member = this.memberDao.queryMemberByCondition(userId);
		return member;
	}
	
	/**
	 * 查询付费类型
	 * @param payTypeCode
	 * @return
	 */
	public PayType queryPayTypeByCode(String payTypeCode){
		PayType payType = this.payTypeDao.queryPayTypeByCode(payTypeCode);
		return payType;
	}

	public int queryRecordsCountByUserId(String userId) {
		Object recordsCount = this.learnRecordDao.queryRecodrsCount(userId);
		int count = 0;
		if(recordsCount != null)
			count = (Integer) recordsCount;
		return count;
	}
	
	/**
	 * 
	 * @param userId
	 */
	public void updateUserToTeacher(String userId,String fileName,String teacherName,String teacherPassword){
		String category = "2";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("userId", userId);
		map.put("photo", fileName);
		map.put("username", teacherName);
		map.put("password", teacherPassword);
		this.userInfoDao.updateUserToTeacher(map);
	}
	
	
	/**
	 * 
	 * @param userId
	 */
	public void updateTeacherToUser(String userId){
		
		this.userInfoDao.updateTeacherToUser(userId);
	}


	public int queryAllUsersNum() {
		return this.userInfoDao.queryAllUsersNum();
	}


	public List<User> usersManagePage(int startPage,int pageSize) {
		return this.userInfoDao.queryAllUsersPage(startPage, pageSize);
	}
	
	

	
}
