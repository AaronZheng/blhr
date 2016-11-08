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
		<title>成为讲师</title>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/blhrf/css/style.css" />
		<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/jquery-2.1.0.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/script.js"></script>
		<!--[if (gte IE 6)&(lte IE 8)]>
  			<script type="text/javascript" src="js/selectivizr.js"></script>
  			<noscript><link rel="stylesheet" href="[fallback css]" /></noscript>
		<![endif]-->
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
			url : "<%=request.getContextPath()%>/validateTeacherLoginInfo",
			data : {
				"username" : username,
				"password" : password
			},
			error : function(request) {
				document.getElementById("loginRtnInfo").innerHTML="<font color=\"red\">验证未通过，请检查用户名密码信息!</font>";
			},
			success : function(data) {
				var vm = JSON.parse(data);
				if("1"== vm.state)
					window.location.href = "<%=request.getContextPath()%>/initTeacher?userId="+"<%=request.getParameter("userId")%>";
					<%-- window.location.href = "<%=request.getContextPath()%>/initTeacher?userId="+vm.userId; --%>
			    else
					document.getElementById("loginRtnInfo").innerHTML="<font color=\"red\">验证未通过，请检查用户名密码信息!</font>";
			}
		});
	}
</script>
		
		
	</head>

	<body style="background-color: #ffffff">
		<div class="bodybox">
			<div class="log_show">
				<div class="log_showbox">
					<span>
						您的申请已收到<br/>海儿会在3个工作日内完成审核<br/>请保持您的联系方式畅通
					</span>
					<p><label>5</label>秒后跳转首页</p>
				</div>
			</div>
				<div class="log_one">
				<div id="loginRtnInfo"></div>
					<div class="log_name" style="text-indent: 15px;">
						<div class="log_name_list">
							<label>用户名</label>
							<input style="text-indent: 15px;" type="text" id="username" name="username"  />
						</div>
						<div class="log_name_list">
							<label>密码</label>
							<input  style="text-indent: 15px;"  type="password" style="height: 30 px;padding-bottom: 1px" id="password" name="password" placeholder="密码不少于6位" />
						</div>
						<div class="log_tj log_tjone">
							<input type="button" onclick="submit()" value="登录" />
						</div>
					</div>
				</div>
			</form>
		</div>
	</body>
</html>