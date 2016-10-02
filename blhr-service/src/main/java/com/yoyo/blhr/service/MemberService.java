package com.yoyo.blhr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yoyo.blhr.dao.impl.MemberDao;
import com.yoyo.blhr.dao.model.Members;

@Service("memberService")
public class MemberService {
	
	@Autowired(required=false)
	private MemberDao memberDao;
	
	/**
	 * 
	 * @param member
	 */
	public void saveMember(Members member){

		memberDao.saveMember(member);
	}
	
	public void updateMember(Members member){
		memberDao.updateMember(member);
	}
	
	/**
	 * 
	 * @param userId
	 * @return
	 */
	public Members queryUserByCondiation(String userId){
		
		return memberDao.queryMemberByCondition(userId);
	}
	
	
	

}
