package com.yoyo.blhr.dao.model;

import java.io.Serializable;

public class FavoriteCourseVo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3626520389811216084L;

	
	private String courseId;
	
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

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	private String courseName;
	
	private String teacherName;
	
	private String teacherId;
	
	private String photo;
}
