<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课程管理</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyui/themes/default/easyui.css"></link>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyui/themes/icon.css"></link>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyui/demo/demo.css"></link>
<script type="text/javascript" src="<%=request.getContextPath()%>/easyui/jquery.min.js"></script>
<%-- <link rel="stylesheet" href="<%=request.getContextPath() %>/blhrf/css/style.css" /> --%>
<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/jquery-2.1.0.js"></script>
 --%><script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.form.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/jquery.mobile-1.4.5.min.js"></script>

<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/easyui/jquery.easyui.min.js"></script>
 --%>
 <script type="text/javascript" src="http://www.jeasyui.net/Public/js/easyui/jquery.easyui.min.js"></script>
 <script language="javascript" type="text/javascript"
	src="<%=request.getContextPath()%>/easyui/locale/easyui-lang-zh_CN.js"></script>
 </head>
<body>
<div id ="coursePanel" class="easyui-panel" style="width:100%; ">
			<table id="ttbd" class="easyui-datagrid" title="课程管理"
							style="width: 100%; height: 380px" singleSelect=true rownumbers=true
							 url='<%=request.getContextPath()%>/queryCourseInfo' pagination="true"
							toolbar="#tb">
							<thead>
								<tr>
								    <th field="course_id" hidden="true"></th>
								    <th field="course_state_code" hidden="true"></th>
									<th field="category" width="14%" align="center">课程分类</th>
									<th field="course_name" width="15%" align="center">课程名称</th>
									<th field="username" width="10%" align="center">创建者</th>
									<th field="fullname" width="15%" align="center">讲师姓名</th>
									<th field="payType" width="10%" align="center">费用</th>
									<th field="create_time" width="15%" align="center">创建时间</th>
									<th field="courseState" width="10%" align="center">课程进度</th>
									<th field="available" width="10%" align="center">课程状态</th>
								</tr>
							</thead>
						</table>

						<div id="tb">
							<!-- <a href="#" class="easyui-linkbutton" iconCls="icon-cut"
								plain="true" onclick="hide()">屏蔽</a> 
								<a href="#" class="easyui-linkbutton" iconCls="icon-edit"
								plain="true" onclick="openCourseDetail()">编辑</a>  -->
								<a href="#" class="easyui-linkbutton" iconCls="icon-remove"
								plain="true" onclick="deletecourseInfo()">删除</a>
								  <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" 
						    onclick="creatBroadcast()">创建录入课程简介</a>
								  <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" 
						    onclick="updateCourseProfile()">修改课程简介</a>
						      <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" 
						    onclick="inputCourseContent()">录入课程内容</a>
						    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" 
						    onclick="spCourseContent()">审批课程</a>
						</div>
</div>

<div id="openCourse" class="easyui-dialog" title="课程详情" style="width:800px;height:360px; left:0,
top:10px" data-options="iconCls:'icon-save',closed:true,resizable:true,modal:true">
  <!--  <table align="center" style="width: 100%; height: 260px" >
    <tr><td style="font-size: 15px;">课程名称</td><td style="font-size: 15px;">帝王蟹</td></tr>
    <tr><td style="font-size: 15px;">课程简介</td><td style="font-size: 15px;">帝王蟹做法</td></tr>
    <tr><td style="font-size: 15px;">课程内容</td><td> -->
    
     <table id="courseDetailGrid" class="easyui-datagrid" 
							style="width: 100%; height: 260px"   pagination="true"
							toolbar="#courseDetailBar" data-options="iconCls: 'icon-edit',singleSelect: true, onClickCell: onClickCell">
							<thead>
								<tr>
 								    <th field="course_detail_id" hidden="true" editor="{type:'text',options:{required:true}}"  ></th>
