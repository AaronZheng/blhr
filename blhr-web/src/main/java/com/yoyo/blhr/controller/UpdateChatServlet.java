package com.yoyo.blhr.controller;

import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.JSONObject;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;

import com.yoyo.blhr.service.CourseManageService;

/**
 * 
 * @author zcl
 *
 */
@Controller
public class UpdateChatServlet extends HttpServlet implements ApplicationContextAware{

	private String filePath;
	@Autowired
	private static ApplicationContext applicationContext;

	private static final long serialVersionUID = 8715087482553916163L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		super.doGet(req, resp);
	}
	
	

	@Override
	public void init(ServletConfig config) throws ServletException {
		
		this.filePath = config.getInitParameter("filePath");
		super.init(config);
	}



	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		
			req.setCharacterEncoding("utf-8");
			resp.setContentType("text/html;charset=utf-8");
			// 为解析类提供配置信息
			DiskFileItemFactory factory = new DiskFileItemFactory();
			// 创建解析类的实例
			ServletFileUpload sfu = new ServletFileUpload(factory);
			// 开始解析
			sfu.setFileSizeMax(1024 * 1024* 6);
			// 每个表单域中数据会封装到一个对应的FileItem对象上
			List<FileItem> items = null;
			try {
				items = sfu.parseRequest(req);
			} catch (FileUploadException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			// 区分表单域
			String fileName = null; 
			Map<String,String> map = new HashMap<String,String>();
			for (int i = 0; i < items.size(); i++) {
				FileItem item = items.get(i);
				if (!item.isFormField()) {
					String path = filePath+File.separator+"upload"+File.separator+new SimpleDateFormat("yyyyMMdd").format(new Date());
					if(!new File(path).exists())
						new File(path).mkdirs();
					fileName = item.getName();
					fileName = System.currentTimeMillis()+fileName.substring(fileName.lastIndexOf("."));
					File file = new File(path + File.separator + fileName);
					path = file.getPath();
					if (!file.exists()) {
						try {
							item.write(file);
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}else{
					map.put(item.getFieldName(), item.getString("UTF-8"));
				}
			}
			try {
				String rtns = updateCourseDetail(map,fileName);
				resp.setContentType("application/json");
				resp.getOutputStream().write(rtns.getBytes("UTF-8"));
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
	}
	
	
	/**
	 * 
	 * @param map
	 * @param fileName
	 * @return
	 * @throws NoSuchAlgorithmException
	 */
	public String updateCourseDetail(Map<String,String> map,String fileName) throws NoSuchAlgorithmException{
		
	    Map<String,String> updateItem = new HashMap<String,String>();
	    updateItem.put("course_detail_id", map.get("itemId"));
	    updateItem.put("content_item", "/upload"+File.separator+new SimpleDateFormat("yyyyMMdd").format(new Date())+File.separator+fileName);
	    List<Map<String,String>> lismap = new ArrayList<Map<String,String>>();
	    lismap.add(updateItem);
	    CourseManageService userManageService = (CourseManageService) applicationContext.getBean("courseManageService");
	    userManageService.updateCourseDetailByBath(lismap);
	    Map<String,String> rtnmap = new HashMap<String,String>();
	    rtnmap.put("detailId", map.get("itemId"));
	    rtnmap.put("sourcePath","/upload"+File.separator+new SimpleDateFormat("yyyyMMdd").format(new Date())+File.separator+fileName);
	    return new JSONObject(rtnmap).toString();
	}



	@Override
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		UpdateChatServlet.applicationContext = applicationContext;
	}

}
