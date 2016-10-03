<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="Keywords" content="" />
<meta name="Description" content="" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>课程主页</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/blhrf/css/style.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/blhrf/js/jquery-2.1.0.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/blhrf/js/script.js"></script>

<style type="text/css">
#divcss5 {
	margin: 10px auto
}

#divcss5 img {
	border-radius: 50%
}
</style>
</head>

<body style="background-color: #ffffff">
	<div class="bodybox">
		<div class="san_top">
			<div class="san_hred">
				<div id="divcss5">
					<img
						src="<%=request.getContextPath() %><c:out value="${teacherProfile.photo}"/>" />
				</div>
			</div>
			<c:set var="teacherProfile" value="${teacherProfile}" />

			<div class="san_jies">
				<h3>
					<c:out value="${teacherProfile.fullname}" />
				</h3>
				<%-- 					 <div class="jie_title"><c:out value="${teacherProfile.jobName }"/></div>
 --%>
				<div class="jie_title">${teacherProfile.jobName }</div>
				<p class="jie_content">
					<c:out value="${teacherProfile.profile}" />
				</p>
			</div>
			<div class="san_immg">&or;</div>
		</div>
		<div class="san_mid">
			<div class="san_midbox">
				<span class="learn san_hh">课程简介</span> <span class="allkc">全部课程</span>
			</div>
		</div>
		<div class="allzbkcDiv">
			<div class="allzbkcList">
				<c:forEach var="allCourses" items="${allCourses}">
					<div class="san_bot san_botall">
						<div class="ke_back">
							<div class="ke_backlist">
								<div class="ke_backlist_top" onclick="#">
									<c:if test="${allCourses.payType == 2}">
										<img src="<%=request.getContextPath()%>/blhrf/img/vip.jpg" />
									</c:if>
									<c:if test="${allCourses.payType == 1}">
										<img src="<%=request.getContextPath()%>/blhrf/img/mian.jpg" />
									</c:if>
									<img src="<%=request.getContextPath()%>/blhrf/img/ke_wen.jpg" />
									<img onclick="scCourse('<%=request.getContextPath()%>','${allCourses.courseId}','${userId}')" src="<%=request.getContextPath()%>/blhrf/img/ke_ting.jpg" />
