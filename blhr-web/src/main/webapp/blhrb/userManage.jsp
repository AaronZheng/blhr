<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>微信用户管理</title>
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
	
	<div class = "easyui-center">
       <div style="margin:10px">
       		<input type="button" value="会员" onclick = "quesyUsers()" class = "small_button">
        	<input type="button" value="讲师" onclick = "queryTeachers()" class = "small_button">
    	</div>
    	<div name = "iframe_list"></div>
    	<div id = "user_panel" class="easyui-panel" closed ="true" style="width: 100%; ">
	    <table id = "userslist" class = "easyui-datagrid" style="width: 100%; height: 340px"
			title= "用户管理（双击注册讲师）" >
			<thead><tr>
				<th data-options="field: 'userId'" hidden = "hidden"></th>
				<th data-options="field: 'category'" hidden = "hidden"></th>
				<th data-options="field: 'isMember'" width="15%">是否付费</th> 
				<th data-options="field: 'username'" width="15%">用户名</th>
				<th data-options="field: 'wechatname'" width="21%">微信号</th>
				<th data-options="field: 'lrrq'" width="20%">注册时间</th>
				<th data-options="field: 'typeName'" width="15%">付费类型</th>
				<th data-options="field: 'recordsCount'" width="15%">收听课程数</th>
			</tr></thead>
		</table>
		
		</div>
		<div id ="teacher_panel" class="easyui-panel" closed='true' style="width:100%; ">
		<table id = "teacherslist" class = "easyui-datagrid" style="width: 100%; height: 340px"
			title= "讲师管理（双击显示讲师资料）" toolbar="#tb">
			 <thead><tr>
				<th data-options="field: 'userId'"  hidden = "hidden"></th>
				<th data-options="field: 'state'" width="21%">讲师状态</th> 
				<th data-options="field: 'username'" width="20%">用户名</th>
				<th data-options="field: 'wechatname'" width="20%">微信号</th>
				<th data-options="field: 'lrrq'" width="20%">注册时间</th>
				<th data-options="field: 'courseCount'" width="20%">创建课程数</th>
				<!-- <th name = "">完成课程数</th>
				<th>查看资料</th>
				<th>资格</th> -->
			</tr></thead>
		</table>
		<div id="tb">
				<a href="#" class="easyui-linkbutton" iconCls="icon-remove"
				plain="true" onclick="deleteTeacher()">删除</a>
		</div>
		</div>
	</div>
	
	<div id="dialog" class="easyui-dialog" style="width: 390px; height: 250px">
		<form id="form" method="post" style="width: 90%; height: 90%">
			<table toolbar="#bu" align="center" class="panel-table" border="0"
					style="width: 90%; height: 90%;margin:20px 40px">
				<tr >
					<td style="width:50%" align="center">真实姓名</td>
					<td style="width:50%"><input class="easyui-validatebox textbox" type="text"  style="border:0px" name="username" readonly/></td>
				</tr>
				<tr>
					<td align="center">身份证号</td>
					<td><input class="easyui-validatebox textbox" type="text" style="border:0px" name="idCard" readonly/></td>
				</tr>
				<tr>
					<td align="center">联系电话</td>
					<td><input class="easyui-validatebox textbox" type="text" style="border:0px" id="phone" name="phone" readonly/></td>
				</tr>
				<tr>
					<td align="center">个人简介</td>
					<td style="height:20%"><textarea rows="3" class="textarea easyui-validatebox"  style="border:0px;font-size:12px; background: #ffffff;color: #000000;overflow-y:hidden;overflow-x:hidden" name="profile" readonly></textarea></td>
				</tr>
				<tr>
					<td align="center">
						<div id="bu" align="center">
							<a href="javascript:void(0)" class="easyui-linkbutton"
								onclick="Apply(1)">通过申请</a></div></td>
					<td align="center">
						<div id="bu" align="center">
							<a href="javascript:void(0)" class="easyui-linkbutton"
								onclick="Apply(2)">拒绝申请</a></div></td>
				</tr>
			</table>
		</form>
	</div>
	<div  id="loginTeacherDia" class="easyui-dialog" style="width: 600px; height: 300px">
		<form id ="loginTeacherForm" name="loginTeacherForm" action="<%=request.getContextPath()%>/uploadTeacherInfo" method="post"  enctype="multipart/form-data"  style="width: 100%; height: 100%">
			<table  class="panel-table" border="0" align="center" style="padding: 5px 5px">
				<tr>
					<td style="width:80px" align="center">昵称</td>
					<td style="width:140px"><input class="easyui-validatebox" type="text" id = "username" name = "username"/></td>
					<td style="width:110px">上传图像</td>
					<td style="width:110px"> <input type='file' id='fileUp' name='fileUp' /></td>
					</tr>
				<tr>
					<td align="center" >姓名 <input type="hidden" id = "userIdn" name ="userId"></td>
					<td ><input class="easyui-validatebox" type="text" id = "fullname" name = "fullname"/></td>
					<td align="center" style="width:80px">身份证</td>
					<td style="width:140px"><input class="easyui-validatebox" type="text" id = "idCard" name = "idCard"/></td>
				</tr>
				<tr>
					<td align="center" >登录用户名</td>
					<td ><input class="easyui-validatebox" type="text" id = "teacherName" name = "teacherName"/></td>
					<td align="center" style="width:80px">登录密码</td>
					<td style="width:140px"><input class="easyui-validatebox" type="text" id = "teacherPassword" name = "teacherPassword"/></td>
				</tr>
				<tr><td>讲师职称</td><td colspan="3"> <input style="width: 340px" class="textarea easyui-validatebox" type="text" id = "jobName" name = "jobName"/></td></tr>
				<tr>	
					<td align="center" >个人简介</td>
					<td  colspan="3" ><input style="width: 340px" class="textarea easyui-validatebox" type="textarea" id = "profile" name = "profile"/></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="button" class="easyui-linkbutton" onclick="submitData()" value="注册"></a></td>
					<td colspan="2" align="center"><a href="javascript:void(0)" class="easyui-linkbutton" onclick="newTeacher(2)">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
	
