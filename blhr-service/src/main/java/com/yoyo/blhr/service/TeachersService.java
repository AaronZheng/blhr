package com.yoyo.blhr.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yoyo.blhr.dao.impl.CoursesDao;
import com.yoyo.blhr.dao.impl.TeachersDao;
import com.yoyo.blhr.dao.model.Teachers;

@Service("teachersService")
public class TeachersService {
	
	@Autowired(required = false)
	private TeachersDao teachersDao;
	@Autowired(required = false)
	private CoursesDao coursesDao;
	
	/**
	 * 讲师
	 * @return
	 */
	public List<Map<String, Object>> queryTeachers(){
		List<Map<String, Object>> teachers = this.teachersDao.queryTeachers();
		return teachers;
	}
	
	public void  saveTeacherInfo(Teachers teacher){
		
		
	}
	
	

	/**
	 * 
	 * @param userId
	 * @return
	 */
	public int queryCourseCountByTeacherId(String userId) {
		int courseCount = this.coursesDao.queryCourseCountByTeacherId(userId);
		return courseCount;
	}
	
	/**
	 * 
	 * @param userId
	 * @return
	 */
	public Map<String, Object> queryTeacherDetail(String userId) {
		Map<String, Object> teacherDetail = this.teachersDao.queryTeachersDetail(userId);
		return teacherDetail;
	}

	/**
	 * 
	 * @param state
	 * @param userId
	 */
	public void changeTeacherState(String state, String userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("state", state);
		map.put("userId", userId);
		this.teachersDao.changeTeacherState(map);
	} 
	
	/**
	 * 
	 * @param teacher
	 */
	public void newTeacher(Teachers teacher) {
		this.teachersDao.newTeacher(teacher);
	} 
	
	/**
	 * 
	 * @param teacher
	 */
	public void updateTeacher(Teachers teacher){
		this.teachersDao.updateTeacher(teacher);
	}
	

	/**
	 * 
	 * @param teacherId
	 */
	public void deleteTeacherById(String teacherId) {
		teachersDao.deleteTeacherById(teacherId);
	}

	
	/**
	 * 
	 * @param startPage
	 * @param pageSize
	 * @return
	 */
	public List<Map<String, Object>> queryAllTeachersInfo(int startPage, int pageSize) {
		return teachersDao.queryAllCoursesInfo(startPage, pageSize);
	}

	public int queryTeachersNum() {
		return this.teachersDao.queryTeachersNum();
	}

	
}
