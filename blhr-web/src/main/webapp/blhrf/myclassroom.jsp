<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="Keywords" content="" />
		<meta name="Description" content="" />
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>玻璃海儿</title>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/blhrf/css/style.css" />
		<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/jquery-2.1.0.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/script.js"></script>
		<!--[if (gte IE 6)&(lte IE 8)]>
  			<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/selectivizr.js"></script>
  			<noscript><link rel="stylesheet" href="<%=request.getContextPath() %>/blhrf/[fallback css]" /></noscript>
		<![endif]-->
		<style type="text/css">
	    	#divcss5{ margin:10px auto} 
            #divcss5 img{ border-radius:50%}
		</style>
	</head>

	<body style="background-color: #E8E8E8;">
		<div class="bodybox">
			<div style="background-image: url(<%=request.getContextPath() %>/blhrf/img/xt_bg.png);" class="xthead">
<%-- 				<img src="<%=request.getContextPath() %>/blhrf/img/xt_head.png" />
 --%>			<div id="divcss5" >
                <c:if test="${memberInfo.category==1}">
                <img src="${memberInfo.photo }" />
                </c:if>
                <c:if test="${memberInfo.category==2}">
                <img src="<%=request.getContextPath() %>/${memberInfo.photo }" style="width: 46px;height: 46px"/>
                </c:if>
                </div>
                <span>${memberInfo.username }</span>
			</div>
			<div class="xtcont">
				<ul>
					<a href="<%=request.getContextPath() %>/openPayMenu?userId=${userId}&isMember=${memberInfo.ismember}">
					
					<c:if test="${memberInfo.ismember==1}">
						<li style="background-image: url(<%=request.getContextPath() %>/blhrf/img/xt_1.png);" class="xt_1">
							
							<span>开通VIP</span>
							<span>
							<img src="<%=request.getContextPath() %>/blhrf/img/xt_jt.png"/>
						</span>
						</li>
						</c:if><c:if test="${memberInfo.ismember==2}">
						
					    <li style="background-image: url(<%=request.getContextPath() %>/blhrf/img/xt_1.png);" class="xt_1">
							<div>
								<span>玻璃海VIP套餐</span>
								<span>
							<img src="<%=request.getContextPath() %>/blhrf/img/xt_jt.png"/>
						 </span></div>
							<label>${memberInfo.validateTime }到期</label>
						</li>
						</c:if>
						
					</a>
					<a href="<%=request.getContextPath() %>/queryLearnedCourse?userId=${userId}">
						<li style="background-image: url(<%=request.getContextPath() %>/blhrf/img/xt_3.png);" class="xt_3">
							<span>我听过的课程</span>
							<span>
							<img src="<%=request.getContextPath() %>/blhrf/img/xt_jt.png"/>
						</span>
						</li>
					</a>
					<a href="<%=request.getContextPath() %>/queryFavoriteCourse?userId=${userId}">
						<li style="background-image: url(<%=request.getContextPath() %>/blhrf/img/xt_4.png);" class="xt_4">
							<span>我收藏的课程</span>
							<span>
							<img src="<%=request.getContextPath() %>/blhrf/img/xt_jt.png"/>
						</span>
						</li>
					</a>
					<a href="<%=request.getContextPath() %>/blhrf/login.jsp?userId=${userId}">
						<li style="background-image: url(<%=request.getContextPath() %>/blhrf/img/xt_5.png);" class="xt_5">
							<span>讲师登录</span>
							<span>
							<img src="<%=request.getContextPath() %>/blhrf/img/xt_jt.png"/>
						</span>
						</li>
					</a>
				</ul>
			</div>
	        <div class="xtfoot xtfootcol">
				<ul>
					<li>
						<a href="<%=request.getContextPath() %>/wechatlogin?userId=${userId}">回放课程</a>
					</li>
					<li>
						<a href="<%=request.getContextPath() %>/queryBroadCastCourse?userId=${userId}">直播课程</a>
					</li>
					<li class="xt_dot">
						<a href="<%=request.getContextPath() %>/initMyClassInfo?userId=${userId}">我的课堂</a>
					</li>
				</ul>
			</div>
	</div>
	</body>
</html>