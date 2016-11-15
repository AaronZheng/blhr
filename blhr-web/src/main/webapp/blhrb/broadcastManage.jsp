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
  <script language="javascript" type="text/javascript"
	src="<%=request.getContextPath()%>/easyui/locale/easyui-lang-zh_CN.js"></script>
 <script type="text/javascript">
 
 	
 
   function closeCourse(){
	  /*  $('#openCourse').dialog('close'); */
	   $('#updateCourse').dialog('close');
	  <%--  jQuery.ajax({
			type : "POST",
			async : false,
			url : "<%=request.getContextPath()%>/editBroadcast",
			data:{
				page:curr,
				rows:pageSize,
				course_id:courseId
			},
			error : function(request) {
				alert(request);
			},
			success : function(data) {
				   $("#ttbd").datagrid("reload");
				   $('#openCourse').dialog('close');
			}
		}); --%>
   }
   
   var teacherId;
   
   function deleteCourse(courseId){
		 var options = $('#ttbd').datagrid('getPager').data("pagination").options;  
		 var curr = options.pageNumber;  
		 var pageSize = Math.ceil(options.pageSize);
	   if(window.confirm('你确定要删除该条直播吗？')){
	           jQuery.ajax({
					type : "POST",
					async : false,
					url : "<%=request.getContextPath()%>/deleteCourseByCourseIdb",
					data:{
						page:curr,
						rows:pageSize,
						course_id:courseId
					},
					error : function(request) {
						alert(request);
					},
					success : function(data) {
						$("#ttbd").datagrid("loadData",data);
					}
			});
        }else{
           return false;
       }
   }
   
   function editReport(courseId){
	 var options = $('#ttbd').datagrid('getPager').data("pagination").options;  
	 var curr = options.pageNumber;  
	 var pageSize = Math.ceil(options.pageSize);
	   if(window.confirm('你确定要发布直播预告？')){
	 jQuery.ajax({
			type : "POST",
			async : false,
			url : "<%=request.getContextPath()%>/updateCourseState",
			data:{
				page:curr,
				rows:pageSize,
				course_id:courseId
			},
			error : function(request) {
				alert(request);
			},
			success : function(data) {
				$("#ttbd").datagrid("loadData",data);
			}
	});
	   }
   }
   
 /*   $('#cc').combobox({ 
	   url:'combobox_data.json', 
	   valueField:'id', 
	   textField:'text' 
	   });  */
   
   
   function pushNotice(courseId){
		   var options = $('#ttbd').datagrid('getPager').data("pagination").options;  
			 var curr = options.pageNumber;  
			 var pageSize = Math.ceil(options.pageSize);
	   jQuery.ajax({
			type : "POST",
			async : false,
			url : "<%=request.getContextPath()%>/pushMessage",
			data:{
				page:curr,
				rows:pageSize,
				courseId:courseId
			},
			error : function(request) {
				alert(request);
			},
			success : function(data) {
				data = eval("("+data+")")
				$("#ttbd").datagrid("loadData",data);
					alert("推送成功！");
			}
	});
   }
	   
   
	    function creatBroadcastaction(type){
	    	
	    	var courseName = document.getElementById("courseName").value;
	    	var profile = document.getElementById("profile").value;
	    	//var teacherId = document.getElementById("teacherId").value;
	    	var playTime = document.getElementById("playTime").value;
	    	var courseType = document.getElementById("courseType").value;
	    	var payType = document.getElementById("payType").value;
	    	var personLimit = document.getElementById("personLimit").value;
	    	
	 	   jQuery.ajax({
	 			type : "POST",
	 			async : false,
	 			url : "<%=request.getContextPath()%>/createBroadcastReport",
	 			data:{
	 				courseName:courseName,
	 				profile:profile,
	 				teacherId:teacherId,
	 				playTime:playTime,
	 				courseType:courseType,
	 				payType:payType,
	 				personLimit:personLimit,
	 				courseState: type
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
	    
	    function creatAndPassBroadcast(){
	    	
	    }
	    
	    function canned(){
	    	  $('#openCourse').dialog('close');
	    }
   
   function openCourseDetail(courseId){
	   
	   $('#openCourse').dialog('open');
	    jQuery.ajax({
				type : "POST",
				async : false,
				url : "<%=request.getContextPath()%>/broadcastCourseDetail",
				data:{
					course_id:courseId
				},
				error : function(request) {
					alert(request);
				},
				success : function(data) {
					$('#form1').form('load', data);
				}
		});
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
	   
	<%--    jQuery.ajax({
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
	});  --%>
   }
   
   function inputBroadcast(){
	   
		var rows = $('#ttbd').datagrid("getSelections"); //获取你选择的所有行 
		if(rows == null || rows.length <= 0){
			alert("请选择未开播的课程");
			return ;
		}
		var courseId = rows[0].course_id;
		var courseState = rows[0].course_status;
		
		if(courseState == 1||courseState == 4||courseState == 5){
			window.location.href = "<%=request.getContextPath()%>/openBackBroadcast?courseId="+courseId;
		}else{
			alert("请选择未开播的课程");
			return ;
		}
		
   }
   function editBroadcast(courseId){
	   $('#updateCourse').dialog('open');
	   var options = $('#ttbd').datagrid('getPager').data("pagination").options;  
	   var curr = options.pageNumber;
	   var pageSize = Math.ceil(options.pageSize);
	    jQuery.ajax({
				type : "POST",
				async : false,
				url : "<%=request.getContextPath()%>/queryCourse",
				data:{
					page:curr,
					rows:pageSize,
					course_id:courseId
				},
				error : function(request) {
					alert(request);
				},
				success : function(data) {
					$('#ff').form('load', data);
				}
		});
   }
   
   function saveCourse(){
	   var courseId = document.getElementById("course_id").value;
		var courseName = document.getElementById("course_name").value;
		var profile = document.getElementById("course_profile").value;
		var payType = document.getElementById("pay_type").value;
		var teacherId = $('#teacher_id').combobox('getValue');
		var courseType = $('#course_type').combobox('getValue');
		var broadcastTime = $('#broadcast_time').datetimebox('getValue');	
		var personLimit = document.getElementById("person_limit").value;
		
		if(courseName.length >14){
			alert("课程名称不能超过14个字！");
			return;
		}
		var  a = new Date(broadcastTime);
		var  b = new Date();
		if(a<b){
			alert("开播时间不能比当前时间早！");
			return;
		}
		
	   jQuery.ajax({
			type : "POST",
			async : false,
			url : "<%=request.getContextPath()%>/updateCourse",
			data:{
				courseId:courseId,
				courseName:courseName,
				profile:profile,
				payType:payType,
				teacherId:teacherId,
				courseType:courseType,
				broadcastTime:broadcastTime,
				personLimit:personLimit
			},
			error : function(request) {
				alert(request);
			},
			success : function(data) {
				if(data==1){
					window.location.href = "<%=request.getContextPath()%>/blhrb/broadcastManage.jsp";
				}else{
					alert("保存失败")
				}
			}
		});
   }
   
   function datetimeFormatter(value){
	   if(value != null){
		   date = value.substring(0,19);
		   return date;
	   }
	   return null;
   }
   
   
  
 </script>
 
</head>
<body>
 
<table id="ttbd" class="easyui-datagrid" title="课程管理"
							style="width: 100%; height: 380px" singleSelect=true rownumbers=true
							 url='<%=request.getContextPath()%>/queryBroadcastCourseb' pagination="true"
							 toolbar="#tb">
							<thead>
								<tr>
								    <th field="course_id" hidden="true"></th>
								    <th field="course_status" hidden="true"></th>
									<th field="course_name" width="15%" align="center">课程名称</th>
									<th field="pay_type" width="5%" align="center">费用</th>
									<th field="course_type" width="5%" align="center">类别</th>
									<th field="create_person" width="5%" align="center">创建者</th>
									<th field="create_time" width="13%" align="center" formatter="datetimeFormatter">创建时间</th>
									<th field="fullname" width="5%" align="center">讲师姓名</th>
									<th field="broadcast_time" width="13%" align="center" formatter="datetimeFormatter">开播时间</th>
									<th field="person_limit" width="5%" align="center">人数限制</th>
									<th field="course_state" width="8%" align="center">课程状态</th>
									<th field="handler" width="20%" align="left">操作</th>
								</tr>
							</thead>
						</table>
	                    <div id="tb">
						 <!--<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" 
						  onclick="creatBroadcast()">创建直播</a> 
						    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" 
						    onclick="inputBroadcast()">录入直播</a>
						    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" 
						    onclick="deleteCourse()">删除直播</a>-->
						    
						    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" 
						  onclick="creatBroadcast()">创建直播预告</a> 
						  
						</div>
						
						
						
<div id="openCourse" class="easyui-dialog" title="课程详情" style="width:600px;height:360px; left:0,
top:10px" data-options="iconCls:'icon-save',closed:true,resizable:true,modal:true">
    <form id="form1" method="post">
    <table align="center" style="width:500px;height:300px; ">
    	<tr>
			<th>课程名称</th>
			<td colspan="3"><input class="easyui-validatebox  textbox" id="courseName"
				name="courseName" type="text" style="width:390px; border-left:0px;border-top:0px;border-right:0px;border-bottom:1px" readonly></input></td>
		</tr>
		<tr>
			<th>课程简介</th>
			<td colspan="3"><textarea  id="courseProfile"
				name="courseProfile" type="text" wrap="virtual"  style="width:386px;height:70px;padding: 2px; overflow:auto; background-attachment: fixed; background-repeat: no-repeat; border-style: solid; border-color: #FFFFFF"></textarea></td>
		</tr>
		<tr>
			<th>讲师</th>
			<td><input class="easyui-validatebox  textbox"  type="text" id="teacherName" name="teacherName" 
						style ="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px" readonly></td>
			<th>开播时间</th>
			<td><input class="easyui-validatebox  textbox" type="text"  id ="broadcastTime" name="broadcastTime" 
			style ="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px" readonly></td>
		</tr>
		<tr>
			<th>类型</th>
			<td><input class="easyui-validatebox  textbox" type="text"  id ="courseType" name="courseType" 
			style ="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px" readonly></td>
			<th>人数限制</th>
			<td><input class="easyui-validatebox  textbox" type="text"  id = "personLimit" name="personLimit" 
			style ="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px" readonly></td>
		</tr>
		<tr>
			<th>收费</th>
			<td><input class="easyui-validatebox  textbox" type="text"  id = "payType" name="payType" 
			style ="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px" readonly></td>
		</tr>
		<tr>
		<td colspan="4" align="center"><input type="button" value="关闭" onclick="canned()" /></td>
		</tr>
    </table>
    </form>
</div>

<div id="createBroadcastPanel" class="easyui-dialog" title="创建直播" style="width:600px;height:360px; left:0,
            top:10px" data-options="iconCls:'icon-save',closed:true,resizable:true,modal:true">
    <center><h3>创建直播预告</h3>
   <table align="center" style="width: 100%; height: 100%" table border="1px" bordercolor="#000000" cellspacing="0px" style="border-collapse:collapse">
    <tr><td  colspan="1">课程名称</td><td colspan="3"><input  id="courseName" style="width: 400px;" class="easyui-textbox"  type="text" name="courseName" /></td></tr>
    <tr><td  colspan="1">课程简介</td><td  colspan="3"><textarea id="profile" name="profile"  style="width: 400px;height:60px;"></textarea></td></tr>
    <tr><td  style="width: 100px; height: 20px;" >讲师</td><td>
    <select id="teacherId"  class="easyui-combobox" valueField='userId',textField='fullname',
     name="teacherId" style="width:200px;"> 
	</select> 
    </td><td style="width: 100px;">开播时间</td><td><input id="playTime" name="playTime"  class="easyui-datebox"></input></td></tr>
    <tr><td >类型</td><td>
       <select class="easyui-combobox"  id="courseType" style="width:200px;"> 
			<option value="成长">成长</option> 
		    <option value="健康">健康</option> 
		    <option value="美食">美食</option> 
	   </select> 
       </td><td >费用</td><td>
       <select id="payType" class="easyui-combobox" name="payType" style="width:200px;"> 
		<option value="1">收费</option> 
		<option value="2">免费</option> 
	   </select> 
    </td></tr>
    <tr><td >人数限制</td><td colspan="3"><input class="easyui-textbox" id="personLimit"   type="text" name="personLimit" /></td></tr>
    </table>
    <div>
    <input type="button" value="创建" onclick="creatBroadcastaction('1')">
    <input type="button" value="创建并通过审核" onclick="creatBroadcastaction('4')">
    <input type="button" value="取消" onclick="canned()">
    </div>
    </center>
</div>

<div id="updateCourse" class="easyui-dialog" title="编辑直播课程" style="width:600px;height:360px; left:0,
top:10px" data-options="iconCls:'icon-save',closed:true,resizable:true,modal:true">
    <form id="ff" method="post">
    <table border="0" align="center" style="width:500px;height:300px; ">
    	<tr>
			<th>课程名称<input type="hidden" id="course_id" name="course_id"></th>
			<td colspan="3"><input class="easyui-validatebox  textbox" id="course_name"
				name="course_name" type="text" required=true missingMessage="不能为空" validType="length[0,14]"
				invalidMessage="最大长度不能超过14"  style="width:390px"></input></td>
		</tr>
		<tr>
			<th>课程简介</th>
			<td colspan="3"><textarea   id="course_profile"
				name="course_profile" type="text" required=true missingMessage="不能为空" wrap="virtual" style="width:386px;height:70px;padding: 2px; "></textarea ></td>
		</tr>
		<tr>
			<th>讲师</th>
			<td><input id="teacher_id" class="easyui-combobox" name="teacher_id"
       			 data-options="valueField:'userId',textField:'fullname',url:'<%=request.getContextPath()%>/queryTeachers'"></td>
			<th>开播时间</th>
			<td><input class="easyui-datetimebox" id ="broadcast_time" name="broadcast_time" ></td>
		</tr>
		<tr>
			<th>类型</th>
			<td><select id="course_type" class="easyui-combobox" >
			 <option value="健康">健康</option>
			 <option value="成长">成长</option>
			 <option value="心理">心理</option>
			</select></td>
			<th>人数限制</th>
			<td><input class="easyui-validatebox  textbox" id = "person_limit" name="person_limit" ></td>
		</tr>
		<tr>
			<th>收费</th>
			<td><select id="pay_type" class="easyui-combobox" >
			 <option value="1">免费</option>
			 <option value="2">收费</option>
			</select></td>
		</tr>
		<tr>
		<td colspan="2"><input type="button" value="确认" onclick="saveCourse()" /></td>
		<td colspan="2"><input type="button" value="取消" onclick="closeCourse()" /></td>
		</tr>
    </table>
    </form>
</div>
</body>
</html>