<!-- 									<th field="content_item"  width="100%" align="center" ></th>
 -->								
                                	<th width="100%" align="center" data-options="field:'content_item',align:'center',editor:{type:'text',options:{required:true}}"></th>
								</tr>
							</thead>
						</table>
						
					<div id="courseDetailBar">
							<a href="#" class="easyui-linkbutton" iconCls="icon-cut"
								plain="true" onclick="hide()">屏蔽</a> 
								<a href="#" class="easyui-linkbutton" iconCls="icon-save"
								plain="true" onclick="saveupdateCourseDetail()">保存</a> 
						</div>
    <!-- </td></tr>
   </table> -->
</div>



<div id="updateCourseProfile" class="easyui-dialog" title="修改课程简介" style="width:800px;height:360px; left:0,
top:10px" data-options="iconCls:'icon-save',closed:true,resizable:true,modal:true">
    
      <center><h3>修改课程简介</h3>
   <table align="center" style="width: 100%; height: 100%" table border="1px" bordercolor="#000000" cellspacing="0px" style="border-collapse:collapse">
    <tr><td  colspan="1">课程名称</td><td colspan="3"><input  id="courseIdUCP" type="hidden"  name="courseId" /><input  id="courseNameUCP" style="width: 400px;"  type="text"  name="courseName" /></td></tr>
    <tr><td  colspan="1">课程简介</td><td  colspan="3"><textarea id="profileUCP" name="profile"  style="width: 400px;height:60px;"></textarea></td></tr>
    <tr><td  style="width: 100px; height: 20px;" >讲师</td><td>
    <select id="teacherIdUCP"  class="easyui-combobox" valueField='userId',textField='fullname',
     name="teacherId" style="width:200px;"> 
	</select> 
    </td><td >费用</td><td >
       <select id="payTypeUCP" class="easyui-combobox" name="payType" style="width:200px;"> 
		<option value="1">免费</option> 
		<option value="2">收费</option> 
	   </select> 
    </td></tr>
    <tr><td >类型</td><td colspan="3">
       <select class="easyui-combobox"  id="courseTypeUCP" style="width:200px;"> 
			<option value="成长">成长</option> 
		    <option value="健康">健康</option> 
		    <option value="美食">美食</option> 
	   </select> 
       </td></tr>
    </table>
     <input type="button" value="保存修改" onclick="saveUpdateCourseProfle('7')">
</div>




<div id="createBroadcastPanel" class="easyui-dialog" title="课程详情" style="width:600px;height:360px; left:0,
            top:10px" data-options="iconCls:'icon-save',closed:true,resizable:true,modal:true">
    <center><h3>创建课程简介</h3>
   <table align="center" style="width: 100%; height: 100%" table border="1px" bordercolor="#000000" cellspacing="0px" style="border-collapse:collapse">
    <tr><td  colspan="1">课程名称</td><td colspan="3"><input  id="courseName" style="width: 400px;" class="easyui-textbox"  type="text" name="courseName" /></td></tr>
    <tr><td  colspan="1">课程简介</td><td  colspan="3"><textarea id="profile" name="profile" style="width: 400px;height:60px;"></textarea></td></tr>
    <tr><td  style="width: 100px; height: 20px;" >讲师</td><td>
    <select id="teacherId"  class="easyui-combobox" valueField='userId',textField='fullname',
     name="teacherId" style="width:200px;"> 
	</select> 
    </td><td >费用</td><td >
       <select id="payType" class="easyui-combobox" name="payType" style="width:200px;"> 
		<option value="1">免费</option> 
		<option value="2">收费</option> 
	   </select> 
    </td></tr>
    <tr><td >类型</td><td colspan="3">
       <select class="easyui-combobox"  id="courseType" style="width:200px;"> 
			<option value="成长">成长</option> 
		    <option value="健康">健康</option> 
		    <option value="美食">心理</option> 
	   </select> 
       </td></tr>
    </table>
    <div>
    <input type="button" value="创建" onclick="creatInputCourse('7')">
    <input type="button" value="取消" onclick="canned()">
    </div>
    </center>
