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
		<style type="text/css">
	    	#divcss5{ margin:10px auto} 
            #divcss5 img{ border-radius:50%}
		</style>
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
							<c:forEach items="${banner }" var="ban">
								<c:if test="${ban.pic_link ！= null}">
								<li><span class="banimg" style="background-image: url('<%=request.getContextPath() %>/${ban.pic_link}');" onclick="window.open('${ban.pic_address}')"></span>
								</li></c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			
			<div>
			<c:forEach items="${courseTitleList }" var="list">
			<div class="ke_back">
				<div class="ke_backlist">
					<div class="ke_backlist_top">
						<c:if test="${list.pay_type == 2}">
						   <img src="<%=request.getContextPath() %>/blhrf/img/ke_tu.jpg"/>
						</c:if>
						<c:if test="${list.pay_type == 1}">
						   <img src="<%=request.getContextPath() %>/blhrf/img/ke_wen.jpg"/>
						</c:if>
						<img src="<%=request.getContextPath() %>/blhrf/img/ke_wen.jpg"/>
						<img onclick="scCourse('<%=request.getContextPath() %>','${list.course_id}','${userId}')" src="<%=request.getContextPath() %>/blhrf/img/ke_ting.jpg"/>
						<h3><div onclick="window.open('<%=request.getContextPath() %>/openCourseProfile?userId=${userId}&courseId=${list.course_id}&courseName=${list.course_name}&teacherId=${list.teacherId}')"> ${list.course_name } </div></h3>
					</div>
					<div class="ke_backlist_mid">
						${list.fullname }-${list.jobName }
					</div>
					<div class="ke_backlist_bot">
						<div class="ke_tou">
						  <div id="divcss5">
							<img src="<%=request.getContextPath() %>/${list.photo }"/>
							</div>
						</div>
						<div class="ke_yu" onclick="openCourse('${userId}','${list.course_id}','${list.teacher_id}','${list.pay_type }')">
<%-- 						    <a onclick="openCourse(${userId},${list.course_id},${list.teacher_id})" href="<%=request.getContextPath() %>/openBackCoursePanel?userId=${userId}&courseId=${list.course_id}&teacherId=${list.teacher_id}">回放课程</a>
 --%>						    <a >立即学习</a>
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
			
			<div class="pay_shouone" id="pay_shouone">
				<div class="pay_shouonebox">
					<h3>付费课程</h3>
					<div class="paffu_zt">
						<a  onclick="hidediv()">取消操作</a>
						<a class="pay_fu" href="<%=request.getContextPath() %>/openPayMenu?userId=${userId}&isMember=1">成为会员</a>
					</div>
				</div>
			</div>
			
			<script type="text/javascript">
			
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
				var baseDir = '<%=request.getContextPath() %>';
				window.open(baseDir+"/openBackCoursePanel?userId="+userId+"&courseId="+courseId+"&teacherId="+teacherId);
			}
				
			
			</script>

	</body>

</html>