<script type="text/javascript">


function submitData(){
	if(document.getElementById("fullname").value =="" || document.getElementById("fullname").value == null){
		alert("教师姓名必须填写！");
		return;
	}
	if(document.getElementById("teacherName").value =="" || document.getElementById("teacherName").value == null){
		alert("请填写教师登了用户名！");
		return;
	}
	if(document.getElementById("userIdn").value =="" || document.getElementById("userIdn").value == null){
		document.getElementById("userIdn").value = userId;
		if(document.getElementById("userIdn").value =="" || document.getElementById("userIdn").value == null){
			alert("用户ID为空，请刷新页面！");
		    return;
		}
	}
	if(document.getElementById("idCard").value == "" || document.getElementById("idCard").value == null){
		alert("请填写教师登了密码！");
		return;
	}
	if(document.getElementById("profile").value == "" || document.getElementById("profile").value == null){
		alert("请填写教师简历！");
		return;
	}
	if(document.getElementById("teacherPassword").value == "" || document.getElementById("teacherPassword").value == null){
		alert("请填写教师密码！");
		return;
	}
	if(document.getElementById("fileUp").value == "" || document.getElementById("fileUp").value == null){
		alert("请上传教师图片！");
		return;
	}
	if(document.getElementById("jobName").value == "" || document.getElementById("jobName").value == null){
		alert("请上填写讲师职称！");
		return;
	}
	
		
		
	$("#loginTeacherForm").submit();
	
}


$(function() {
    $('#fileUp').change(function() {
        $('#uploadLog').html('开始上传中....');
        $('#formFile').submit();
    });
})
function uploadSuccess(msg) {
	console.log(msg)
	$('#dlg_fileinfo').dialog('close');
    if (msg.split('|').length > 1) {
        $('#imgShow').attr('src', msg.split('|')[1]);
        //$('#uploadLog').html(msg.split('|')[0]);
    } else {
       // $('#uploadLog').html(msg);
    }
}
var userId = "";
$(document).ready(function() {
	$("#dialog").dialog('close');
	$('#loginTeacherDia').dialog('close');
	$('#dlg_fileinfo').dialog('close');
	$("#userslist").datagrid({
		url : '<%=request.getContextPath()%>/usersManage',
		toolbar : '#tb',
		pagination : 'true',
		selectOnCheck : 'true',
		checkOnSelect : 'true',
		singleSelect : 'true',
		rownumbers : true,
		onDblClickRow:function(rowIndex, rowData){
			console.log(rowIndex);
			console.log(rowData);
			userId = rowData.userId;
			var category = rowData.category;
			if(category == '2'){
				alert("您选着的用户已经是会员用户!");
				return;
			}
			if(category == "3"){
				alert("您选着的用户是管理员用户，不能注册成为导师!");
				return ;
			}
				
			if(category != "1"){
				alert("未知用户类型，请检查用户表中的用户属性！");
				return ;
			}
			
			document.getElementById("userIdn").value=userId;
			$('#loginTeacherDia').dialog({
				title : '注册讲师',
				closed : false,
				modal : true
			})
		}
	}); 
	$('#user_panel').panel('open');
	
});


