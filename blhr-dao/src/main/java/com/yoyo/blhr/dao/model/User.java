package com.yoyo.blhr.dao.model;

import java.io.Serializable;
import java.util.Date;


/**
 * 
 * @author zcl
 *
 */
public class User implements Serializable {

	private static final long serialVersionUID = -7485188081741945492L;
	
	private String userId;
	
	private String username;
	
	private String password;
	
	private String sex;
	
	private String photo;
	
	private String email;
	
	private String phone;
	
	private String category;
	
	private String wechatname;
	
	private String openid;
	
	private Date lrrq;
	
	private Date xgrq;
	
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getWechatname() {
		return wechatname;
	}

	public void setWechatname(String wechatname) {
		this.wechatname = wechatname;
	}

	public String getOpenid() {
		return openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
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

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
}
