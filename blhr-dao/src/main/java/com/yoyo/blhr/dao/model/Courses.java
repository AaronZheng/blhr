package com.yoyo.blhr.dao.model;

import java.io.Serializable;
import java.util.Date;


/**
 * 
 * 
 * @author zhengchenglei
 *
 */
public class Courses implements Serializable{
	
	private static final long serialVersionUID = -5082397727102570894L;
	
	private String courseId;
	
	private String courseName;
	
	private String courseProfile;
	
	private String category;
	
	private String createPerson;
	
	private Date playTime;
	
	private String payType;
	
	private String courseType;
	
	private int personLimit;
	
	private String userId;
	
	private String teacherId;
	
	private String noticeTeacher;
	
	private String pushCourse;
	
	private Date createTime;
	
	private String courseState;
	
	private String available;
	
	private Date lrrq;
	
	private Date xgrq;
	
	private String yxbj;
	
	
	

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public String getCourseType() {
		return courseType;
	}

	public String getCreatePerson() {
		return createPerson;
	}

	public void setCreatePerson(String createPerson) {
		this.createPerson = createPerson;
	}

	public Date getPlayTime() {
		return playTime;
	}

	public void setPlayTime(Date playTime) {
		this.playTime = playTime;
	}

	public String getCoureType() {
		return courseType;
	}

	public void setCourseType(String courseType) {
		this.courseType = courseType;
	}

	public int getPersonLimit() {
		return personLimit;
	}

	public void setPersonLimit(int personLimit) {
		this.personLimit = personLimit;
	}

	public String getCourseProfile() {
		return courseProfile;
	}

	public void setCourseProfile(String courseProfile) {
		this.courseProfile = courseProfile;
	}

	public String getCourseId() {
		return courseId;
	}

	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}

	public String getNoticeTeacher() {
		return noticeTeacher;
	}

	public void setNoticeTeacher(String noticeTeacher) {
		this.noticeTeacher = noticeTeacher;
	}

	public String getPushCourse() {
		return pushCourse;
	}

	public void setPushCourse(String pushCourse) {
		this.pushCourse = pushCourse;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCourseState() {
		return courseState;
	}

	public void setCourseState(String courseState) {
		this.courseState = courseState;
	}

	public String getAvailable() {
		return available;
	}

	public void setAvailable(String available) {
		this.available = available;
	}

	public Date getLrrq() {
		return lrrq;
	}

	public void setLrrq(Date lrrq) {
		this.lrrq = lrrq;
	}

	public Date getXgrq() {
		return xgrq;
	}

	public void setXgrq(Date xgrq) {
		this.xgrq = xgrq;
	}

	public String getYxbj() {
		return yxbj;
	}

	public void setYxbj(String yxbj) {
		this.yxbj = yxbj;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

}
