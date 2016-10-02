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
		<title>我的课堂</title>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/blhrf/css/style.css" />
		<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/jquery-2.1.0.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/script.js"></script>
		<!--[if (gte IE 6)&(lte IE 8)]>
  			<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/selectivizr.js"></script>
  			<noscript><link rel="stylesheet" href="<%=request.getContextPath() %>/blhrf/[fallback css]" /></noscript>
		<![endif]-->
	</head>

	<body style="background-color: #E8E8E8;">
		<div class="bodybox">
			<div class="ke_tgd ke_te_tgd">
				<ul>
					<li style="background-image: url(img/xt_4.png);">
						<span>我收藏的课程</span>
						<span>
							<input class="ke_tgdseaone" type="text" />
							<input class="ke_tgdseatwo" type="submit" value="" />
						</span>
					</li>
				</ul>
			</div>
			<div>
				<c:forEach var="favCourses" items="${favCourses}">
				
				<div class="ke_back ke_backoone">
					<div class="ke_backlist">
						<div class="ke_backlist_top">
							<img src="<%=request.getContextPath() %>/blhrf/img/ke_tu.jpg" />
							<img src="<%=request.getContextPath() %>/blhrf/img/ke_wen.jpg" />
							<img src="<%=request.getContextPath() %>/blhrf/img/ke_ting.jpg" />
							<h3><c:out value="${favCourses.courseName}"></c:out></h3>
						</div>
						<div class="ke_backlist_mid">
							<c:out value="${favCourses.teacherName}"></c:out>
						</div>
						<div class="ke_backlist_bot">
							<div class="ke_tou">
								<img src="<c:out value="${favCourses.photo}"></c:out>" />
							</div>
							<div class="ke_yu">
								回放课程
							</div>
							<div class="ke_shu">
								100人学过
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
		
		</div>

	</body>

</html>