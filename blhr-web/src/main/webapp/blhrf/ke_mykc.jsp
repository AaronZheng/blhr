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
		<title>制作课程</title>
		<link rel="stylesheet"href="<%=request.getContextPath() %>/blhrf/css/style.css" />
		<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/jquery-2.1.0.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/script.js"></script>
		<!--[if (gte IE 6)&(lte IE 8)]>
  			<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/selectivizr.js"></script>
  			<noscript><link rel="stylesheet"href="<%=request.getContextPath() %>/blhrf/[fallback css]" /></noscript>
		<![endif]-->
	</head>

	<body style="background-color: #E8E8E8;">
		<div class="bodybox">
			<div style="background-image: url(<%=request.getContextPath() %>/blhrf/img/xt_bg.png);" class="xthead">
				<img src="<%=request.getContextPath() %>/blhrf/img/xt_head.png" />
				<span>${username }</span>
			</div>
			<div class="mycount">
				<ul>
					<a href="<%=request.getContextPath() %>/searchMyCourses?userId=${userId}">
						<li style="background-image: url(<%=request.getContextPath() %>/blhrf/img/ke_kc.jpg);">
							<div>
							<span>我的课程</span>
							<span>
							<img src="<%=request.getContextPath() %>/blhrf/img/xt_jt.png"/>
						</span>
						</div>
						</li>
					</a>
				</ul>
			</div>
			<div class="ke_lr">
				<a style="background-image: url(<%=request.getContextPath() %>/blhrf/img/kc_vd.png);"href="<%=request.getContextPath() %>/gotoLrKc?userId=${userId}">录入回放课程</a>
				<a style="background-image: url(<%=request.getContextPath() %>/blhrf/img/kc_zb.png);"href="<%=request.getContextPath() %>/gotoZbKc?userId=${userId}">创建直播预告</a>
			</div>
	</div>
	</body>

</html>