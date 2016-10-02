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
 
 </head>
<body>

<table id="ttbd" class="easyui-datagrid" title="课程管理"
							style="width: 100%; height: 380px" singleSelect=true rownumbers=true
							 url='<%=request.getContextPath()%>/queryCourseInfo' pagination="true"
							toolbar="#tb">
							<thead>
								<tr>
								    <th field="course_id" hidden="true"></th>
								    <th field="course_state_code" hidden="true"></th>
									<th field="category" width="14%" align="center">课程分类</th>
									<th field="course_name" width="30%" align="center">课程名称</th>
									<th field="username" width="15%" align="center">创建者</th>
									<th field="create_time" width="20%" align="center">创建时间</th>
									<th field="courseState" width="10%" align="center">课程进度</th>
									<th field="available" width="10%" align="center">课程状态</th>
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
								  <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" 
						    onclick="creatBroadcast()">创建录入课程简介</a>
						      <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" 
						    onclick="inputCourseContent()">录入课程内容</a>
						</div>


<div id="openCourse" class="easyui-dialog" title="课程详情" style="width:800px;height:360px; left:0,
top:10px" data-options="iconCls:'icon-save',closed:true,resizable:true,modal:true">
   <table align="center" style="width: 100%; height: 260px" >
    <tr><td style="font-size: 15px;">课程名称</td><td style="font-size: 15px;">帝王蟹</td></tr>
    <tr><td style="font-size: 15px;">课程简介</td><td style="font-size: 15px;">帝王蟹做法</td></tr>
    <tr><td style="font-size: 15px;">课程内容</td><td>
    
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
    </td></tr>
   </table>
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
		<option value="1">收费</option> 
		<option value="2">免费</option> 
	   </select> 
    </td></tr>
    <tr><td >类型</td><td colspan="3">
       <select class="easyui-combobox"  id="courseType" style="width:200px;"> 
			<option value="成长">成长</option> 
		    <option value="健康">健康</option> 
		    <option value="美食">美食</option> 
	   </select> 
       </td></tr>
    </table>
    <div>
    <input type="button" value="创建" onclick="creatInputCourse('7')">
    <input type="button" value="取消" onclick="canned()">
    </div>
    </center>
</div>







<!--  录入课程开始 -->


