package com.yoyo.blhr.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
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
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import com.yoyo.blhr.service.BannerService;

@Controller
public class WBannerServlet extends HttpServlet implements ApplicationContextAware{

	private static final long serialVersionUID = -782531569218633779L;
	
	@Autowired
	private static ApplicationContext applicationContext;
	
	private String filePath;

	@Override
	public void init(ServletConfig config) throws ServletException {
		this.filePath = config.getInitParameter("filePath");
		super.init(config);
	}
	
	


	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}





	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
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
				String path = filePath+File.separator+"upload"+File.separator+"banner"+File.separator+new SimpleDateFormat("yyyyMMdd").format(new Date());
				if(!new File(path).exists())
					new File(path).mkdirs();
				fileName = item.getName();
				if(StringUtils.isBlank(fileName))
					continue;
				fileName = System.currentTimeMillis()+fileName.substring(fileName.lastIndexOf("."));
				File file = new File(path + File.separator + fileName);
				path = file.getPath();
				if(!file.getParentFile().exists())
					file.getParentFile().mkdirs();
				if (!file.exists()) {
					try {
						item.write(file);
					} catch (Exception e) {
						resp.getOutputStream().write("0".getBytes());
						e.printStackTrace();
					}
				}
			}else{
				map.put(item.getFieldName(), item.getString("UTF-8"));
			}
		}
		String rtns = updateBannerHandler(map,fileName);
		resp.setContentType("application/json");
		resp.getOutputStream().write(rtns.getBytes("UTF-8"));
	
	}





	private String updateBannerHandler(Map<String, String> map, String fileName) {
		try{
			if(map == null || map.isEmpty() || (StringUtils.isBlank(map.get("link"))&&StringUtils.isBlank(map.get("photoPath")))){
				return "1";
			}
			BannerService bannerService = (BannerService) applicationContext.getBean("bannerService");
			String link = StringUtils.isBlank(map.get("link"))?null:map.get("link");
			if(StringUtils.isNotBlank(fileName)){
				fileName = "upload"+File.separator+"banner"+File.separator+new SimpleDateFormat("yyyyMMdd").format(new Date())+File.separator+fileName;
			}
			bannerService.updateBannerInfo(Integer.parseInt(map.get("photoId")),fileName,link);
			return "1";
		}catch(Exception e){
			e.printStackTrace();
			return "2";
		}
	}
	
	

	@Override
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		WBannerServlet.applicationContext = applicationContext;
	}

}
