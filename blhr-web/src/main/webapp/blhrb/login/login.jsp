<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">
<head>
<meta charset="utf-8">
<title>微儿健康后台管理系统</title>
<meta name="keywords" content="微儿健康后台管理系统" />
<meta name="description" content="微儿健康后台管理系统" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="<%=request.getContextPath()%>/blhrb/login/assets/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/blhrb/login/assets/css/supersized.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/blhrb/login/assets/css/style.css">
<script type="text/javascript">
   
   function submit(){
	   
	   var username = document.getElementById("username").value;
	   var password = document.getElementById("password").value;
	   
	   if(username == null||username == ""){
		   document.getElementById("loginRtnInfo").innerHTML="<font color=\"red\">请填写用户名信息</font>";
		      return; 
	   }
	   if(password == null||password == ""){
			document.getElementById("loginRtnInfo").innerHTML="<font color=\"red\">请填写密码信息</font>";
	        return; 
          }
		$.ajax({
			type : "GET",
			async : false,
			url : "<%=request.getContextPath()%>/validateLoginInfo",
			data : {
				"username" : username,
				"password" : password
			},
			error : function(request) {
				document.getElementById("loginRtnInfo").innerHTML="<font color=\"red\">验证未通过，请检查用户名密码信息!</font>";
			},
			success : function(data) {
				if("1" == data)
					window.location.href = "<%=request.getContextPath()%>/loginMainPage";
			    else
					document.getElementById("loginRtnInfo").innerHTML="<font color=\"red\">验证未通过，请检查用户名密码信息!</font>";
			}
		});
	}
</script>
</head>

<body>

	<div class="page-container">
		<h1>微儿健康后台管理系统</h1>
			<input type="text" name="username" id="username" placeholder="用户名" ><br/>
			<input type="password" name="password" id="password" placeholder="密码" ><br/>
			<button type="button" onclick="submit()">提交</button><br/>
			<br/>
			<div class="errors">
				<p id="loginRtnInfo"></p>
			</div>
		<div>
			<p>
				<br />
				<br />
				<br />
				<br />
			</p>
			<p>版权所有：北京微儿健康文化交流有限责任公司</p>
		</div>
	</div>
	
	<script src="<%=request.getContextPath()%>/blhrb/login/assets/js/jquery-1.8.2.min.js"></script>
	<script src="<%=request.getContextPath()%>/blhrb/login/assets/js/supersized.3.2.7.min.js"></script>
	<script src="<%=request.getContextPath()%>/blhrb/login/assets/js/supersized-init.js"></script>
	<script src="<%=request.getContextPath()%>/blhrb/login/assets/js/scripts.js"></script>
	
	<script type="text/javascript">
		jQuery(function($){
	
		    $.supersized({
	
		        // Functionality
		        slide_interval     : 4000,    // Length between transitions
		        transition         : 1,    // 0-None, 1-Fade, 2-Slide Top, 3-Slide Right, 4-Slide Bottom, 5-Slide Left, 6-Carousel Right, 7-Carousel Left
		        transition_speed   : 1000,    // Speed of transition
		        performance        : 1,    // 0-Normal, 1-Hybrid speed/quality, 2-Optimizes image quality, 3-Optimizes transition speed // (Only works for Firefox/IE, not Webkit)
	
		        // Size & Position
		        min_width          : 0,    // Min width allowed (in pixels)
		        min_height         : 0,    // Min height allowed (in pixels)
		        vertical_center    : 1,    // Vertically center background
		        horizontal_center  : 1,    // Horizontally center background
		        fit_always         : 0,    // Image will never exceed browser width or height (Ignores min. dimensions)
		        fit_portrait       : 1,    // Portrait images will not exceed browser height
		        fit_landscape      : 0,    // Landscape images will not exceed browser width
	
		        // Components
		        slide_links        : 'blank',    // Individual links for each slide (Options: false, 'num', 'name', 'blank')
		        slides             : [    // Slideshow Images
		                                 {image : '<%=request.getContextPath()%>/blhrb/login/assets/img/backgrounds/1.jpg'},
		                                 {image : '<%=request.getContextPath()%>/blhrb/login/assets/img/backgrounds/2.jpg'},
		                                 {image : '<%=request.getContextPath()%>/blhrb/login/assets/img/backgrounds/3.jpg'}
		                       ]
	
		    });
		});
	</script>
	
	
</body>

</html>


