package com.yoyo.blhr.dao.impl;

import java.util.List;

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

	

}