</div>
<div id ="spCoursePanel" class="easyui-panel" closed='true' style="width:100%; ">
	<table id="sp_grid" class="easyui-datagrid" title="待审批课程"
		style="width: 100%; height: 380px" toolbar="#tb2">
		<thead>
			<tr>
			    <th field="course_id" hidden="true"></th>
			    <th field="course_state_code" hidden="true"></th>
				<th field="course_name" width="30%" align="center">课程名称</th>
				<th field="username" width="15%" align="center">创建者</th>
				<th field="create_time" width="20%" align="center">创建时间</th>
				<th field="courseState" width="10%" align="center">课程进度</th>
				<th field="available" width="10%" align="center">课程状态</th>
			</tr>
		</thead>
	</table>

	<div id="tb2">
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit"
		plain="true" onclick="dspCourseEdit()">查看课程详情</a> 
		<a href="#" class="easyui-linkbutton" iconCls="icon-remove"
		plain="true" onclick="deleteDspCourseInfo()">删除</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" 
	    onclick="pass()">审批</a>
	    <a href="#" class="easyui-linkbutton" iconCls="icon-back" plain="true" 
	    onclick="back()">返回上一级</a>
	    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" 
						    onclick="reviewCourseContent()">审阅内容</a>
	</div>
</div>


<div id="dspCourseDetail" class="easyui-dialog" title="课程详情" style="width:600px;height:290px;left:0,
            top:10px" data-options="iconCls:'icon-save',closed:true,resizable:true,modal:true">
    
    <form id="form" method="post" style="width: 98%; height: 90%">
			<table toolbar="#bu"  align="center"  class="panel-table" border="0px"
					style="width: 98%; height: 90%;margin:10px 10px">
				<tr>
					<td style="width:25%" align="center">课程分类<input type="hidden" id="course_id" name="course_id" /></td>
					<td style="width:25%"><input class="easyui-validatebox textbox" type="text" style="width: 100%;border:0px" id="category" name="category"  readonly/></td>
					<td style="width:25%" align="center">课程名称</td>
					<td style="width:25%"><input class="easyui-validatebox textbox" type="text" style="width: 100%;" id="course_name" name="course_name" /></td>
				</tr>
				<tr>
					<td align="center">创建者</td>
					<td><input class="easyui-validatebox textbox" type="text" style="width: 100%;border:0px" id="create_person" name="create_person" readonly/></td>
					<td align="center">创建时间</td>
					<td><input class="easyui-validatebox textbox"  type="text" style="width: 100%;border:0px" id="create_time" name="create_time" readonly></td>
				</tr>
				<tr>
					<td align="center">课程进度</td>
					<td><input class="easyui-validatebox textbox" type="text" style="width: 100%;border:0px" id="courseState" name="courseState" readonly/></td>
					<td align="center">课程状态</td>
					<td><input class="easyui-validatebox textbox" type="text" style="width: 100%;border:0px" id="available" name="available" readonly/></td>
				</tr>
			</table>
			<div id="bu" align = "center">
				<a href="javascript:void(0)" class="easyui-linkbutton"	onclick="updateCourse()">保存</a>
			</div>
		</form>
</div>




<script>

document.getElementsByTagName("ui-loader")[0].style.display ="none";

  function inputCourseContent(){
	  
		var rows = $('#ttbd').datagrid("getSelections"); //获取你选择的所有行 
		if(rows == null || rows.length <= 0){
			alert("请选择录入的课程")
			return ;
		}
		// $('#inputCourse').dialog('open');
		var courseId = rows[0].course_id;
		var course_state_code = rows[0].course_state_code;
		if(course_state_code != 7){
			alert("你选着的课程状态不正确!")
			return ;
		}
		window.location.href = "<%=request.getContextPath()%>/openBackBroadcast?courseId="+courseId;
  }
  
  function reviewCourseContent(){
	  
		var rows = $('#sp_grid').datagrid("getSelections"); //获取你选择的所有行 
		if(rows == null || rows.length <= 0){
			alert("请选择录入的课程")
			return ;
		}
		// $('#inputCourse').dialog('open');
		var courseId = rows[0].course_id;
		var course_state_code = rows[0].course_state_code;
	/* 	if(course_state_code == 3 || course_state_code == 8 || course_state_code == 9){
			alert("你选着的课程已结束，不能进行录入操作")
			return ;
		} */
		window.location.href = "<%=request.getContextPath()%>/reviewCourse?courseId="+courseId;
}




