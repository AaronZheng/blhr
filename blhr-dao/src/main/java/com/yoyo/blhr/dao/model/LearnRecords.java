package com.yoyo.blhr.dao.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @author zcl
 *
 */
public class LearnRecords implements Serializable{

	private static final long serialVersionUID = -3839442790360102074L;
	private String recordsId;
	private String user_id;
	private String course_id;
	private Date learn_time;
	private Date lrrq;
	private Date xgrq;
	
	public String getRecordsId() {
		return recordsId;
	}
	public void setRecordsId(String recordsId) {
		this.recordsId = recordsId;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCourse_id() {
		return course_id;
	}
	public void setCourse_id(String course_id) {
		this.course_id = course_id;
	}
	public Date getLearn_time() {
		return learn_time;
	}
	public void setLearn_time(Date learn_time) {
		this.learn_time = learn_time;
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

}
