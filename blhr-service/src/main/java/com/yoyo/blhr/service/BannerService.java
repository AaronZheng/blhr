package com.yoyo.blhr.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yoyo.blhr.dao.impl.BannerDao;

@Service("bannerService")
public class BannerService {
	
	@Autowired
	private BannerDao bannerDao;
	
	/**
	 * @param sort
	 * @param path
	 * @param link
	 */
	public void updateBannerInfo(int sort,String path,String link){
		bannerDao.updateBannerInfo(sort, path, link);
	}
	
	
	public List<Map<String,Object>> queryBannerInfo(){
		return bannerDao.queryBanner();
	}

	
	
	
	

}
