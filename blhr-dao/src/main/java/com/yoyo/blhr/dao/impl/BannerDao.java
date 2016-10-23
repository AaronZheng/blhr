package com.yoyo.blhr.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

@Resource(name="bannerDao")
public interface BannerDao {

	public List<Map<String, Object>> queryBanner();
	
	/**
	 * @param sort
	 * @param path
	 * @param link
	 */
	void updateBannerInfo(int sort,String path,String link);
	
}
