package com.yoyo.blhr.dao.impl;

import com.yoyo.blhr.dao.model.Members;


/**
 * 
 * 
 * @author zcl
 *
 */
public interface MemberDao {
	
	
	/**
	 * 
	 * @param userId
	 * 
	 * @return
	 */
	public Members queryMemberByCondition(String userId);
	
	
	/**
	 * @description delete member user information ... 
	 * 
	 * @param userId
	 */
	public void deleteMemberByUserId(String userId);
	
	/**
	 * 
	 * @param member
	 */
	public void saveMember(Members member);
	
	
	/**
	 * 
	 * @param member
	 */
	public void updateMember(Members member);
	
	

}
