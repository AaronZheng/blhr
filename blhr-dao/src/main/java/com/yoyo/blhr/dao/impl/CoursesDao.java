package com.yoyo.blhr.dao.impl;

import java.util.List;
import java.util.Map;

import com.yoyo.blhr.dao.model.CourseDetail;
import com.yoyo.blhr.dao.model.Courses;
import com.yoyo.blhr.dao.model.LearnRecords;

/**
 * 
 * @author zcl
 *
 */
public interface CoursesDao {

	
	

	

	/**
	 * 
	 * @param course
	 */
	void saveCourseInfo(Courses course);
	
	/**
	 * 
	 * @param courseDetail
	 */
	void saveCourseDetail(CourseDetail courseDetail);
	
	/**
	 * 
	 * @param userId
	 * @return
	 */
	int queryCourseCountByTeacherId(String userId);
	
	/**
	 * @description query all course information by page ...
	 * @param startPage
	 * @param pageSize
	 * @return
	 */
	List<Map<String,Object>> queryAllCoursesInfo(Integer startPage,Integer pageSize);
	
	
	/**
	 * @description update course state ..
	 * 
	 * @param course_id
	 */
	void updateCourseState(String course_id);
	
	/**
	 * 
	 * @param course_state
	 * @return
	 */
	List<Map<String,Object>> queryBroadcastCourse(Integer startPage,Integer pageSize, String courseType);
	
	
	/**
	 * 
	 * @return
	 */
	List<Map<String,Object>> queryAllBroadcastCourse();
	
	
	
	/**
	 * @description query course detail information ...
	 * @param page
	 * @param rows
	 * @param course_id
	 * @return
	 */
	List<Map<String,Object>> queryCourseDetailInfo(Integer page,Integer rows,String course_id);
	
	
	/**
	 * 
	 * @param lismap
	 */
	void updateCourseDetailByBath(List<Map<String,String>> lismap);
	
	
	/**
	 * 
	 * @param course_id
	 */
	void deleteCourseById(String course_id);
	
	
	/**
	 * @param course_id
	 */
	void deleteCourseDetailByCourseId(String course_id);
	
	/**
	 * 
	 * @param itemId
	 */
	void deleteCourseDetailByItemId(String itemId);
	
	
	/**
	 * 
	 * @param courseId
	 * @return
	 */
	List<CourseDetail> queryAllCourseDetailBySort(String courseId);
	
	
	/**
	 * @description 查询课程详细...
	 * @param rowNum
	 * @param pageSize
	 * @param courseId
	 * @return
	 */
	 List<Map<String,Object>> queryCourseDetailByNum(int rowNum,int pageSize,String courseId);
	
	
	/**
	 * 
	 * @param courseId
	 * @return
	 */
	Integer queryLearnNum(String courseId);
	
	
	/**
	 * 
	 * @param course
	 */
	void saveCourseTitle(Courses course);
	
	/**
	 * 
	 * @param userId
	 * @return
	 */
	List<Map<String, Object>> searchMyCourses(String userId);
	
	
	/**
	 * 
	 * @param type
	 * @return
	 */
	List<Map<String,Object>> queryCourseByType(String type);
	
	/**
	 * 
	 * @param type
	 * @return
	 */
	List<Map<String,Object>> queryBroadCastCourseByType();
	
	
	/**
	 * 
	 * @param user_id
	 */
	void updateCourseToEnd(String course_id,String courseState);
	
	
	/**
	 * 
	 * @param courseId
	 * @return
	 */
	Map<String,Object> queryCourseById(String courseId);
	
	/**
	 * 
	 * @param courseId
	 * @return
	 */
	Integer queryCourseDetailSize(String courseId);
	
	
	/**
	 * 
	 * @param courseId
	 * @param courseNamem
	 * @param profile
	 * @param teacherId
	 * @param courseType
	 * @param payType
	 * @param weight 
	 */
	void updateCourseById(String courseId,String courseNamem,String profile,
			String teacherId,String courseType,String payType);
	
	
	/**
	 * 
	 * @param courseDetailId
	 * @return
	 */
	List<Map<String,Object>> queryCourseDetailById(String courseId);
	
	
	/**
	 * 
	 * @param learnRecord
	 */
	void saveLearnedCourse(LearnRecords learnRecord);
	
	/**
	 * @description 查询学习过的课程..
	 * @param userId
	 * @param courseId
	 * @return
	 */
	public int queryWhetherLearn(String userId,String courseId);
	
	/**
	 * 
	 * @param courseId
	 * @return
	 */
	Map<String, Object> queryCourseByCourseId(String courseId);

	/**
	 * 
	 * @param teacherId
	 * @return
	 */
	List<Map<String, Object>> queryAllCoursesByTeacherId(String teacherId);
	
	List<Map<String, Object>> querySpCoursesInfo(int startPage, int pageSize);

	Map<String, Object> queryDspCourseByCourseId(String course_id);

	void passCourse(String course_id);

	int queryAllCourseNum();

	int queryBroadcastCourseNum();

	void updateCourseByIdAddWeight(String courseId, String courseName,
			String profile, String teacherId, String courseType,
			String payType, int weight);
	
	
	Map<String,Object> queryDetailByItemId(String itemId);
	
	public int queryAllSpCourseNum();
	

}