<%-- 
<div id="inputCourse" class="easyui-dialog" title="课程详情" style="width:600px;height:400px; 
             left:0,top:10px" data-options="iconCls:'icon-save',closed:true,resizable:true,modal:true">
 
   <div class="titleTop">
		<img src="<%=request.getContextPath() %>/blhrf/img/zb.png" class="zbImg">后台录入课程 <span class="topText"></span>
		<a class="sukc" href="<%=request.getContextPath() %>/endCourse?courseId=${courseId}">结束课程</a>
  </div>

		<div class="watchDiv">
			<div class="l_title">${courseName}</div>
			<div class="l_content">
				<div class="l_content_coonn">
					<div class="kjgyfuy">
		
					<div class="row abcd"  style="display: none;">
						<div class="san_zuob">
							<img src="<%=request.getContextPath() %>/blhrf/img/san_smalltou.png" />
						</div>
						<div class="qqright">
							<div class="qqsky qqvoice">
								<img class="qqsky_fri" src="<%=request.getContextPath() %>/blhrf/img/jt_jt.png" />
								<div>
									<div class="voice_move">
										<img src="<%=request.getContextPath() %>/blhrf/img/voice.png" class="voice">
									</div>
									<div class="voice_moveooo">
										<img src="<%=request.getContextPath() %>/blhrf/img/voice.png" class="voice">
									</div>
								</div>
								<div class="qqvoice_hitit"></div>
								<label>11"</label>
								<em></em>
							</div>
						</div>
					</div>
					
							
				<c:forEach items="${courseItem }" var="list">
					
				 <c:if test="${list.content_type == 't'}">
					<div class="row">
						<div class="san_zuob">
							<img src="<%=request.getContextPath() %>/blhrf/img/san_smalltou.png" />
						</div>
						<div class="qqright">
							<div class="qqsky">
								<img class="qqsky_fri" src="<%=request.getContextPath() %>/blhrf/img/jt_jt.png" />
								<div class="qqtext">${list.content_item }
								</div>
							</div>
						</div>
					</div>
				 </c:if>
				 
				  <c:if test="${list.content_type == 'p'}">
					<div class="row">
						<div class="san_zuob">
							<img src="<%=request.getContextPath() %>/blhrf/img/san_smalltou.png" />
						</div>
						<div class="qqright">
							<div class="qqsky">
								<img class="qqsky_fri" src="<%=request.getContextPath() %>/blhrf/img/jt_jt.png" />
								<img src="<%=request.getContextPath() %>${list.content_item }" class="contentImg"></img>
							</div>
						</div>
					</div>
				 </c:if>
				 
				  <c:if test="${list.content_type == 'v'}">
					<div class="row"  onclick="palyVoice('${list.content_item }')">
						<div class="san_zuob">
							<img src="<%=request.getContextPath() %>/blhrf/img/san_smalltou.png" />
						</div>
						<div class="qqright">
							<div class="qqsky qqvoice">
								<img class="qqsky_fri" src="<%=request.getContextPath() %>/blhrf/img/jt_jt.png" />
								<div>
									<div class="voice_move">
										<img src="<%=request.getContextPath() %>/blhrf/img/voice.png" class="voice">
									</div>
									<div class="voice_moveooo">
										<img src="<%=request.getContextPath() %>/blhrf/img/voice.png" class="voice">
									</div>
								</div>
								<div class="qqvoice_hitit"></div>
								<label>11"</label>
								<em></em>
							</div>
						</div>
					</div>
				 </c:if>
			    </c:forEach>
					
					<div id="extendDiv" class="extendDiv"></div>
					<div id="voiceTmp" class="voiceTmp" style="display: none;"></div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="foot_foot">
			<div class="foot_footleft">
			<form  id="uploadvioce" action="<%=request.getContextPath() %>/ChatServlet" method="post" enctype="multipart/form-data">
			    <input type="file"  name="voicename" id="btn_file"  accept="audio/mp3" style="display:none">
			    <input type="hidden" name="courseId" value="${courseId}">
			    <input type="hidden" name="courseType" value="v">
				<img src="<%=request.getContextPath() %>/blhrf/img/kkkk_zuo.jpg" onclick="F_Open_dialog()"/>
			 </form>
			</div>
			<div class="foot_footright">
			<form id="uploadPhoto" action="<%=request.getContextPath() %>/ChatServlet" method="post" enctype="multipart/form-data">
				<input type="file"  name="photoname" id="photo_file" accept="image/png,image/gif"  style="display:none">
				<input type="hidden" name="courseId" value="${courseId}">
				<input type="hidden" name="courseType" value="p">
				<img src="<%=request.getContextPath() %>/blhrf/img/kkkk_you.png" onclick="openPhotoChoice()" >
			</form>
			</div>
			<button class="send" onclick="sendText()">发送</button>
			<div class="fuzhi_box">
				<input class="wechat_input" class="wechat_input" type="text" name="chatcontent" id="chatcontent"  />
			</div>
		</div>
</div> --%>





<!--  录入课程开始 -->



























<script>
  function inputCourseContent(){
	  
		var rows = $('#ttbd').datagrid("getSelections"); //获取你选择的所有行 
		if(rows == null || rows.length <= 0){
			alert("请选择录入的课程")
			return ;
		}
		// $('#inputCourse').dialog('open');
		var courseId = rows[0].course_id;
		var course_state_code = rows[0].course_state_code;
		if(course_state_code == 3 || course_state_code == 8){
			alert("你选着的课程已结束，不能进行录入操作")
			return ;
		}
		window.location.href = "<%=request.getContextPath()%>/openBackBroadcast?courseId="+courseId;
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
    
</script>
</body>

</html>