function creatInputCourse(type){
	
	var courseName = document.getElementById("courseName").value;
	var profile = document.getElementById("profile").value;
	var courseType = document.getElementById("courseType").value;
	var payType = document.getElementById("payType").value;
	
	   jQuery.ajax({
			type : "POST",
			async : false,
			url : "<%=request.getContextPath()%>/createBroadcastReport",
			data:{
				courseName:courseName,
				profile:profile,
				teacherId:teacherId,
				courseType:courseType,
				payType:payType,
				courseState: type,
				category: '1'
			},
			error : function(request) {
				alert(request);
			},
			success : function(data) {
				if("1" == data)
					 jQuery.ajax({
						type : "POST",
						async : false,
						url : '<%=request.getContextPath()%>/queryBroadcastCourseb',
						data:{
						},
						error : function(request) {
							alert(request);
						},
						success : function(data) {
								$("#ttbd").datagrid("reload",data);
								$('#createBroadcastPanel').dialog('close');
						}
				});
			}
	});
	
	
}

$.extend($.fn.datagrid.methods, {
	editCell: function(jq,param){
		return jq.each(function(){
			var opts = $(this).datagrid('options');
			var fields = $(this).datagrid('getColumnFields',true).concat($(this).datagrid('getColumnFields'));
			for(var i=0; i<fields.length; i++){
				var col = $(this).datagrid('getColumnOption', fields[i]);
				col.editor1 = col.editor;
				if (fields[i] != param.field){
					col.editor = null;
				}
			}
			$(this).datagrid('beginEdit', param.index);
			for(var i=0; i<fields.length; i++){
				var col = $(this).datagrid('getColumnOption', fields[i]);
				col.editor = col.editor1;
			}
		});
	}
});

var editIndex = undefined;
function endEditing(){
	if (editIndex == undefined){return true}
	if ($('#courseDetailGrid').datagrid('validateRow', editIndex)){
		$('#courseDetailGrid').datagrid('endEdit', editIndex);
		editIndex = undefined;
		return true;
	} else {
		return false;
	}
}
function onClickCell(index, field){
	if (endEditing()){
		$('#courseDetailGrid').datagrid('selectRow', index)
				.datagrid('editCell', {index:index,field:field});
		editIndex = index;
	}
}


function saveupdateCourseDetail(){
   endEditing();
   var grid = $('#courseDetailGrid');  
   var options = grid.datagrid('getPager').data("pagination").options;  
   var curr = options.pageNumber;  
   var updated = $('#courseDetailGrid').datagrid('getChanges', updated);
   if(updated.length == 0){
	   alert("没有需要更新的数据")
	   return;
   }
   jQuery.ajax({
		type : "POST",
		async : false,
		url : "<%=request.getContextPath()%>/saveupdateCourseDetail",
		data:{
			page:curr,
			rows:'10',
			course_detail:'{"updateData":'+JSON.stringify(updated)+'}'
		},
		error : function(request) {
			alert(request);
		},
		success : function(data) {
			$("#courseDetailGrid").datagrid("reload",data);
		}
	});
}


function deletecourseInfo(){
	
	if(!window.confirm('你确定要删除该条课程信息吗？'))
		return;
	
	var rows = $('#ttbd').datagrid("getSelections"); //获取你选择的所有行 
	 var grid = $('#ttbd');  
	 var options = grid.datagrid('getPager').data("pagination").options;  
	 var curr = options.pageNumber;  
   jQuery.ajax({
			type : "POST",
			async : false,
			url : "<%=request.getContextPath()%>/deleteCourseByCourseId",
			data:{
				page:curr,
				rows:'10',
				course_id:rows[0].course_id
			},
			error : function(request) {
			},
			success : function(data) {
				$("#ttbd").datagrid("reload",data);
			}
	});
	
}


