package com.yoyo.blhr.controller;

import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
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
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import com.yoyo.blhr.dao.model.Teachers;
import com.yoyo.blhr.dao.model.User;
import com.yoyo.blhr.service.BeanUtils;
import com.yoyo.blhr.service.TeachersService;
import com.yoyo.blhr.service.UserManageService;
import com.yoyo.blhr.util.BlhrArgumentCache;
import com.yoyo.blhr.util.SequenceUtil;

/**
 * 
 * @author zcl
 *
 */
@Controller
public class UploadTeacherServlet extends HttpServlet implements ApplicationContextAware{

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
			sfu.setFileSizeMax(1024 * 100);
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
				// isFormField为true，表示这不是文件上传表单域
				if (!item.isFormField()) {
					// 获得存放文件的物理路径
					// upload下的某个文件夹 得到当前在线的用户 找到对应的文件夹

					String path = filePath+File.separator+"upload"+File.separator+new SimpleDateFormat("yyyyMMdd").format(new Date());
					if(!new File(path).exists())
						new File(path).mkdirs();
					// 获得文件名
					fileName = item.getName();
					// 该方法在某些平台(操作系统),会返回路径+文件名
					if(StringUtils.isBlank(fileName))
						continue;
					fileName = System.currentTimeMillis()+fileName.substring(fileName.lastIndexOf("."));
					File file = new File(path + File.separator + fileName);
					path = file.getPath();
					if (!file.exists()) {
						try {
							item.write(file);
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						// 将上传图片的名字记录到数据库中

					}
				}else{
					map.put(item.getFieldName(), item.getString("UTF-8"));
				}
			}
			try {
				saveTeacher(map,fileName);
				req.getRequestDispatcher("/blhrb/userManage.jsp").forward(req, resp);
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
	}
	
	public void saveTeacher(Map<String,String> map,String fileName) throws NoSuchAlgorithmException{
		
		String userId  = map.get("userId");
		String username = map.get("username");
		String type = map.get("type");
		String fullname = map.get("fullname");
		String profile = map.get("profile");
		String jobName = map.get("jobName");
		String idCard = map.get("idCard");
		String teacherName = map.get("teacherName");
		String teacherPassword = null;
		if(StringUtils.isNotEmpty(map.get("teacherPassword")))
			teacherPassword =SequenceUtil.generateMd5EncryptString(map.get("teacherPassword"));
		Teachers teacher = new Teachers();
		teacher.setUserId(userId);
		teacher.setUsername(username);
		teacher.setFullname(fullname);
		teacher.setJobName(jobName);
		teacher.setIdCard(idCard);
		teacher.setProfile(profile);
		teacher.setApplicationTime(new Date());
		teacher.setYxbj("Y");
		teacher.setState("2");
		UserManageService userManageService = BeanUtils.userManagerService;
		TeachersService teachersService = BeanUtils.tms;
		if("1".equals(type)){
			teachersService.newTeacher(teacher);
			//更新用户状态category=2
			userManageService.updateUserToTeacher(userId,"/upload"+File.separator+new SimpleDateFormat("yyyyMMdd").format(new Date())+File.separator+fileName,teacherName,teacherPassword);
			User user = ((User)BlhrArgumentCache.getCacheData(userId));
			if(user == null)
				user = userManageService.queryUserById(userId);
			//TODO 判空
			user.setCategory("2");
			user.setPhoto("/upload"+File.separator+fileName);
		}else if("2".equals(type)){
			teachersService.updateTeacher(teacher);
			userManageService.updateUserToTeacher(userId,StringUtils.isEmpty(fileName)?null:("/upload"+File.separator+new SimpleDateFormat("yyyyMMdd").format(new Date())+File.separator+fileName),teacherName,teacherPassword);
		}
		 
	}



	@Override
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		UploadTeacherServlet.applicationContext = applicationContext;
	}

}
