package com.yoyo.blhr.service;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yoyo.blhr.dao.impl.CoursesDao;
import com.yoyo.blhr.dao.model.CourseDetail;
import com.yoyo.blhr.dao.model.Courses;
import com.yoyo.blhr.dao.model.LearnRecords;

@Service("courseManageService")
public class CourseManageService {
	
	@Autowired(required=false)
	private CoursesDao coursesDao;
	
	static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	
	/**
	 * @description query all course information  ... 
	 * 
	 * @param startPage
	 * 
	 * @param pageSize
	 * 
	 * @return
	 */
	public List<Map<String,Object>> queryAllCourseInfo(int startPage,int pageSize){
		
		return coursesDao.queryAllCoursesInfo(startPage, pageSize);
	}
	
	
	/**
	 * 
	 * @param courseState
	 * @return
	 */
	public List<Map<String,Object>> queryBroadcastCourse(int startPage,int pageSize,String courseType){
	
		return this.coursesDao.queryBroadcastCourse(startPage, pageSize, courseType);
	}
	
	
	
	/**
	 * @description update course and hide course for user ...
	 * @param course_id
	 */
	public void updateCourseState(String course_id){
		
		coursesDao.updateCourseState(course_id);
	}
	
	
	/**
	 * @description query course detail information by course id ...
	 * @param page
	 * @param rows
	 * @param course_id
	 * @return
	 */
	public List<Map<String,Object>> queryCourseDetailInfo(Integer page,Integer rows,String course_id){
		
		return coursesDao.queryCourseDetailInfo(page,rows,course_id);
	}
	
	
	/**
	 * 
	 * @param lismap
	 */
	public void updateCourseDetailByBath(List<Map<String,String>> lismap){
		
		coursesDao.updateCourseDetailByBath(lismap);
	}
	
	
	/**
	 * 
	 * @param course_id
	 */
	public void deleteCourseById(String course_id){
		
		coursesDao.deleteCourseById(course_id);
	}
	
	
	/**
	 * 
	 * @param course_id
	 */
	public void deleteCourseDetailByCourseId(String course_id){
		coursesDao.deleteCourseDetailByCourseId(course_id);
	}
	
	/**
	 * 
	 * @param itemId
	 */
	public void deleteCourseDetailByItemId(String itemId){
		
		coursesDao.deleteCourseDetailByItemId(itemId);
	}
	
	
	/**
	 * 
	 * @param courseId
	 * @return
	 */
	public List<CourseDetail> queryAllCourseDetailBySort(String courseId){
		
		return coursesDao.queryAllCourseDetailBySort(courseId);
	}
	
	
	/**
	 * @description 查询课程详细 ...
	 * @param rowNum
	 * @param pageSize
	 * @param courseId
	 * @return
	 */
	public List<Map<String,Object>> queryCourseDetailByNum(int rowNum,int pageSize,String courseId){
		
		return coursesDao.queryCourseDetailByNum(rowNum, pageSize, courseId);
	}
	
	/**
	 * 
	 * @param courseId
	 * @return
	 */
	public Integer queryLearnNum(String courseId){
		
		return this.coursesDao.queryLearnNum(courseId);
	}
	
	
	/**
	 * 
	 * @param course
	 */
	public void saveCourseTitle(Courses course){
	
		this.coursesDao.saveCourseTitle(course);
	}
	
	
	/**
	 * 
	 * @param courseDetail
	 */
	public void saveCourseDetail(CourseDetail courseDetail){
		
		this.coursesDao.saveCourseDetail(courseDetail);
	}
	
	
	/**
	 * 
	 * @param type
	 * @return
	 */
	public List<Map<String,Object>> queryCourseByType(String type){
	
		return this.coursesDao.queryCourseByType(type);
	}
	
	
	/**
	 * 
	 * @param userId
	 */
	public void updateCourseToEnd(String courseId,String courseState){
		
		this.coursesDao.updateCourseToEnd(courseId,courseState);
	}
	
	
	/**
	 * 
	 * @param courseId
	 * @return
	 */
	public Map<String,Object> queryCourseById(String courseId){
		
		return this.coursesDao.queryCourseById(courseId);
	}
	
	
	public void updateCourseById(String courseId,String courseName,String profile,
			String teacherId,String courseType,String payType){
		
		 this.coursesDao.updateCourseById(courseId,courseName,profile,teacherId,courseType,payType);
	}
	
	
	/**
	 * 
	 * @param courseId
	 * @return
	 */
	public List<Map<String,Object>> queryCourseDetailById(String courseId){
		
		return this.coursesDao.queryCourseDetailById(courseId);
	}
	
	
	/**
	 * 
	 * @param courseId
	 */
	public void saveLearnedCourse(LearnRecords learnRecord){
	
		this.coursesDao.saveLearnedCourse(learnRecord);
	}
	
	
	public int queryWhetherLearn(String userId,String courseId){
	
		return this.coursesDao.queryWhetherLearn(userId, courseId);
	}
	

	public List<Map<String, Object>> querySpCourseInfo(int startPage,int pageSize) {
		List<Map<String, Object>> dspCourses = coursesDao.querySpCoursesInfo(startPage, pageSize);
		for(Map<String, Object> map : dspCourses){
			map.put("create_time", sdf.format(map.get("create_time")));
		}
		return dspCourses;
	}


	public Map<String, Object> queryDspCourseByCourseId(String course_id) {
		Map<String,Object> course = this.coursesDao.queryDspCourseByCourseId(course_id);
		course.put("create_time", sdf.format(course.get("create_time")));
		return course;
	}


	public void passDspCourse(String course_id) {
		coursesDao.passCourse(course_id);
		
	}


	public int queryAllCourseNum() {
		return coursesDao.queryAllCourseNum();
	}


	public int queryBroadcastCourseNum() {
		return coursesDao.queryBroadcastCourseNum();
	}
	
}
