package com.yoyo.blhr.dao.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * 
 * @author zcl
 *
 */
public class FavoriteCourse implements Serializable{
	

	private static final long serialVersionUID = -2114695913715780897L;

	private String favorite_id;
	
	private String user_id;
	
	private String course_id;
	
	private Date lrrq;
	
	private Date xgrq;
	
	private String yxbj;

	public String getFavorite_id() {
		return favorite_id;
	}

	public void setFavorite_id(String favorite_id) {
		this.favorite_id = favorite_id;
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
	
}
