package com.yoyo.blhr.dao.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @author zcl
 *
 */
public class Members implements Serializable{
	
	private static final long serialVersionUID = 4880765522531310072L;
	
	private String userId;
	
	private String cycle;
	
	private Date chageTime;
	
	private Date expireTime;
	
	private String payType;
	
	private Date lrrq;
	
	private Date xgrq;
	
	private String yxbj;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCycle() {
		return cycle;
	}

	public void setCycle(String cycle) {
		this.cycle = cycle;
	}

	public Date getChageTime() {
		return chageTime;
	}

	public void setChageTime(Date chageTime) {
		this.chageTime = chageTime;
	}

	public Date getExpireTime() {
		return expireTime;
	}

	public void setExpireTime(Date expireTime) {
		this.expireTime = expireTime;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
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
