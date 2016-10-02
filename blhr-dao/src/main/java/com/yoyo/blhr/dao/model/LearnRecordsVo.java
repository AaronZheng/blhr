package com.yoyo.blhr.dao.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @author zcl
 *
 */
public class LearnRecordsVo implements Serializable{
	
	private static final long serialVersionUID = 338956853474445653L;

	private String courseId;
	
	private String courseName;
	
	private String teacherName;
	
	private String teacherId;
	
	private Date learnTime;
	
	private String photo;

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

	public Date getLearnTime() {
		return learnTime;
	}

	public void setLearnTime(Date learnTime) {
		this.learnTime = learnTime;
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
	
}
