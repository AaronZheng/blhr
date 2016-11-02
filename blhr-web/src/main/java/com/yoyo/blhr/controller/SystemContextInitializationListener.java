package com.yoyo.blhr.controller;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoader;

import com.yoyo.blhr.service.BeanUtils;
import com.yoyo.blhr.util.BlhrArgumentCache;
import com.yoyo.blhr.util.InitializationToken;

/**
 * @description initialization system configuration information  ... 
 * 
 * @author zcl
 *
 */
@Service
public class SystemContextInitializationListener implements ServletContextListener{

	@Autowired
	private ApplicationContext applicationContext;
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		BlhrArgumentCache.clearCache();
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		new InitializationToken();
		ApplicationContext act = ContextLoader.getCurrentWebApplicationContext();
		BeanUtils.applicationContext = act;
	}
	
	
	
	
	
	

}
