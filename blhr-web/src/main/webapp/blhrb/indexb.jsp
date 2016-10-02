<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="javascript" type="text/javascript"
	src="<%=request.getContextPath() %>/../js/jquery-2.1.4.js"></script>
</head>
<body>
<script type="text/javascript">
function quesyUsers(){
	jQuery.ajax({
			type : "POST",
			async : false,
			url : "<%=request.getContextPath()%>/../usersManage",
			error : function(request) {
				
			},
			success : function(data) {
				//alert(data);
				var N = [];
				N.push('<tr><th name = "userId" hidden = "hidden"></th><th name = "isMember">是否付费</th> <th name = "username">用户名</th><th name = "wechatname">微信号</th><th name = "lrrq">注册时间</th><th name = "typeName">付费类型</th><th name = "recordsCount">收听课程数</th></tr>');
				var dataArray = JSON.parse(data); 
				for(var i=0;i<dataArray.length;i++) {
					var obj = dataArray[i];
					N.push('<tr><td>'+obj.isMember+'</td><td>'+obj.username+'</td><td>'+obj.wechatname+'</td><td>'+obj.lrrq+'</td><td>'+obj.typeName+'</td><td>'+obj.recordsCount+'</td></tr>');
				}
				$('#userslist').empty().append($(N.join('')));
			}
	});
}

function queryTeachers(){
	jQuery.ajax({
		type : "POST",
		async : false,
		url : "<%=request.getContextPath()%>/../teachersManage",
		error : function(request) {
		},
		success : function(data) {
			var N = [];
			N.push('<tr><th name = "userId" hidden = "hidden"></th><th name = "state">讲师状态</th><th name = "username">用户名</th><th name = "wechatname">微信号</th><th name = "lrrq">注册时间</th><th name = "courseCount">创建课程数</th><th name = "">完成课程数</th><th></th></tr>');
			var dataArray = JSON.parse(data); 
			for(var i=0;i<dataArray.length;i++) {
				var obj = dataArray[i];
				N.push('<tr><td>'+obj.state+'</td><td>'+obj.username+'</td><td>'+obj.wechatname+'</td><td>'+obj.lrrq+'</td><td>'+obj.courseCount+'</td><td>'+"完成课程数"+'</td><td><input type="button" value="查看资料" onclick = "teacherDetail(\''+obj.userId+'\')"></td></tr>');
			}
			$('#userslist').empty().append($(N.join('')));
		}
});
}

function teacherDetail(userId){
	jQuery.ajax({
		type : "POST",
		async : false,
		url : "<%=request.getContextPath()%>/../teacherDetail",
		data : {"userId" : userId},
		error : function(request) {
			alert(request)
		},
		success : function(data) {
			console.log(data);
			alert(data)
			//关对话框，重新加载页面;
			//queryTeachers()
		}
});
}
</script>

<div>
        <input type="button" value="微信用户管理（会员）" style="width: 200px;height: 100px;" onclick = "quesyUsers()">
        <input type="button" value="讲师"  style="width: 200px;height: 100px;" onclick = "queryTeachers()">
</div>


<div>
	<table id = "userslist" border = "1">
		<%-- <tr>
			<th name = "userId" hidden = "hidden"></th>
			<th name = "isMember">是否付费</th> 
			<th name = "username">用户名</th>
			<th name = "wechatname">微信号</th>
			<th name = "lrrq">注册时间</th>
			<th name = "typeName">付费类型</th>
			<th name = "recordsCount">收听课程数</th>
		</tr>
		<c:forEach var="users" items="${users}"> 
		<tr>
			<td><c:out value="${users.isMember}"></c:out></td> 
			<td><c:out value="${users.username}"></c:out></td>
			<td><c:out value="${users.wechatname}"></c:out></td>
			<td><fmt:formatDate value="${users.lrrq}" pattern="yyyy-MM-dd"/></td>
			<td><c:out value="${users.typeName}"></c:out></td>
			<td><c:out value="${users.recordsCount}"></c:out></td>
		</tr>
		</c:forEach> --%>
	</table>
	
	<%--<table id = "teacherslist">
		 <tr>
			<th name = "userId" hidden = "hidden"></th>
			<th name = "state">讲师状态</th> 
			<th name = "username">用户名</th>
			<th name = "wechatname">微信号</th>
			<th name = "lrrq">注册时间</th>
			<th name = "courseCount">创建课程数</th>
			<th name = "">完成课程数</th>
			<th></th>
		</tr>
		<c:forEach var="teachers" items="${teachers}"> 
		<tr>
			<td><c:out value="${teachers.state}"></c:out></td> 
			<td><c:out value="${teachers.username}"></c:out></td>
			<td><c:out value="${teachers.wechatname}"></c:out></td>
			<td><fmt:formatDate value="${teachers.lrrq}" pattern="yyyy-MM-dd"/></td>
			<td><c:out value="${teachers.courseCount}"></c:out></td>
			<td><c:out value="${teachers.courseCount}"></c:out></td>
			<td><input type="button" value="查看资料" onclick = "teacherDetail()"></td>
		</tr>
		</c:forEach> 
		
	</table>--%>
</div>

</body>
</html>