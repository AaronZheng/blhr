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
import org.jaudiotagger.audio.AudioFileIO;
import org.jaudiotagger.audio.mp3.MP3AudioHeader;
import org.jaudiotagger.audio.mp3.MP3File;
import org.json.JSONObject;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;

import com.yoyo.blhr.dao.model.CourseDetail;
import com.yoyo.blhr.service.CourseManageService;
import com.yoyo.blhr.util.SequenceUtil;

/**
 * 
 * @author zcl
 *
 */
@Controller
public class ChatServlet extends HttpServlet implements ApplicationContextAware{

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
			int itemLength = 0;
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
					fileName = System.currentTimeMillis()+fileName.substring(fileName.lastIndexOf("."));
					File file = new File(path + File.separator + fileName);
					path = file.getPath();
					if (!file.exists()) {
						try {
							item.write(file);
						} catch (Exception e) {
							e.printStackTrace();	
							resp.setContentType("application/json");
							resp.getOutputStream().write("0".getBytes());
							return ;
						}
						// 将上传图片的名字记录到数据库中

					}
					
			        MP3File f;
					try {
						if(file != null && file.getName().endsWith(".mp3")){
							f = (MP3File) AudioFileIO.read(file);
							MP3AudioHeader audioHeader = (MP3AudioHeader)f.getAudioHeader();  
							itemLength = audioHeader.getTrackLength();
						}
					} catch (Throwable e) {
						e.printStackTrace();
						resp.setContentType("application/json");
						resp.getOutputStream().write("0".getBytes());
						return ;
					}  
					
				}else{
					map.put(item.getFieldName(), item.getString("UTF-8"));
				}
			}
			try {
				if(itemLength == 0 || fileName == null){
					resp.getOutputStream().write("-1".getBytes());
					return ;
				}
				String rtns = saveCourseDetail(map,fileName,itemLength);
				resp.setContentType("application/json");
				resp.getOutputStream().write(rtns.getBytes("UTF-8"));
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
				resp.setContentType("application/json");
				resp.getOutputStream().write("0".getBytes());
			}
	}
	
	
	/**
	 * 
	 * @param map
	 * @param fileName
	 * @return
	 * @throws NoSuchAlgorithmException
	 */
	public String saveCourseDetail(Map<String,String> map,String fileName,int itemLength) throws NoSuchAlgorithmException{
		
	    CourseDetail courseDetail = new CourseDetail();
	    courseDetail.setCourseDetailId(SequenceUtil.generateSequeueString());
	    courseDetail.setContentType(map.get("courseType"));
	    if("v".equals(map.get("courseType")))
	    	courseDetail.setItemLength(itemLength);
	    courseDetail.setLrrq(new Date());
	    courseDetail.setCourseId(map.get("courseId"));
	    courseDetail.setContentItem("/upload"+File.separator+new SimpleDateFormat("yyyyMMdd").format(new Date())+File.separator+fileName);
	    CourseManageService userManageService = (CourseManageService) applicationContext.getBean("courseManageService");
	    userManageService.saveCourseDetail(courseDetail);
	    Map<String,String> rtnmap = new HashMap<String,String>();
	    rtnmap.put("detailId", courseDetail.getCourseDetailId());
	    rtnmap.put("sourcePath", courseDetail.getContentItem());
	    rtnmap.put("voiceLength", itemLength+"");
	    return new JSONObject(rtnmap).toString();
	}



	@Override
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		ChatServlet.applicationContext = applicationContext;
	}

}
