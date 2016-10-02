package com.yoyo.blhr.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yoyo.blhr.dao.impl.CommentDao;

/**
 * 
 * @author zcl
 *
 */
@Service
public class CommentService {
	
	
	@Autowired
	private CommentDao commentDao;
	
	
	/**
	 * 
	 * @param courseId
	 * @return
	 */
	public List<Map<String,Object>> queryCommentsByCourseId(String courseId){
		
		return commentDao.queryCommentsByCourseId(courseId);
	}
	
	
	/**
	 * 
	 * @param courseId
	 * @return
	 */
	public void saveComments(String comment_id,String content,String course_id,String user_id,Date lrrq,
			String yxbj){
		
		   commentDao.saveComments(comment_id, content, course_id, user_id, lrrq, yxbj);
	}
	
	
	

}
