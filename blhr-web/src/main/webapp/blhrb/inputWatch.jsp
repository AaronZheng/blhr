<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8" />
	<meta name="Keywords" content="" />
	<meta name="Description" content="" />
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<title>录入课程</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/blhrf/css/style.css" />
	<style type="text/css">
    	#divcss5{ margin:10px auto} 
           #divcss5 img{ border-radius:50%}
	</style>
    <script language="javascript" type="text/javascript"
	src="<%=request.getContextPath() %>/js/jquery-2.1.4.js"></script>
			<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.form.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/jquery.mobile-1.4.5.min.js"></script>
        <style type="text/css">
		  #updateItemDivText {display: none;
		   position: absolute;
		   top: 25%; left: 22%; 
		   width: 300px; height: 100px; 
		   padding: 8px; 
		   border: 8px solid #E8E9F7; 
		   background-color: white;
		   z-index:1002; 
		   overflow: auto;
		   }
		  #updateItemDivp {display: none;
		   position: absolute;
		   top: 25%; left: 22%; 
		   width: 300px; height: 100px; 
		   padding: 8px; 
		   border: 8px solid #E8E9F7; 
		   background-color: white;
		   z-index:1002; 
		   overflow: auto;
		   }
		  #updateItemDivv {display: none;
		   position: absolute;
		   top: 25%; left: 22%; 
		   width: 300px; height: 100px; 
		   padding: 8px; 
		   border: 8px solid #E8E9F7; 
		   background-color: white;
		   z-index:1002; 
		   overflow: auto;
		   }
        </style>

	</head>

	<body style="background-color: #E8E8E8;">
		<div class="titleTop">
			<img src="<%=request.getContextPath() %>/blhrf/img/zb.png" class="zbImg">后台录入课程 <span class="topText"></span>
			<a class="sukc" style="cursor:pointer;" onclick="endinputcourse()">结束课程</a>
		</div>

		<div class="watchDiv">
			<div class="l_title">${courseName}</div>
			<div class="l_content">
				<div class="l_content_coonn">
					<div class="kjgyfuy">
							
				<c:forEach items="${courseItem }" var="list">
					
				 <c:if test="${list.content_type == 't'}">
				 <div>
					<div class="row" id="${list.course_detail_id}">
						<div class="san_zuob">
						  <c:if test="${userType == '2'}">
							<img src="<%=request.getContextPath() %>/${photo}" />
						  </c:if>
						  <c:if test="${userType == '1'}">
							<img src="${photo}" />
						  </c:if>
						</div>
						<div class="qqright">
							<div class="qqsky">
								<img class="qqsky_fri" src="<%=request.getContextPath() %>/blhrf/img/jt_jt.png" />
								<div class="qqtext">${list.content_item }&nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;<font style="cursor:pointer; color: red"  onclick="deleteItem(this,'${list.course_detail_id}')">删除</font>
							     &nbsp; &nbsp;<font style="cursor:pointer; color: red"  onclick="showUpdateDiv('updateItemDivText','${list.course_detail_id}',this)">更新</font>
							</div>
							</div>
						</div>
					</div>
					</div>
				 </c:if>
				 
				  <c:if test="${list.content_type == 'p'}">
				  <div>
					<div class="row"  id="${list.course_detail_id}">
						<div class="san_zuob">
						  <c:if test="${userType == '2'}">
							<img src="<%=request.getContextPath() %>/${photo}" />
						  </c:if>
						  <c:if test="${userType == '1'}">
							<img src="${photo}" />
						  </c:if>
						</div>
						<div class="qqright">
							<div class="qqsky">
								<img class="qqsky_fri" src="<%=request.getContextPath() %>/blhrf/img/jt_jt.png" />
								<img src="<%=request.getContextPath() %>${list.content_item }" class="contentImg"> 
								&nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;
								<font>
								<font style="cursor:pointer; color: red"  onclick="deleteItem(this,'${list.course_detail_id}')">删除</font>
							    </font>
							      &nbsp; &nbsp;<font style="cursor:pointer; color: red"  onclick="showUpdateDiv('updateItemDivp','${list.course_detail_id}',this)">更新</font>
							</div>
						</div>
					</div>
					</div>
				 </c:if>
				 
				  <c:if test="${list.content_type == 'v'}">
				  <div>
					<div class="row"  id="${list.course_detail_id}" >
						<div class="san_zuob">
						  <c:if test="${userType == '2'}">
							<img src="<%=request.getContextPath() %>/${photo}" />
						  </c:if>
						  <c:if test="${userType == '1'}">
							<img src="${photo}" />
						  </c:if>
						</div>
						<div class="qqright" onclick="palyVoice('${list.content_item }','${list.item_length }')">
							<div class="qqsky qqvoice" style="width: ${list.item_length + 55 }px; height:40px;">
								<img class="qqsky_fri" src="<%=request.getContextPath() %>/blhrf/img/jt_jt.png" />
								<div>
									<div class="voice_move">
										<img src="<%=request.getContextPath() %>/blhrf/img/voice.png" class="voice">
									</div>
									<div class="voice_moveooo">
										<img src="<%=request.getContextPath() %>/blhrf/img/voice.png" class="voice">
									</div>
								</div>
								<div class="qqvoice_hitit"></div><label> </label>
								<em>${list.item_length }'</em>
							</div>
						</div>
						<div>
						<div>
						<span  onclick="deleteItem(this,'${list.course_detail_id}')"><font style="cursor:pointer; color: red" >&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; 删除</font></span>
						<span><font style="cursor:pointer; color: red"   onclick="showUpdateDiv('updateItemDivv','${list.course_detail_id}',this)">更新</font></span>	
						</div>
					    </div>
					</div>
					</div>					
				 </c:if>
			    </c:forEach>
					<div id="extendDiv" class="extendDiv"></div>
					<div id="voiceTmp" class="voiceTmp" style="display: none;"></div>
					<div id="updateItemDivText">
				    	<input id="itemIdt" style="width: 260px;height: 20px;" type="hidden"  name="itemId">
					    <input id="updateItemTextContent" style="width: 260px;height: 20px;" type="text" name="chatContent">
					    <br><div style="cursor: pointer;" onclick="updateContent()">确定</div>
						<div style="cursor:pointer;" onclick="closeDialog('updateItemDivText','updateItemTextContent')">关闭</div>
					</div>
					<div id="updateItemDivp">
					    <form id="updateItemMediap" name="updatePform" action="<%=request.getContextPath() %>/UpdateChatServlet" method="post" enctype="multipart/form-data">
				    	   <input id="itemIdp" style="width: 260px;height: 20px;" type="hidden"  name="itemId">
					       <input type="file" id="photoname" name="photoname" id="photo_file" accept="image/png,image/gif" >
					       <br><div style="cursor:pointer;" onclick="mediaUpdate('p')">确定</div><div style="cursor:pointer;" onclick="closeDialog('updateItemDivp','photoname')">关闭</div>
				        </form>
				     </div>
					<div id="updateItemDivv">
					    <form id="updateItemMediav" name="updateVform" action="<%=request.getContextPath() %>/UpdateChatServlet" method="post" enctype="multipart/form-data">
				    	   <input id="itemIdv" style="width: 260px;height: 40px;" type="hidden"  name="itemId">
					       <input type="file" id="voicename" name="voicename" id="photo_file" accept="audio/mp3" >
					       <br><div style="cursor:pointer;" onclick="mediaUpdate('v')">确定</div><div style="cursor:pointer;" onclick="closeDialog('updateItemDivv','voicename')">关闭</div>
				       </form>
					</div>
				
			</div>
		
		<div>
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
		</div>
		
	</body>
	
	<script type="text/javascript">
	

	var htmlcontentf;
	var htmlcontentc;
	var htmlcontentcc;
	var itemId;
	var voicePhoto;
	
	
	function closeDialog(content,inputContent){
		var aiin = document.getElementById(content);
		aiin.style.display = 'none';  
		document.getElementById(inputContent).value = "";
		
	}
	
	function mediaUpdate(type){
		
		var content = null;
		var formc = null;
		var formObj = null;
		if("v" == type){
			formObj =  $("#updateItemMediav");
			document.getElementById("itemIdv").value = itemId;
			content = document.getElementById("voicename").value;
			formc = $('#updateItemMediav').serialize()
		}else if("p" == type){
			formObj =  $("#updateItemMediap");
			document.getElementById("itemIdp").value = itemId;
			content = document.getElementById("photoname").value;
			formc = $('#updateItemMediap').serialize()
		}

		 if(content == null || content == ""){
			 alert("修改的内容不能为空!");
			 return 
		 }
		 
		 formObj.ajaxSubmit({
	            type: 'post', // 提交方式 get/post
	            url: '<%=request.getContextPath() %>/UpdateChatServlet', // 需要提交的 url
	            data: formc,
	            error:function(request) {
	    			alert("修改内容失败");
	    		},
	            success: function(data) { 
	            	if(data == 1){
	            		alert("修改失败");
	            		return;
	            	}
	            	//htmlcontentf.removeChild(htmlcontentc);
	            	if("p" == type){
	            		closeDialog('updateItemDivp','photoname');
	            		var temp = document.createElement("div");
						temp.innerHTML = getPhotoContent(data.sourcePath,data.itemId);
						htmlcontentc.removeChild(htmlcontentcc)
						htmlcontentc.appendChild(temp);
	            	}if("v" == type){
	             		closeDialog('updateItemDivv','voicename');
	            		var temp = document.createElement("div");
						temp.innerHTML = getVoiceContent(data.sourcePath,data.itemId,data.itemLength);
						htmlcontentc.removeChild(htmlcontentcc)
						htmlcontentc.appendChild(temp); 
	            	}
	            }
	          // $("#uploadPhoto").resetForm(); // 提交后重置表单
	        });
	}
	
	
	
	function updateContent(){
		
		var content = document.getElementById("updateItemTextContent").value;
		if(content == null || content == ""){
			alert("修改的内容不能为空!");
			return 
		}
		 
		$.ajax({
			type : "GET",
			async : false,
			contentType:"application/x-www-form-urlencoded; charset=utf-8",
			url : "<%=request.getContextPath()%>/updateCourseItem",
			data : {
				"itemId" : itemId,
				"textContent" : content
			},
			error : function(request) {
				alert("更新内容失败!");
			},
			success : function(data) {
            	htmlcontentf.removeChild(htmlcontentc);
				if("1" != data)
					alert("更新内容失败!");
				else{
					var temp = document.createElement("div");
					temp.innerHTML = getTextPanel(content,itemId);
            	    htmlcontentf.appendChild(temp); 
            		var aiin = document.getElementById("updateItemDivText");
            		aiin.style.display = 'none';  
            		document.getElementById("updateItemTextContent").value= ""
				}
			}
		});
	}
	
	
	function showUpdateDiv(content,data,objdiv){
		
		this.htmlcontentf = objdiv.parentNode.parentNode.parentNode.parentNode.parentNode;
		if(content == "updateItemDivv"){
			this.htmlcontentc = objdiv.parentNode.parentNode.parentNode.parentNode.parentNode;
			this.htmlcontentcc = objdiv.parentNode.parentNode.parentNode.parentNode;
		}else{
			this.htmlcontentc = objdiv.parentNode.parentNode.parentNode.parentNode;
			this.htmlcontentcc = objdiv.parentNode.parentNode.parentNode;
		}
		
		itemId = data;
		var aiin = document.getElementById(content);
		if(aiin.style.display != 'block'){
			aiin.style.display = 'block';
		}else{
			aiin.style.display = 'none';  
		}
	}
	
	
	function deleteItem(chatdiv,courseDetailItem){
		
			$.ajax({
				type : "GET",
				async : false,
				url : "<%=request.getContextPath()%>/deleteCourseDetailItem",
				data : {
					"itemId" : courseDetailItem
				},
				error : function(request) {
					alert("删除失败!");
				},
				success : function(data) {
					if("1" != data)
						alert("删除失败!");
					else{
						 if (chatdiv != null)
							 chatdiv.parentNode.parentNode.parentNode.parentNode.parentNode.removeChild(chatdiv.parentNode.parentNode.parentNode.parentNode);
					}
				}
			});
        }
		
	
	  $("#btn_file").change(function() {  
		    $("#uploadvioce").ajaxSubmit({
	            type: 'post', // 提交方式 get/post
	            url: '<%=request.getContextPath() %>/ChatServlet', // 需要提交的 url
	            data: $('#uploadvioce').serialize(),
	            error:function(request) {
	            	document.getElementById("voicename").value=""; 
	    			alert("发送语音失败");
	    		},
	            success: function(data) { 
	            	if(data == 0){
	            		alert("发送语音失败,检查音频是否损坏，然后重新上传");
	            		return;
	            	}
	            	$(".extendDiv").append(getVoiceContent(data.sourcePath,data.detailId,data.voiceLength));
	            	document.getElementById("voicename").value=""; 
	            }
	        });
	    });  
	  

	  $("#photo_file").change(function() {  
		  
	    $("#uploadPhoto").ajaxSubmit({
            type: 'post', // 提交方式 get/post
            url: '<%=request.getContextPath() %>/ChatServlet', // 需要提交的 url
            data: $('#uploadPhoto').serialize(),
            error:function(request) {
            	document.getElementById("photoname").value=""; 
    			alert("发送图片失败");
    		},
            success: function(data) { 
            	if(data == 0){
            		alert("发送图片失败，检查图片是否损坏，然后重新上传");
            		return;
            	}
            	$(".extendDiv").append(getPhotoContent(data.sourcePath,data.detailId));
            	document.getElementById("photoname").value=""; 
            }
          // $("#uploadPhoto").resetForm(); // 提交后重置表单
        });
	    
	});  
	
    function synchronizedData(contentId,type){
    	$.ajax({
			type : "GET",
			async : false,
			url : "<%=request.getContextPath()%>/uploadChatContent",
			data : {
				"courseId" : '${courseId}',
				"content" : contentId,
				"type" : type
			},
			error : function(request) {
				alert("内容发送失败!");
			},
			success : function(data) {
				//var vm = JSON.parse(data);
				if("1" != data)
					alert("内容发送失败!");
			}
		});
    }
    

    function palyVoice(voiceId,voicelong){
    	
    	//clearTimeout(voicePhoto);
		//voicePhoto = startVoice(voiceId+"qqright");
    	//setTimeout(endVoice(voiceId+"qqright"),voicelong*1000+900); 
    	var baserDir = '<%=request.getContextPath() %>';
     	var div = document.getElementById('voiceTmp');
    	div.innerHTML = "<audio id=\"shake_action\" src=\""+baserDir+"/"+voiceId+"\" preload=\"auto\" autoplay=\"true\"></audio>";
    }
    
    
    function sendText(){
    	
    	var chatcontent = document.getElementById("chatcontent").value;
    	if(chatcontent == null || chatcontent == "")
    		return ;
    	
    	$.ajax({
			type : "POST",
			async : false,
			url : "<%=request.getContextPath()%>/sendTextContent",
			data : {
				"courseId" : '${courseId}',
				"chatContent" : chatcontent,
				"type" : "t"
			},
			error : function(request) {
				alert("内容发送失败!");
			},
			success : function(data) {
				//var vm = JSON.parse(data);
				if("" == data)
					alert("内容发送失败!");
				else{
					$(".extendDiv").append(getTextPanel(chatcontent,data));
					document.getElementById("chatcontent").value = "";
				}
					
			}
		});
    }
    
    
	
	function getVoiceContent(voiceId,itemId,voiceLength){
    	
    	var baseDir = '<%=request.getContextPath() %>';
        var content = "<div><div class=\"row\" >"+
		"<div class=\"san_zuob\">"+
		"<img src="+baseDir+"/${photo} />"+
		"</div>"+
		"<div class=\"qqright "+voiceId+"qqright\" onclick=\"palyVoice('"+voiceId+"','"+voiceLength+"')\">"+
			"<div class=\"qqsky qqvoice\" style=\"width: "+(55+parseInt((voiceLength==""||voiceLength == null)?0:voiceLength))+"px ; height:40px ;\">"+
				"<img class=\"qqsky_fri\" src=\""+baseDir+"/blhrf/img/jt_jt.png\" />"+
				"<div>"+
					"<div class=\"voice_move\">"+
						"<img src=\""+baseDir+"/blhrf/img/voice.png\" class=\"voice\">"+
					"</div>"+
					"<div class=\"voice_moveooo\">"+
						"<img src=\""+baseDir+"/blhrf/img/voice.png\" class=\"voice\">"+
					"</div>"+
				"</div>"+
				"<em>"+voiceLength+"'</em>"+
			"</div>"+
		"</div>"+
		"<div>"+
		"<div>"+
		"<span onclick=\"deleteItem(this,'"+itemId+"')\"><font style=\"cursor:pointer; color: red\">&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;删除 &nbsp;</font></span>"+
    	"<span><font style=\"cursor:pointer; color: red\"   onclick=\"showUpdateDiv('updateItemDivv','"+itemId+"',this)\">更新</font></span>"+	
		"</div>"+
	    "</div>"+
	"</div>";
	return content;
 }
    
    function getPhotoContent(phtotPath,itemId){
    	
    	var baseDir = '<%=request.getContextPath() %>';
    	return  "<div><div class=\"row\">"+
		"<div class=\"san_zuob\">"+
		"<img src="+baseDir+"/${photo} />"+
	"</div>"+
	"<div class=\"qqright\">"+
		"<div class=\"qqsky\">"+
		"<img class=\"qqsky_fri\" src=\""+baseDir+"/blhrf/img/jt_jt.png\" />"+
			"<img src=\""+baseDir+"/"+phtotPath+"\" class=\"contentImg\"></img>"+" &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;<font><font style=\"cursor:pointer; color: red\"  onclick=\"deleteItem(this,'"+itemId+"')\">删除</font></font>"+
		" &nbsp; &nbsp;<font style=\"cursor:pointer; color: red\"  onclick=\"showUpdateDiv('updateItemDivp','"+itemId+"',this)\">更新</font></div>"+
	"</div>"+
    "</div></div>";
  }

    
   function F_Open_dialog(){ 
         document.getElementById("btn_file").click();
    } 

    
    function getTextPanel(chatcontent,itemId){
    	var baseDir = '<%=request.getContextPath() %>';
    	return "<div><div class=\"row\">"+
		"<div class=\"san_zuob\">"+
		"<img src="+baseDir+"/${photo} />"+
		"</div>"+
		"<div class=\"qqright\">"+
			"<div class=\"qqsky\">"+
				"<img class=\"qqsky_fri\" src=\""+baseDir+"/blhrf/img/jt_jt.png\" />"+
				"<div class=\"qqtext\">"+chatcontent+" &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;<font style=\"cursor:pointer; color: red\"  onclick=\"deleteItem(this,'"+itemId+"')\">删除</font>"+
				" &nbsp; &nbsp;<font style=\"cursor:pointer; color: red\"  onclick=\"showUpdateDiv('updateItemDivText','"+itemId+"',this)\">更新</font>"+
				"</div>"+
			"</div>"+
		"</div>"+
	"</div></div>";
    }
    
    
	// 开始播放语音
	function startVoice(className) {
		//voiceMove = setInterval(shown, 600);
	        $("."+className).hasClass("qqvoice_showandhide");
		$("."+className).find(".voice_moveooo").hide().siblings().show();
		$("."+className).find("em").hide();
	}
	//结束播放语音
	function endVoice(className) {
		//clearInterval(voiceMove);
		$("."+className).find(".voice_move").hide().siblings().show();
	}
	
    
    
    function endinputcourse(){
 	   
 		$.ajax({
 			type : "GET",
 			async : false,
 			url : "<%=request.getContextPath() %>/backEndCourse",
 			data : {
 				"courseId" : '${courseId}',
 				"state" : '8'
 			},
 			error : function(request) {
 				alert("请求失败");
 			},
 			success : function(data) {
 				if("1"== data)
 					window.location.href = "<%=request.getContextPath()%>/blhrb/courseManage.jsp";
 			    else
 			    	alert("请求失败");
 			}
 		});
 	}
    
    
    function openPhotoChoice(){
    	
    	document.getElementById("photo_file").click(); 
    }
    
    
</script>
	
</html>