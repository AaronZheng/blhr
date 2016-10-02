package com.yoyo.blhr.dao.model;

import java.io.Serializable;

/**
 * 
 * @description 教程Title信息  ... 
 * 
 * @author zcl
 *
 */
public class CourseTitleVo implements Serializable{
	
	private static final long serialVersionUID = -5827537677546522177L;

	private String courseId;
	
	private String courseName;
	
	private String teacher;
	
	private String photo;
	
	private String teacherProfile;
	
	private String courseState;

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getTeacher() {
		return teacher;
	}

	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getTeacherProfile() {
		return teacherProfile;
	}

	public void setTeacherProfile(String teacherProfile) {
		this.teacherProfile = teacherProfile;
	}

	public String getCourseState() {
		return courseState;
	}

	public void setCourseState(String courseState) {
		this.courseState = courseState;
	}

	public String getCourseId() {
		return courseId;
	}

	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}

}
