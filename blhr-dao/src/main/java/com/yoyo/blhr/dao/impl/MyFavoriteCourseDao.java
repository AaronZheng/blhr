package com.yoyo.blhr.dao.impl;

import java.util.List;
import java.util.Map;

import com.yoyo.blhr.dao.model.FavoriteCourse;
import com.yoyo.blhr.dao.model.FavoriteCourseVo;
import com.yoyo.blhr.dao.model.User;


/**
 * 
 * @author zcl
 *
 */
public interface MyFavoriteCourseDao {
	
	/**
	 * 
	 * @param userId
	 * @return
	 */
	public List<FavoriteCourseVo> queryFavoriteCourseByUserId(String userId);
	
	/**
	 * 
	 * @param favCourse
	 */
	public void insertMyFavCourse(FavoriteCourse favCourse);
	
	/**
	 * 
	 * @param userId
	 * @param courseId
	 * @return
	 */
	public List<Map<String, Object>> queryIsMyFavCourseByUserIdAndCourseId(
			String userId, String courseId);

	public List<User> queryFavUserBycourseId(String courseId);


}
