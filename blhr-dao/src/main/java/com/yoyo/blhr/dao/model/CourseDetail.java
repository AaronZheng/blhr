package com.yoyo.blhr.dao.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @author zcl
 *
 */
public class CourseDetail implements Serializable{

	private static final long serialVersionUID = 1794101068854136106L;
	
	private String courseDetailId;
	private String courseId;
	private String contentItem;
	private String contentType;
	private int itemLength;
	private Date lrrq;
	private Date xgrq;
	private String yxbj;
	
	public String getCourseDetailId() {
		return courseDetailId;
	}
	public void setCourseDetailId(String courseDetailId) {
		this.courseDetailId = courseDetailId;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getContentItem() {
		return contentItem;
	}
	public void setContentItem(String contentItem) {
		this.contentItem = contentItem;
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
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public int getItemLength() {
		return itemLength;
	}
	public void setItemLength(int itemLength) {
		this.itemLength = itemLength;
	}
	
}
