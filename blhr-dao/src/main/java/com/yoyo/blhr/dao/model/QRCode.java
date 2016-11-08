package com.yoyo.blhr.dao.model;

import java.io.Serializable;
import java.util.Date;

public class QRCode implements Serializable{
	
	
	private static final long serialVersionUID = 1L;
	
	private String companyId;
	private String companyName;
	private String companyQrcode;
	private Integer level;
	private Date lrrq;
	private Date xgrq;
	private String lrry;
	private String xgry;
	
	
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyQrcode() {
		return companyQrcode;
	}
	public void setCompanyQrcode(String companyQrcode) {
		this.companyQrcode = companyQrcode;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
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
	public String getLrry() {
		return lrry;
	}
	public void setLrry(String lrry) {
		this.lrry = lrry;
	}
	public String getXgry() {
		return xgry;
	}
	public void setXgry(String xgry) {
		this.xgry = xgry;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
