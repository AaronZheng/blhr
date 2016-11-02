package com.yoyo.blhr.dao.impl;

import java.util.List;
import java.util.Map;

import com.yoyo.blhr.dao.model.FavoriteCourse;
import com.yoyo.blhr.dao.model.FavoriteCourseVo;


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

	public List<Map<String, Object>> queryIsMyFavCourseByUserIdAndCourseId(
			String userId, String courseId);

	

}
