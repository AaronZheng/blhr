<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>首页</title>
</head>
<body>
<table>
<c:forEach items="${courseTitleList }" var="list">
 <tr><td>${list.courseName }</td><tr>
 <tr><td><img alt="" src="${list.photo }"> </td></tr>
 <tr><td>${list.teacher }</td></tr>
 <tr><td>${list.teacherProfile }</td></tr>
 <tr><td><br/></td></tr>
 </c:forEach>
</table>
</body>
</html>