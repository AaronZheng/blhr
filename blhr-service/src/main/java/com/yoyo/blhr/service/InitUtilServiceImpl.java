package com.yoyo.blhr.service;

public class InitUtilServiceImpl {

	public CourseManageService courseManageService;
	
	public UserManageService userManagerService;

	public TeachersService tms;
	
	
	

	public CourseManageService getCourseManageService() {
		return courseManageService;
	}

	public void setCourseManageService(CourseManageService courseManageService) {
		this.courseManageService = courseManageService;
		BeanUtils.courseManagerSerivce = this.courseManageService;
	}

	public UserManageService getUserManagerService() {
		return userManagerService;
	}

	public void setUserManagerService(UserManageService userManagerService) {
		this.userManagerService = userManagerService;
		BeanUtils.userManagerService = this.userManagerService;
	}

	public TeachersService getTms() {
		return tms;
	}

	public void setTms(TeachersService tms) {
		this.tms = tms;
		BeanUtils.tms = this.tms;
	}
	
	
	
}
