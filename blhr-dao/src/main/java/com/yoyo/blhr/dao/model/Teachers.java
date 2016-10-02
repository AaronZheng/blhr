package com.yoyo.blhr.dao.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @author zcl
 *
 */
public class Teachers implements Serializable{
	
	private static final long serialVersionUID = 5489046100963120475L;

	private String userId;
	
	private String username;
	
	private String fullname;
	
	private String idCard;
	
	private String profile;
	
	private Date applicationTime;
	
	private String jobName;
	
	private String state;
	
	private Date checkTime;
	
	private String yxbj;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	

	public String getIdCard() {
		return idCard;
	}
	

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public Date getApplicationTime() {
		return applicationTime;
	}

	public void setApplicationTime(Date applicationTime) {
		this.applicationTime = applicationTime;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Date getCheckTime() {
		return checkTime;
	}

	public void setCheckTime(Date checkTime) {
		this.checkTime = checkTime;
	}

	public String getYxbj() {
		return yxbj;
	}

	public void setYxbj(String yxbj) {
		this.yxbj = yxbj;
	}
	
}
