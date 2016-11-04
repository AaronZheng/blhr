package com.yoyo.blhr.service;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yoyo.blhr.dao.impl.CoursesDao;
import com.yoyo.blhr.dao.impl.LearnedRecordsDao;
import com.yoyo.blhr.dao.impl.MemberDao;
import com.yoyo.blhr.dao.impl.MyFavoriteCourseDao;
import com.yoyo.blhr.dao.impl.TeachersDao;
import com.yoyo.blhr.dao.impl.UserInfoDao;
import com.yoyo.blhr.dao.model.FavoriteCourse;
import com.yoyo.blhr.dao.model.FavoriteCourseVo;
import com.yoyo.blhr.dao.model.LearnRecordsVo;
import com.yoyo.blhr.dao.model.Members;
import com.yoyo.blhr.dao.model.User;
import com.yoyo.blhr.util.BlhrArgumentCache;
import com.yoyo.blhr.util.CommonUtil;
import com.yoyo.blhr.util.SequenceUtil;

@Service("myClassroomService")
public class MyClassroomService {
	
	@Autowired(required=false)
	private UserInfoDao userInfoDao;
	@Autowired(required=false)
	private MemberDao memberDao;
	@Autowired(required=false)
	private MyFavoriteCourseDao myFavoriteCourse;
	@Autowired(required=false)
	private LearnedRecordsDao learnedCourseDao;
	@Autowired(required = false)
	private CoursesDao coursesDao;
	@Autowired(required = false)
	private TeachersDao teachersDao;
	
	
	
	/**
	 * @param userId
	 * @return
	 * @throws IOException 
	 */
	public Map<String,String> initMyClassRoom(String userId) throws IOException{
		
		User user = (User)BlhrArgumentCache.getCacheData(userId);
		if(user == null)
			user = userInfoDao.queryUserByUserId(userId);
		Members member = memberDao.queryMemberByCondition(userId);
		Map<String,String> map = new HashMap<String,String>();
		map.put("username", CommonUtil.getUserNameByUserId(userId));
        map.put("photo", user.getPhoto());
        map.put("category", user.getCategory());

		if(member == null){
			map.put("ismember", "1");
		}else{
			map.put("ismember", "2");
			long timestmp = member.getExpireTime().getTime() - new Date().getTime();
			if(timestmp <= 0){
				memberDao.deleteMemberByUserId(userId);
				map.put("ismember", "1");
			}else
				map.put("validateTime", ((timestmp/(1000*60*60*24))+(timestmp%(1000*60*60*24)>0?1:0))+" 天");
		}
			
		return map;
	}
	
	
	
	/**
	 * 
	 * @param userId
	 * @return
	 */
	public List<FavoriteCourseVo> queryUserFavoriteCourseById(String userId){
		return this.myFavoriteCourse.queryFavoriteCourseByUserId(userId);
	}
	
	
	/**
	 * @description 
	 * 
	 * @param userId
	 * 
	 * @return
	 */
	public List<LearnRecordsVo> queryLearnedCourseByUserId(String userId){
		
		return learnedCourseDao.queryUserHistoryRecodrs(userId);
	}
	
	
	/**
	 * 
	 * @param userId
	 * @return
	 */
	public List<Map<String, Object>> searchMyCourses(String userId) {
		List<Map<String, Object>> myCourses = this.coursesDao.searchMyCourses(userId);
		return myCourses;
	} 
	


	public void insertMyFavCourse(String userId, String courseId) {
		FavoriteCourse favCourse = new FavoriteCourse();
		favCourse.setCourse_id(courseId);
		favCourse.setFavorite_id(SequenceUtil.generateSequeueString());
		favCourse.setUser_id(userId);
		favCourse.setLrrq(new Date());
		favCourse.setYxbj("Y");
		this.myFavoriteCourse.insertMyFavCourse(favCourse);
	}

	public Map<String, Object> queryTeacherProfileByCourseId(String courseId) {
		Map<String, Object> teacherProfile = this.teachersDao.queryTeacherProfileByCourseId(courseId);
		return teacherProfile;
	}



	public Map<String, Object> queryCourseProfileByCourseId(String courseId) {
		Map<String, Object> courseProfile = this.coursesDao.queryCourseByCourseId(courseId);
		return courseProfile;
	}



	public List<Map<String, Object>> queryAllCoursesByTeacherId(String teacherId) {
		List<Map<String, Object>> allCourses = this.coursesDao.queryAllCoursesByTeacherId(teacherId);
		return allCourses;
	} 
	
	
	public boolean queryIsMyFavCourseByUserIdAndCourseId(String userId,
			String courseId) {
		List<Map<String, Object>> isExist = myFavoriteCourse.queryIsMyFavCourseByUserIdAndCourseId(userId,courseId);
		if(CollectionUtils.isNotEmpty(isExist))
			return false;
		return true;
	} 

	
	

}