<%-- 									<a href="<%=request.getContextPath() %>/scCourse?courseId=${allCourses.courseId}&userId=${userId}"><img
										src="<%=request.getContextPath()%>/blhrf/img/ke_ting.jpg" /></a> --%>
									<h3>
										<c:out value="${allCourses.courseName}" />
									</h3>
								</div>
								<div class="ke_backlist_mid">
									<c:out value="${teacherProfile.fullname}" />
								</div>
								<div class="ke_backlist_bot">
									<div class="ke_tou">
										<div id="divcss5">
											<img
												src="<%=request.getContextPath() %><c:out value="${teacherProfile.photo}"/>" />
										</div>
									</div>
									<div class="ke_yu">
										<a onclick="openCourse('${userId}','${allCourses.courseId}','${allCourses.teacherId}','${allCourses.payType }')">立即学习</a>
									</div>
									<div class="ke_shu">
										<!-- 345人学过 -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<div class="san_zuih">
					<div class="san_zuih_left">
						<!-- 509人在线 -->
					</div>
					<div class="san_zuih_rght">
						<a href="comment.html"> <span
							style="background-image: url(<%=request.getContextPath()%>/blhrf/img/san_2.png);">
								<label>58</label>
						</span>
						</a> <span
							style="background-image: url(<%=request.getContextPath()%>/blhrf/img/san_3.png);"></span>
						<span
							style="background-image: url(<%=request.getContextPath()%>/blhrf/img/san_4.png);"></span>
					</div>
				</div>
			</div>
		</div>
		<div class="learningDiv">
			<div class="san_bot">
				<div class="ke_wodconn_top" onclick="window.location.href='#'">
					<span> <c:if test="${courseProfile.pay_type == 2}">
							<img src="<%=request.getContextPath()%>/blhrf/img/vip.jpg" />
						</c:if> <c:if test="${courseProfile.pay_type == 1}">
							<img src="<%=request.getContextPath()%>/blhrf/img/mian.jpg" />
						</c:if> 
						<img src="<%=request.getContextPath()%>/blhrf/img/ke_wen.png" />
						<img onclick="scCourse('<%=request.getContextPath() %>','${courseProfile.course_id}','${userId}')" src="<%=request.getContextPath()%>/blhrf/img/ke_ting.png" />
					</span>
					<c:set var="courseProfile" value="${courseProfile}" />
					<h3>
						<c:out value="${courseProfile.course_name}" />
					</h3>

				</div>
				<div class="san_bot_jiang">
					<div class="san_zuob" id="divcss5">
						<img
							src="<%=request.getContextPath() %><c:out value="${teacherProfile.photo}"/>" />
					</div>
					<div class="san_youb">
						<c:out value="${courseProfile.course_profile}" />
					</div>
				</div>
				<div class="live_btn">
					<%-- 					<a href="<%=request.getContextPath() %>/openBackCoursePanel?userId=${userId}&courseId=${courseId}&teacherId=${teacherId}">立即学习</a>
 --%>
					<a onclick="openCourse('${userId}','${courseId}','${teacherId}','${courseProfile.pay_type }')">立即学习</a>
				</div>

			</div>
			<div class="san_zuih">
				<div class="san_zuih_left">
					<!-- 509人在线 -->
				</div>
				<div class="san_zuih_rght">
					<a
						href="<%=request.getContextPath() %>/openComment?userId=${userId}&courseId=${courseId}">
						<span
						style="background-image: url(<%=request.getContextPath()%>/blhrf/img/san_2.png);">
							<label>58</label>
					</span>
					</a> <span onclick="scCourse('<%=request.getContextPath() %>','${courseId}','${userId}')" 
						style="background-image: url(<%=request.getContextPath()%>/blhrf/img/san_3.png);"></span>
					<span
						style="background-image: url(<%=request.getContextPath()%>/blhrf/img/san_4.png);"></span>
				</div>
			</div>
		</div>
	</div>


	<div class="pay_shouone" id="pay_shouone">
		<div class="pay_shouonebox">
			<h3>付费课程</h3>
			<div class="paffu_zt">
				<a onclick="hidediv()">取消操作</a> <a class="pay_fu"
					href="<%=request.getContextPath() %>/openPayMenu?userId=${userId}&isMember=1">成为会员</a>
			</div>
		</div>
	</div>

	<script>
	

		function showdiv() {            
            document.getElementById("pay_shouone").style.display ="block";
        }
        
		function hidediv() {
            document.getElementById("pay_shouone").style.display ='none';
        }
		
		function openCourse(userId,courseId,teacherId,courseType){
			
			if(courseType == '2' && '${userType}' < 2){
				  document.getElementById("pay_shouone").style.display ="block";
				  return;
			}
			var baseDir = '<%=request.getContextPath()%>';
			window.open(baseDir+"/openBackCoursePanel?userId="+userId+"&courseId="+courseId+"&teacherId="+teacherId);
		}
		
		
			$(document).ready(function() {
				var tsx = $(".san_jies p").html();
				$(".san_jies p").ellipse(80);

				$(".san_immg").click(function() {
					if ($(".san_jies p").is(".ontex")) {
						$(".san_jies p").ellipse(80);
						$(".san_jies p").removeClass("ontex");
					} else {
						$(".san_jies p").html(tsx).addClass("ontex");
					}

				});

			});

			(function($) {
				jQuery.fn.ellipse = function(maxwidth) {
					this.each(function() {
						if ($(this).text().length > maxwidth) {
							$(this).text($(this).text().substring(0, maxwidth));
							$(this).html($(this).html() + "……");
						}
					});
				}
			})(jQuery)
		</script>
</body>
</html>