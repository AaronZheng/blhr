<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成为讲师</title>
</head>
<body>

<form action="/teacherApplication">
<table>
<tr><td>真实姓名：</td><td> <input name=trueName type="text" /></td></tr>
<tr><td>身份证号:</td><td>  <input name=idCard type="text" /></td></tr>
<tr><td>联系电话:</td><td><input name=tel type="text" /></td></tr>
<tr><td>简介       :</td><td> <textarea name=profile></textarea></td></tr>
<tr><td colspan="2"><input type="submit" value="申请审核"></td></tr>
</table>
</form>

</body>
</html>