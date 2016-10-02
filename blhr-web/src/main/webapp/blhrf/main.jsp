<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>微信登录</title>
</head>
<body>
<h1>欢迎${username }登录系统, OPENID ${openId } userId ${userId }</h1>
<h2>用户信息 ${userInfo }</h2>
<font size="100">
<a href="<%=request.getContextPath() %>/initMyClassInfo?userId=${userId }">我的课堂</a>
<a href="http://www.bolihaiwe.com/blhr-web/blhrf/login.jsp">教师登录</a>
</font>
</body>
</html>