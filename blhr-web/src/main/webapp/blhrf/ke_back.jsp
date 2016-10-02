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
		<title>课程回放</title>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/blhrf/css/style.css" />
		<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/jquery-2.1.0.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/jquery.touchSlider.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/banner.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/script.js"></script>
		<!--[if (gte IE 6)&(lte IE 8)]>
  			<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/selectivizr.js"></script>
  			<noscript><link rel="stylesheet" href="<%=request.getContextPath() %>/blhrf/[fallback css]" /></noscript>
		<![endif]-->
	</head>

	<body style="background-color: #FFFFFF;">
		<div class="bodybox">
			<div class="zb_ban">
				<div class="main_visual">
					<div class="flicking_con">
						<a class="on" href="#"></a>
						<a href="#"></a>
						<a href="#"></a>
					</div>
					<div class="main_image">
						<ul>
							<li><span class="banimg" style="background-image: url(<%=request.getContextPath() %>/blhrf/img/baner.jpg);"></span>
							</li>
							<li><span class="banimg" style="background-image: url(<%=request.getContextPath() %>/blhrf/img/baner.jpg);"></span>
							</li>
							<li><span class="banimg" style="background-image: url(<%=request.getContextPath() %>/blhrf/img/baner.jpg);"></span>
							</li>
						</ul>
					</div>
				</div>
			</div>
			
			<div>
			<c:forEach items="${courseTitleList }" var="list">
			<div class="ke_back">
				<div class="ke_backlist">
					<div class="ke_backlist_top">
						<img src="<%=request.getContextPath() %>/blhrf/img/ke_tu.jpg"/>
						<img src="<%=request.getContextPath() %>/blhrf/img/ke_wen.jpg"/>
						<img src="<%=request.getContextPath() %>/blhrf/img/ke_ting.jpg"/>
						<h3><div onclick="window.open('<%=request.getContextPath() %>/openCourseProfile?userId=${userId}&courseId=${list.course_id}&courseName=${list.course_name}&teacherId=${list.teacherId}')"> ${list.course_name } </div></h3>
					</div>
					<div class="ke_backlist_mid">
						${list.jobName }
					</div>
					<div class="ke_backlist_bot">
						<div class="ke_tou">
							<img src="<%=request.getContextPath() %>/${list.photo }"/>
						</div>
						<div class="ke_yu" >
						    <a href="<%=request.getContextPath() %>/openBackCoursePanel?userId=${userId}&courseId=${list.course_id}&teacherId=${list.teacher_id}">回放课程</a>
						</div>
						<div class="ke_shu">
							${list.num }人学过
						</div>
					</div>
				</div>
			</div>
			 </c:forEach>
			</div>
		 </div>
			
			
			
			
			  <div class="xtfoot xtfootcol">
				<ul>
					<li  class="xt_dot">
						<a href="<%=request.getContextPath() %>/wechatlogin?userId=${userId}">回放课程</a>
					</li>
					<li>
						<a href="<%=request.getContextPath() %>/queryBroadCastCourse?userId=${userId}">直播课程</a>
					</li>
					<li>
						<a href="<%=request.getContextPath() %>/initMyClassInfo?userId=${userId}">我的课堂</a>
					</li>
				</ul>
			</div>
		</div>

	</body>

</html>