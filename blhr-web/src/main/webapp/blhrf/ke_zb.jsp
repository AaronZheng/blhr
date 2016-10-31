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
		<title>直播课程</title>
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
<%-- 			<form id="mycourse" name="mycourse" action="<%=request.getContextPath() %>/createBroadcase" method="post">
 --%>				<div class="log_one">
					<div class="log_name log_namonee">
						<div class="log_name_list">
							<label>课程名称</label>
							<input type="hidden" id="userId" name="userId" value="${userId }" />
							<input type="hidden" id="courseType" name="courseType" />
							<input type="hidden" id="category" name="category" value="2" />
							<input type="hidden" id="numLimit" name="numLimit" />
							<input type="text" id="courseName" name="courseName" placeholder="最多输入16个字符" />
						</div>
						<div class="log_name_dec">
							<label>课程介绍</label>
							<textarea id="courseIntro" name="courseIntro" placeholder="最多输入42个字符"></textarea>
						</div>
					</div>
				</div>
				<div class="ke_kcfl">
					<ul>
						<li>
							<span class="ls_yi">课程分类</span>
							<label class="ls_san"></label>
							<span class="ls_er">
							<img src="<%=request.getContextPath() %>/blhrf/img/ke_xia.png"/>
						   </span>
						</li>
					</ul>
					<div class="ke_kcfl_dexiala" style="overflow: hidden;clear: both;">
					<p>请选择</p>
					<p onclick = "setCourseType('成长')">成长</p>
					<p onclick = "setCourseType('健康')">健康</p>
					<p onclick = "setCourseType('美食')">美食</p>
					</div>
				</div>
				
				<div class="log_tj log_tjone">
					<input type="button" onclick="submit()" value="开始直播" />
				</div>
<!-- 			</form>
 -->
		</div>
		
	<script type="text/javascript">
		
		$(document).ready(function() {
			var courseType = '${courseType}';
			if(courseType == "成长")
				$(".ke_kcfl .ls_san").html($(".ke_kcfl_dexiala p").eq(1).html());
			else if(courseType == "健康")
				$(".ke_kcfl .ls_san").html($(".ke_kcfl_dexiala p").eq(2).html());
			else if(courseType == "心理")
				$(".ke_kcfl .ls_san").html($(".ke_kcfl_dexiala p").eq(3).html());
			else
				$(".ke_kcfl .ls_san").html($(".ke_kcfl_dexiala p").eq(0).html());

			$(".ke_kcfl ul li").click(function() {
				$(".ke_kcfl_dexiala").slideToggle();
			});
		});
		var baseDir = '<%=request.getContextPath()%>';
		var courseType;
		var numLimit;
	  
		function setLimit(numLimit){
			this.numLimit = numLimit;
			document.getElementById("numLimit").value = numLimit;
		}
	   
	  
		function setCourseType(courseType){
			this.courseType = courseType;
			document.getElementById("courseType").value = courseType;
		}
	  
		function submit(){
			var courseName = document.getElementById("courseName").value;
			var courseIntro = document.getElementById("courseIntro").value;
			if(courseName == null || courseName == ""){
				alert("请填写课程名称");
				return ;
			}
			if(courseType == null || courseType == ""){
				alert("请填限制课程类别");
				return ;
			}
		/* 	if(numLimit == null || numLimit == ""){
				alert("请填选择限制人数");
				return ;
			} */
			if(courseIntro == null || courseIntro == ""){
				alert("请填写课程简介");
				return;
			}
			
			
	    	$.ajax({
				type : "GET",
				async : false,
				url : "<%=request.getContextPath()%>/createBroadcaseb",
			    contentType:"application/x-www-form-urlencoded; charset=utf-8",
				data : {
					"courseName" : courseName,
					"courseType" : courseType,
					"userId" : '${userId}',
					"courseIntro" : courseIntro
				},
				error : function(request) {
					alert("内容发送失败!");
				},
				success : function(data) {
					if(data == "1"){
						alert("创建课程成功，等待审核完成!");
						window.open(baseDir+"/searchMyCourses?userId=${userId}");
					}else{
						alert("内容发送失败!");
					}
				}
			});
			
		/* 	$("#mycourse").submit();
			alert("创建课程成功，等待审核完成!"); */
		}
		
		</script>
		
		
	</body>
	</html>