<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="Keywords" content="" />
		<meta name="Description" content="" />
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>直播课程</title>
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
			<div class="pay_shouone">
				<div class="pay_shouonebox">
					<h3>你需要先加入会员，才能学习课程！</h3>
					<div class="paffu_zt">
						<a style="margin: auto;float: inherit;" class="pay_fu" href="<%=request.getContextPath() %>/blhrf/">立即加入</a>
					</div>
				</div>
			</div>
			<div class="zb_ban">
				<div class="main_visual">
					<div class="flicking_con">
						<a class="on" href="<%=request.getContextPath() %>/blhrf/#"></a>
						<a href="<%=request.getContextPath() %>/blhrf/#"></a>
						<a href="<%=request.getContextPath() %>/blhrf/#"></a>
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
			<div class="zb_list">
				<div class="ke_backlist">
					<div class="ke_backlist_top">
						<img src="<%=request.getContextPath() %>/blhrf/img/ke_tu.jpg" />
						<img src="<%=request.getContextPath() %>/blhrf/img/ke_wen.jpg" />
						<img src="<%=request.getContextPath() %>/blhrf/img/ke_ting.jpg" />
						<h3>孩子咳嗽怎么办？</h3>
					</div>
					<div class="ke_backlist_mid">
						崔玉涛丨中国医师协会儿童健康专家
					</div>
					<div class="ke_backlist_bot">
						<div class="ke_tou">
							<img src="<%=request.getContextPath() %>/blhrf/img/ke_tou.png" />
						</div>
						<div class="ke_yu">
							免费试听
						</div>
						<div class="ke_shu">
							100人学过
						</div>
					</div>
				</div>
				<div class="ke_backlist">
					<div class="ke_backlist_top">
						<img src="<%=request.getContextPath() %>/blhrf/img/ke_tu.jpg" />
						<img src="<%=request.getContextPath() %>/blhrf/img/ke_wen.jpg" />
						<img src="<%=request.getContextPath() %>/blhrf/img/ke_ting.jpg" />
						<h3>孩子咳嗽怎么办？</h3>
					</div>
					<div class="ke_backlist_mid">
						崔玉涛丨中国医师协会儿童健康专家
					</div>
					<div class="ke_backlist_bot">
						<div class="ke_tou">
							<img src="<%=request.getContextPath() %>/blhrf/img/ke_tou.png" />
						</div>
						<div style="background-image: url(img/ke_bggreen.png);" class="ke_yu">
							正在直播
						</div>
						<div class="ke_shu">
							100人学过
						</div>
					</div>
				</div>
				<div class="ke_backlist">
					<div class="ke_backlist_top">
						<img src="<%=request.getContextPath() %>/blhrf/img/ke_tu.jpg" />
						<img src="<%=request.getContextPath() %>/blhrf/img/ke_wen.jpg" />
						<img src="<%=request.getContextPath() %>/blhrf/img/ke_ting.jpg" />
						<h3>孩子咳嗽怎么办？</h3>
					</div>
					<div class="ke_backlist_mid">
						崔玉涛丨中国医师协会儿童健康专家
					</div>
					<div class="ke_backlist_bot">
						<div class="ke_tou">
							<img src="<%=request.getContextPath() %>/blhrf/img/ke_tou.png" />
						</div>
						<div style="background-image: url(img/ke_bggrey.png);" class="ke_yu">
							敬请期待
						</div>
						<div class="ke_shu">
							100人学过
						</div>
					</div>
				</div>
			</div>
			   <div class="xtfoot xtfootcol">
				<ul>
					<li>
						<a href="<%=request.getContextPath() %>/wechatlogin?userId=${userId}">回放课程</a>
					</li>
					<li class="xt_dot">
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