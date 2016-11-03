package com.yoyo.blhr.controller;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.yoyo.blhr.util.BlhrArgumentCache;
import com.yoyo.blhr.util.InitializationToken;

/**
 * @description initialization system configuration information  ... 
 * 
 * @author zcl
 *
 */
public class SystemContextInitializationListener implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		BlhrArgumentCache.clearCache();
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		new InitializationToken();
	}
	
	
	
	
	
	

}
