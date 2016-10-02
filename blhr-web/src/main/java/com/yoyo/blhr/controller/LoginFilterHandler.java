package com.yoyo.blhr.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

public class LoginFilterHandler implements Filter{
	
	List<String> ignores;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	    String str = filterConfig.getInitParameter("ignore");
	    this.ignores = Arrays.asList(StringUtils.split(str, ","));
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest)req;
	    String requestUrl = request.getServletPath();
	    if("/wechatlogin".equals(requestUrl)||requestUrl.endsWith(".js")||requestUrl.endsWith(".css")||requestUrl.endsWith(".jpg")||(requestUrl != null &&requestUrl.startsWith("/blhrf"))
	    		||requestUrl.endsWith(".png")||"/initLogin".equals(requestUrl)||"/validateLoginInfo".equals(requestUrl)){
	    	chain.doFilter(req, res);
	    	return;
	    }
	    if((this.ignores != null && this.ignores.contains(requestUrl))||request.getSession().getAttribute("backuserId") != null)
	    	chain.doFilter(req, res);
	    else{
	    	request.getRequestDispatcher("/initLogin").forward(req, res);
	    }

	    
		
		
		
		
		
		
	}

	@Override
	public void destroy() {
		
	}

}