function quesyUsers(){
	$('#teacher_panel').panel('close');
	$("#userslist").datagrid({
		url : '<%=request.getContextPath()%>/usersManage',
		toolbar : '#tb',
		pagination : 'true',
		selectOnCheck : 'true',
		checkOnSelect : 'true',
		singleSelect : 'true',
		rownumbers : true,
		onDblClickRow:function(rowIndex, rowData){
			console.log(rowIndex);
			console.log(rowData);
			userId = rowData.userId;
			$('#loginTeacherDia').dialog({
				title : '注册讲师',
				closed : false,
				modal : true
			})
		}
	});
	$('#user_panel').panel('open');
}

function queryTeachers(){
	$('#user_panel').panel('close');
	$("#teacherslist").datagrid({
		url : '<%=request.getContextPath()%>/teachersManage',
		pagination : 'true',
		selectOnCheck : 'true',
		checkOnSelect : 'true',
		singleSelect : 'true',
		rownumbers : true,
		onDblClickRow:function(rowIndex, rowData){
			console.log(rowIndex);
			console.log(rowData);
			userId = rowData.userId;
			teacherDetail(rowData.userId)
		} 
	});
	$('#teacher_panel').panel('open');
}

function teacherDetail(userId){
	jQuery.ajax({
		type : "POST",
		async : false,
		url : "<%=request.getContextPath()%>/teacherDetail",
		data : {"userId" : userId},
		error : function(request) {
			
		},
		success : function(data) {
			console.log(data);
			$('#dialog').dialog({
				title : '讲师资料',
				closed : false,
				modal : true
			});
			$('#form').form('load', data[0]);
		}
});
}

function Apply(value){
	//1:通过，2:取消
	jQuery.ajax({
		type : "POST",
		async : false,
		url : "<%=request.getContextPath()%>/applyRes",
		data : {"state" : value, "userId" : userId},
		error : function(request) {
			
		},
		success : function(data) {
			console.log(data);
			$('#dialog').dialog('close');
			queryTeachers();
			//$('#form').form('reload')
		}
	});
}


function newTeacher(value){
	//1:注册，2:取消
	if(value==1){
		$.messager.confirm('提示','确定注册为讲师吗？',function(r){
		    if (r){
		    	$.ajax({
		    		type:'POST',
		    		async : false,
		    		url:"<%=request.getContextPath()%>/uploadTeacherInfo",
		    		data : $('#loginTeacherForm').serialize()+"&userId="+userId,
		    		error:function(request) {
		    			$.messager.alert('提示', "注册失败！", "info");
		    		},
		    		success : function(data) {
		    			console.log(data);
		    			$.messager.alert('提示', "注册成功！", "info");
		    			quesyUsers();
		    			$('#loginTeacherForm').form('clear');
		    			$('#loginTeacherDia').dialog('close');
		    		}
		    	});
		    	
		    }
		});
	}else{
		$('#loginTeacherForm').form('clear');
		$('#loginTeacherDia').dialog('close');
	}
}

function updateFile() {
	$('#dlg_fileinfo').dialog('open').dialog('setTitle', '上传文件');
}

function save(){
	
	$.ajax({
		type:'POST',
		async : false,
		url:"<%=request.getContextPath()%>/PicUpload",
		fileElementId : 'file',
		error:function(request) {
			$.messager.alert('提示', "上传失败！", "info");
		},
		success : function(data) {
			console.log(data);
		}
	});
}

function deleteTeacher(){
	var teacher = $('#teacherslist').datagrid("getSelected"); 
	var grid = $('#teacherslist');  
	var options = grid.datagrid('getPager').data("pagination").options;  
	var curr = options.pageNumber;  
   jQuery.ajax({
			type : "POST",
			async : false,
			url : "<%=request.getContextPath()%>/deleteTeacherByTeacherId",
			data:{
				page:curr,
				rows:'10',
				teacherId:teacher.userId
			},
			error : function(request) {
			},
			success : function(data) {
				$("#teacherslist").datagrid("reload",data);
			}
	});
	
}
</script>
</body>
</html>