package com.yoyo.blhr.dao.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;


/**
 * 
 * @author zcl
 *
 */
public interface CommentDao {
	
	
	/**
	 * 
	 * @param courseId
	 * @return
	 */
	List<Map<String,Object>> queryCommentsByCourseId(String courseId);
	
	
	/**
	 * 
	 * @param comment_id
	 * @param content
	 * @param course_id
	 * @param user_id
	 * @param lrrq
	 * @param yxbj
	 */
	void saveComments(String comment_id,String content,String course_id,String user_id,Date lrrq,String yxbj);

}
