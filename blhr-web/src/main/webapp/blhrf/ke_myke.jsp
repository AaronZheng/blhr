<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="utf-8" />
		<meta name="Keywords" content="" />
		<meta name="Description" content="" />
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>我的课程</title>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/blhrf/css/style.css" />
		<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/jquery-2.1.0.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/script.js"></script>
		<!--[if (gte IE 6)&(lte IE 8)]>
  			<script type="text/javascript" src="js/selectivizr.js"></script>
  			<noscript><link rel="stylesheet" href="[fallback css]" /></noscript>
		<![endif]-->
	</head>

	<body style="background-color: #FFFFFF;">
		<div class="bodybox">
			<div class="ke_wod">
				<span class="ke_wod_ace">未发布</span>
				<span>已发布</span>
			</div>
			<div>
				<div class="ke_wodconn">
					<c:forEach var="wfbCourses" items="${wfbCourses}">
					<div class="ke_wodconn_list">
					
						<div class="ke_wodconn_top">
							<span>
								<img src="<%=request.getContextPath() %>/blhrf/img/ke_tu.jpg"/>
								<img src="<%=request.getContextPath() %>/blhrf/img/ke_wen.jpg"/>
								<img src="<%=request.getContextPath() %>/blhrf/img/ke_ting.jpg"/>
							</span>
							<h3>
								<c:out value="${wfbCourses.courseName}"></c:out>
							</h3>
						</div>
						<div class="ke_wodconn_bot">
							<span><c:out value="${wfbCourses.lrrq}"></c:out></span>
							<div class="ke_wodconn_botrrr">
								<a class="jxlr" href="ke_kelr.html" >继续录入</a>
							</div>
						</div>
						
					</div>
				
					</c:forEach>
				</div>
				
				<div class="ke_wodconn">
				<c:forEach var="yfbCourses" items="${yfbCourses}">
					<div class="ke_wodconn_list">
						<div class="ke_wodconn_top">
							<span>
								<img src="<%=request.getContextPath() %>/blhrf/img/ke_tu.jpg"/>
								<img src="<%=request.getContextPath() %>/blhrf/img/ke_wen.jpg"/>
								<img src="<%=request.getContextPath() %>/blhrf/img/ke_ting.jpg"/>
							</span>
							<h3>
								<c:out value="${yfbCourses.courseName}"></c:out>
							</h3>
						</div>
						<div class="ke_wodconn_bot">
							<span><c:out value="${yfbCourses.lrrq}"></c:out></span>
							<div class="ke_wodconn_botrrr">
								<a class="ckke" href="<%=request.getContextPath() %>/openCourseDetail?userId=${userId}&courseId=${yfbCourses.courseId}">查看课程</a>
							</div>
						</div>
					</div>
					</c:forEach>
					
					
				</div>
			</div>
		</div>
		
	</body>
</html>