function openCourseDetail(){
	
	 $('#openCourse').dialog('open');
	var rows = $('#ttbd').datagrid("getSelections"); //获取你选择的所有行 
	 var grid = $('#ttbd');  
	 var options = grid.datagrid('getPager').data("pagination").options;  
	 var curr = options.pageNumber;  
    jQuery.ajax({
			type : "POST",
			async : false,
			url : "<%=request.getContextPath()%>/queryCourseDetailInfo",
			data:{
				page:curr,
				rows:'10',
				course_id:rows[0].course_id
			},
			error : function(request) {
				alert(request);
			},
			success : function(data) {
				$("#courseDetailGrid").datagrid("loadData",data);
			}
	});

}


function inputBroadcast(){
	   
	var rows = $('#ttbd').datagrid("getSelections"); //获取你选择的所有行 
	if(rows == null || rows.length <= 0){
		alert("请选择未开播的课程")
		return ;
	}
	
	var courseId = rows[0].course_id;
	var courseState = rows[0].course_status;
	
	if(courseState == 1||courseState == 4||courseState == 5){
		window.location.href = "<%=request.getContextPath()%>/openBackBroadcast?courseId="+courseId;
	}else{
		alert("请选择未开播的课程")
		return ;
	}
	
}



function creatBroadcast(){
	   
	   $('#createBroadcastPanel').dialog('open');
	   $('#teacherId').combobox({   
	         url:'<%=request.getContextPath()%>/queryTeachers',
	         valueField:'userId',   
	         textField:'fullname',
	         onChange: function (n,o) {
	        	// alert($('#teacherId').combobox('getValue'));
	        	 teacherId = $('#teacherId').combobox('getValue');
	        	 }
	     }); 
}


function hide(){
	var rows = $('#ttbd').datagrid("getSelections"); //获取你选择的所有行 
	 var grid = $('#ttbd');  
	 var options = grid.datagrid('getPager').data("pagination").options;  
	 var curr = options.pageNumber;  
    jQuery.ajax({
			type : "POST",
			async : false,
			url : "<%=request.getContextPath()%>/hideCourse",
			data:{
				page:curr,
				rows:'10',
				course_id:rows[0].course_id
			},
			error : function(request) {
				
			},
			success : function(data) {
				$("#ttbd").datagrid("reload",data);
			}
	});
	
}
 
//显示待审批课程
function spCourseContent(){
	$('#coursePanel').panel('close');
	$("#sp_grid").datagrid({
		url : '<%=request.getContextPath()%>/querySpCourseInfo',
		pagination : 'true',
		singleSelect : 'true',
		rownumbers : true
	});
	$('#spCoursePanel').panel('open');
}

function updateCourseProfile(){
	

	 $('#updateCourseProfile').dialog('open');
	var rows = $('#ttbd').datagrid("getSelections"); //获取你选择的所有行 
	 var grid = $('#ttbd');  
	 var options = grid.datagrid('getPager').data("pagination").options;  
	 var curr = options.pageNumber;  
	 
	   $('#teacherIdUCP').combobox({   
	         url:'<%=request.getContextPath()%>/queryTeachers',
	         valueField:'userId',   
	         textField:'fullname',
	         onChange: function (n,o) {
	        	// alert($('#teacherId').combobox('getValue'));
	        	 teacherId = $('#teacherId').combobox('getValue');
	        	 }
	     }); 
	   
   jQuery.ajax({
			type : "GET",
			async : false,
			url : "<%=request.getContextPath()%>/updateCourseProfile",
			data:{
				courseId:rows[0].course_id
			},
			error : function(request) {
				alert(request);
			},
			success : function(data) {
				 //JSON.parse(str);
				 document.getElementById("courseNameUCP").value = data.course_name;
				 document.getElementById("profileUCP").value = data.course_profile;
				 document.getElementById("courseIdUCP").value = data.course_id;
				 $('#teacherIdUCP').combobox('select', data.teacher_id);
				 $('#payTypeUCP').combobox('select', data.pay_type);
				 $('#courseTypeUCP').combobox('select', data.course_type);
				//$("#courseDetailGrid").datagrid("loadData",data);
			}
	});
}

	//var teacher IdUCP;

