<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单管理</title>
<script language="javascript" type="text/javascript"
	src="<%=request.getContextPath() %>/js/jquery-2.1.4.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/easyui/themes/default/easyui.css"></link>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/easyui/jquery.easyui.min.js"></script>
<script language="javascript" type="text/javascript"
	src="<%=request.getContextPath()%>/easyui/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/easyui/themes/icon.css"></link>
</head>
<body>



<div>
	<table id="grid" class="easyui-datagrid" style="width: 100%; height: 340px"
			title= "订单管理" toolbar="#tb">
		<thead>
			<tr>
				<th data-options="field: 'typeName'" width="15%">订单类型</th>
				<th data-options="field: 'username'" width="15%">用户名</th>
				<th data-options="field: 'wechatname'" width="15%" >微信号</th>
				<th data-options="field: 'payTime'" width="10%" >下单时间</th>
				<th data-options="field: 'startTime'" width="10%" >开始时间</th>
				<th data-options="field: 'endTime'" width="10%" >结束时间</th>
				<th data-options="field: 'orderState'" width="15%" >订单状态</th>
			</tr>
		</thead>
	</table>
	<!-- <div id="tb">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-add'" onClick="onclick_toolbar_add()">增加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-edit'" onClick="onclick_toolbar_edit()">编辑</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove'" onclick="onclick_toolbar_del()">删除</a>
	</div> -->
</div>
<script type="text/javascript">
$(document).ready(function() {
	$("#grid").datagrid({
		url : '/blhr-web/orderManage',
		toolbar : '#tb',
		pagination : 'true',
		selectOnCheck : 'true',
		checkOnSelect : 'true',
		singleSelect : 'true',
		rownumbers : true
	});
	
});


</script>
</body>
</html>