<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>我的课堂</h1>
<table>
<tr><td><img alt="" src="${memberInfo.photo }"> </td></tr>
<tr><td>${memberInfo.username }</td></tr>
<tr><td><c:if test="${memberInfo.ismember==1}">成为会员</c:if><c:if test="${memberInfo.ismember==2}">${memberInfo.validateTime }</c:if></td></tr>
</table>

<a href="">听过课程</a><br>
<a href="blhr-web/src/main/webapp/blhrf/myclassroomb.jsp""">收藏课程</a><br>
<a href="">成为讲师</a><br>


</body>
</html>