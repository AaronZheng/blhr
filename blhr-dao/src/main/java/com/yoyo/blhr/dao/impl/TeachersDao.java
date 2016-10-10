package com.yoyo.blhr.dao.impl;

import java.util.List;
import java.util.Map;

import com.yoyo.blhr.dao.model.Teachers;

public interface TeachersDao {

	/**
	 * 
	 * @return
	 */
	public List<Map<String, Object>> queryTeachers();
	
	/**
	 * 
	 * @param user_id
	 * @return
	 */
	public Map<String, Object> queryTeachersDetail(String user_id);

	/**
	 * 
	 * @param map
	 */
	public void changeTeacherState(Map<String, Object> map);
	
	/**
	 * 
	 * @param teacher
	 */
	public void newTeacher(Teachers teacher);
	
	/**
	 * 
	 * @param teacher
	 */
	public void updateTeacher(Teachers teacher);
	
	
	/**
	 * 
	 * @param teacherId
	 */
	public void deleteTeacherById(String teacherId);

	
	/**
	 * 
	 * @param startPage
	 * @param pageSize
	 * @return
	 */
	public List<Map<String, Object>> queryAllCoursesInfo(int startPage,int pageSize);
	
	
	/**
	 * 
	 * @param courseId
	 * @return
	 */
	public Map<String, Object> queryTeacherProfileByCourseId(String courseId);

	public int queryTeachersNum();


	
}
