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
 
 <script type="text/javascript">
 
   function closeCourse(){
	   $('#openCourse').dialog('close');
   }
   
   var teacherId;
   
   function deleteCourse(courseId){
	   if(window.confirm('你确定要删除该条直播吗？')){
	           jQuery.ajax({
					type : "POST",
					async : false,
					url : "<%=request.getContextPath()%>/deleteCourseByCourseIdb",
					data:{
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
   
 /*   $('#cc').combobox({ 
	   url:'combobox_data.json', 
	   valueField:'id', 
	   textField:'text' 
	   });  */
   
   
   function pushNotice(courseId){
	   
	   jQuery.ajax({
			type : "POST",
			async : false,
			url : "<%=request.getContextPath()%>/pushMessage",
			data:{
				courseId:courseId
			},
			error : function(request) {
				alert(request);
			},
			success : function(data) {
				if("1" == data)
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
   
   function openCourseDetail(){
	   
	   $('#openCourse').dialog('open');
	<%-- 	var rows = $('#ttbd').datagrid("getSelections"); //获取你选择的所有行 
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
		}); --%>
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
									<th field="coure_type" width="5%" align="center">类别</th>
									<th field="create_person" width="5%" align="center">创建者</th>
									<th field="create_time" width="13%" align="center">创建时间</th>
									<th field="fullname" width="5%" align="center">讲师姓名</th>
									<th field="play_time" width="13%" align="center">开播时间</th>
									<th field="person_limit" width="5%" align="center">人数限制</th>
									<th field="course_state" width="8%" align="center">课程状态</th>
									<th field="handler" width="20%" align="left">操作</th>
								</tr>
							</thead>
						</table>
	                    <div id="tb">
						  <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" 
						  onclick="creatBroadcast()">创建直播</a> 
						  <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" 
						    onclick="inputBroadcast()">录入直播</a>
						</div>
						
						
						
<div id="openCourse" class="easyui-dialog" title="课程详情" style="width:600px;height:360px; left:0,
top:10px" data-options="iconCls:'icon-save',closed:true,resizable:true,modal:true">
    <center><h3>直播课程详情</h3>
   <table align="center" style="width: 100%; height: 100%" table border="1px" bordercolor="#000000" cellspacing="0px" style="border-collapse:collapse">
    <tr><td style="font-size: 15px"  colspan="1">课程名称</td><td colspan="3">孩子咳嗽怎么办</td></tr>
    <tr><td style="font-size: 15px;" colspan="1">课程简介</td><td  colspan="3">帝王蟹做法</td></tr>
    <tr><td style="font-size: 15px; width: 100px; height: 20px;" >讲师</td><td></td><td style="font-size: 15px; width: 100px;">开播时间</td><td></td></tr>
    <tr><td style="font-size: 15px;">类型</td><td></td><td style="font-size: 15px;">费用</td><td></td></tr>
    <tr><td style="font-size: 15px;">人数限制</td><td></td><td style="font-size: 15px;">课程状态</td><td></td></tr>
    <tr><td style="font-size: 15px;">创建者</td><td></td><td style="font-size: 15px;">预告审核人</td><td></td></tr>
    <tr><td style="font-size: 15px;">课程审核人</td><td></td><td style="font-size: 15px;">开播时间</td><td></td></tr>
    <tr><td style="font-size: 15px;">预告审核时间</td><td></td><td style="font-size: 15px;">课程审核时间</td><td></td></tr>
    </table>
    <input type="button" value="关闭" onclick="closeCourse()">
    </center>
</div>

<div id="createBroadcastPanel" class="easyui-dialog" title="课程详情" style="width:600px;height:360px; left:0,
            top:10px" data-options="iconCls:'icon-save',closed:true,resizable:true,modal:true">
    <center><h3>创建直播预告</h3>
   <table align="center" style="width: 100%; height: 100%" table border="1px" bordercolor="#000000" cellspacing="0px" style="border-collapse:collapse">
    <tr><td  colspan="1">课程名称</td><td colspan="3"><input  id="courseName" style="width: 400px;" class="easyui-textbox"  type="text" name="courseName" /></td></tr>
    <tr><td  colspan="1">课程简介</td><td  colspan="3"><textarea id="profile" name="profile" style="width: 400px;height:60px;"></textarea></td></tr>
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

</body>
</html>