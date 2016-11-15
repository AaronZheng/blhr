package com.yoyo.blhr.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.yoyo.blhr.dao.impl.CoursesDao;
import com.yoyo.blhr.dao.model.CourseDetail;
import com.yoyo.blhr.dao.model.Courses;
import com.yoyo.blhr.dao.model.LearnRecords;
import com.yoyo.blhr.dao.model.User;

public interface CourseManageService {
	
	/**
	 * @description query all course information  ... 
	 * 
	 * @param startPage
	 * 
	 * @param pageSize
	 * 
	 * @return
	 */
	public List<Map<String,Object>> queryAllCourseInfo(int startPage,int pageSize);
	
	
	/**
	 * 
	 * @param courseState
	 * @return
	 */
	public List<Map<String,Object>> queryBroadcastCourse(int startPage,int pageSize,String courseType);
	
	
	/**
	 * @description update course and hide course for user ...
	 * @param course_id
	 */
	public void updateCourseState(String course_id);
	
	
	
	public CoursesDao getCoursesDao() ;


	public void setCoursesDao(CoursesDao coursesDao) ;


	/**
	 * @description query course detail information by course id ...
	 * @param page
	 * @param rows
	 * @param course_id
	 * @return
	 */
	public List<Map<String,Object>> queryCourseDetailInfo(Integer page,Integer rows,String course_id);
	
	
	/**
	 * 
	 * @param lismap
	 */
	public void updateCourseDetailByBath(List<Map<String,String>> lismap);
	
	/**
	 * 
	 * @param itemId
	 * @return
	 */
	public Map<String,Object> queryDetailByItemId(String itemId);
	
	/**
	 * 
	 * @param course_id
	 */
	public void deleteCourseById(String course_id);
	
	
	/**
	 * 
	 * @param course_id
	 */
	public void deleteCourseDetailByCourseId(String course_id);
	
	/**
	 * 
	 * @param itemId
	 */
	public void deleteCourseDetailByItemId(String itemId);
		
	
	
	/**
	 * 
	 * @param courseId
	 * @return
	 */
	public List<CourseDetail> queryAllCourseDetailBySort(String courseId);
	
	
	
	/**
	 * @description 查询课程详细 ...
	 * @param rowNum
	 * @param pageSize
	 * @param courseId
	 * @return
	 */
	public List<Map<String,Object>> queryCourseDetailByNum(int rowNum,int pageSize,String courseId);
		
	
	/**
	 * 
	 * @param courseId
	 * @return
	 */
	public Integer queryLearnNum(String courseId);
		
	
	
	/**
	 * 
	 * @param course
	 */
	public void saveCourseTitle(Courses course);
	
	
	/**
	 * 
	 * @param courseDetail
	 */
	public void saveCourseDetail(CourseDetail courseDetail);
		
	
	
	/**
	 * 
	 * @param type
	 * @return
	 */
	public List<Map<String,Object>> queryCourseByType(String type);
	
	
	/**
	 * 
	 * @param type
	 * @return
	 */
	public List<Map<String,Object>> queryBroadCastCourseByType();
		
	
	
	/**
	 * 
	 * @param userId
	 */
	public void updateCourseToEnd(String courseId,String courseState);
		
	
	
	/**
	 * 
	 * @param courseId
	 * @return
	 */
	public Map<String,Object> queryCourseById(String courseId);
		
	
	
	public Integer queryCourseDetailSize(String courseId);
	
	
	public void updateCourseById(String courseId,String courseName,String profile,
			String teacherId,String courseType,String payType);
		
	
	/**
	 * 
	 * @param courseId
	 * @return
	 */
	public List<Map<String,Object>> queryCourseDetailById(String courseId);
		
	
	
	/**
	 * 
	 * @param courseId
	 */
	public void saveLearnedCourse(LearnRecords learnRecord);
	
	
	
	public int queryWhetherLearn(String userId,String courseId);
	
	

	public List<Map<String, Object>> querySpCourseInfo(int startPage,int pageSize) ;


	public Map<String, Object> queryDspCourseByCourseId(String course_id) ;


	public void passDspCourse(String course_id) ;


	public int queryAllCourseNum() ;


	public int queryBroadcastCourseNum() ;


	public void updateCourseByIdAddWeight(String courseId, String courseName,
			String profile, String teacherId, String courseType,
			String payType, int weight) ;

	public int queryAllSpCourseNum();


	public List<User> queryFavUserBycourseId(String courseId);


	public Map<String, Object> queryBroadcastCourseById(String course_id);


	public void updateCourse(String courseId, String courseName,
			String profile, String teacherId, String courseType,
			String payType, Date date, int person);
	
}
