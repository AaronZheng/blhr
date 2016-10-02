<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>直播管理</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyui/themes/default/easyui.css"></link>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyui/themes/icon.css"></link>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyui/demo/demo.css"></link>
<script type="text/javascript" src="<%=request.getContextPath()%>/easyui/jquery.min.js"></script>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/easyui/jquery.easyui.min.js"></script>
 --%>
 <script type="text/javascript" src="http://www.jeasyui.net/Public/js/easyui/jquery.easyui.min.js"></script>
 
</head>
<body>
 
<table id="ttbd" class="easyui-datagrid" title="课程管理"
							style="width: 100%; height: 380px" singleSelect=true rownumbers=true
							 url='<%=request.getContextPath()%>/queryBroadcastCourse' pagination="true"
							toolbar="#tb">
							<thead>
								<tr>
								    <th field="course_id" hidden="true"></th>
									<th field="course_name" width="15%" align="center">课程名称</th>
									<th field="pay_type" width="5%" align="center">费用</th>
									<th field="coure_type" width="5%" align="center">类别</th>
									<th field="create_person" width="10%" align="center">创建者</th>
									<th field="create_time" width="15%" align="center">创建时间</th>
									<th field="fullname" width="10%" align="center">讲师姓名</th>
									<th field="play_time" width="15%" align="center">开播时间</th>
									<th field="person_limit" width="5%" align="center">人数限制</th>
									<th field="course_state" width="5%" align="center">课程状态</th>
									<th field="available" width="15%" align="center">操作</th>
								</tr>
							</thead>
						</table>

						<div id="tb">
							<a href="#" class="easyui-linkbutton" iconCls="icon-cut"
								plain="true" onclick="hide()">屏蔽</a> 
								<a href="#" class="easyui-linkbutton" iconCls="icon-edit"
								plain="true" onclick="openCourseDetail()">编辑</a> 
								<a href="#" class="easyui-linkbutton" iconCls="icon-remove"
								plain="true" onclick="deletecourseInfo()">删除</a>
						</div>

</body>
</html>