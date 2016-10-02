package com.yoyo.blhr.dao.impl;

import java.util.List;
import com.yoyo.blhr.dao.model.LearnRecordsVo;

/**
 * 
 * @author zcl
 *
 */
public interface LearnedRecordsDao {
	
	/**
	 * 
	 * @description query the information that user have learned in the history ...
	 * 
	 * @param userId
	 * 
	 * @return
	 */
	public List<LearnRecordsVo> queryUserHistoryRecodrs(String userId);
	
	
	/**
	 * zm
	 * @param userId
	 * @return
	 */
	public Object queryRecodrsCount(String userId);

}