function saveUpdateCourseProfle(){
	
	
	var courseId = document.getElementById("courseIdUCP").value;
	var courseName = document.getElementById("courseNameUCP").value;
	var profile = document.getElementById("profileUCP").value;
	var payType = document.getElementById("payTypeUCP").value;
	var teacherIdUCP = $('#teacherIdUCP').combobox('getValue');
	var payType = $('#payTypeUCP').combobox('getValue');

	<%--   $('#teacherIdUCP').combobox({   
	         url:'<%=request.getContextPath()%>/queryTeachers',
	         valueField:'userId',   
	         textField:'fullname',
	         onChange: function (n,o) {
	        	// alert($('#teacherId').combobox('getValue'));
	        	 teacherIdUCP = $('#teacherIdUCP').combobox('getValue');
	        	 }
	     });  --%>
	//var teacherId = document.getElementById("teacherIdUCP").value;
	var courseType = $('#courseTypeUCP').combobox('getValue');
	
	   jQuery.ajax({
			type : "POST",
			async : false,
			url : "<%=request.getContextPath()%>/saveUpdateCourseProfile",
			data:{
				courseId:courseId,
				courseName:courseName,
				profile:profile,
				teacherId:teacherIdUCP,
				courseType:courseType,
				payType:payType
			},
			error : function(request) {
				alert(request);
			},
			success : function(data) {
				window.location.href = "<%=request.getContextPath()%>/blhrb/courseManage.jsp";					
			}
	});
}


//待审批课程编辑
function dspCourseEdit(){
	var row = $("#sp_grid").datagrid('getSelected'); //获取你选择的所有行 
    jQuery.ajax({
			type : "POST",
			async : false,
			url : "<%=request.getContextPath()%>/queryDspCourseDetailInfo",
			data:{course_id:row.course_id},
			error : function(request) {
				alert(request);
			},
			success : function(data) {
				$('#dspCourseDetail').dialog('open');
				$("#form").form("load",data[0]);
				//lll
			}
	});
}

function deleteDspCourseInfo(){
	var rows = $('#sp_grid').datagrid("getSelections"); //获取你选择的所有行 
	 var grid = $('#sp_grid');  
	 var options = grid.datagrid('getPager').data("pagination").options;  
	 var curr = options.pageNumber;  
   jQuery.ajax({
			type : "POST",
			async : false,
			url : "<%=request.getContextPath()%>/deleteCourseByCourseId",
			data:{
				page:curr,
				rows:'10',
				course_id:rows[0].course_id
			},
			error : function(request) {
			},
			success : function(data) {
				$("#sp_grid").datagrid("reload",data);
			}
	});
	
}

function pass(){
	var row = $("#sp_grid").datagrid('getSelected');
	if(row == null){
		jQuery.messager.alert("提示信息", "请选一个待审批课程", "info");
	}else{
		var grid = $('#ttbd');  
		 var options = grid.datagrid('getPager').data("pagination").options;  
		 var curr = options.pageNumber;  
		$.messager.confirm('提示','确定该课程通过审批吗？',function(r){
		    if (r){
		    	jQuery.ajax({
					type : "POST",
					async : false,
					url : "<%=request.getContextPath()%>/passCourse",
					data:{
						page:curr,
						rows:'10',
						course_id:row.course_id},
					error : function(request) {
						jQuery.messager.alert("提示信息", request, "error");
					},
					success : function(data) {
						$("#sp_grid").datagrid("reload",data);
						jQuery.messager.alert("提示信息", "审批成功", "info");
					}
			});
		    }
		});
	}
	
}

function back(){
	$('#spCoursePanel').panel('close');
	$("#ttbd").datagrid({
		url : '<%=request.getContextPath()%>/queryCourseInfo'
	});
	$('#coursePanel').panel('open');
}

function updateCourse(){

}
</script>
</body>

</html>