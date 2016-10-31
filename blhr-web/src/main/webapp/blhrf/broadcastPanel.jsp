<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<meta name="Keywords" content="" />
<meta name="Description" content="" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>教程内容</title>
<script type="text/javascript"
	src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/blhrf/css/style.css" />
<script type="text/javascript"
	src="<%=request.getContextPath() %>/blhrf/js/jquery-2.1.0.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/blhrf/js/jquery.mobile-1.4.5.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/blhrf/js/script.js"></script>
	<style type="text/css">
    	#divcss5{ margin:10px auto} 
        #divcss5 img{ border-radius:50%}
	</style>
</head>

<body style="background-color: #E8E8E8;" onload="window.scrollTo(0,document.body.scrollHeight);">
<%-- 	<div class="titleTop">
		<img src="<%=request.getContextPath() %>/blhrf/img/zb.png"
			class="zbImg"> 课程内容 <span class="topText">(200人正在学)</span> <a
			class="sukc" href="<%=request.getContextPath() %>/blhrf/#">课程信息</a>
	</div> --%>

	<div class="watchDiv">
		<div class="l_title">${courseName}</div>
		<div class="l_content">
			<div class="l_content_coonn">
				<div class="kjgyfuy">

					<div class="row" style="display: none;">
						<div class="san_zuob">
							<img
								src="<%=request.getContextPath() %>/blhrf/img/san_smalltou.png" />
						</div>
						<div class="qqright">
							<div class="qqsky qqvoice">
								<img class="qqsky_fri"
									src="<%=request.getContextPath() %>/blhrf/img/jt_jt.png" />
								<div>
									<div class="voice_move">
										<img src="<%=request.getContextPath() %>/blhrf/img/voice.png"
											class="voice">
									</div>
									<div class="voice_moveooo">
										<img src="<%=request.getContextPath() %>/blhrf/img/voice.png"
											class="voice">
									</div>
								</div>
								<div class="qqvoice_hitit"></div>
								<label>11"</label> <em></em>
							</div>
						</div>
					</div>

					<div id="extendDiv" class="extendDiv"></div>
					<div id="voiceTmp" class="voiceTmp" style="display: none;"></div>
				</div>
			</div>

		</div>

	</div>


</body>

<script type="text/javascript">
	
	  var courseId= '${courseId}';
	  var rowNum = 0;
	  var pageSize = 10;
	  var baseDir = '<%=request.getContextPath()%>';
	  var i = 0;
	
	  function myrefresh(){ 
			$.ajax({
				type : "GET",
				async : false,
				url : "<%=request.getContextPath()%>/cycleQueryCourseDetail",
				data : {
					"courseId" : '${courseId}',
					"rowNum" : rowNum,
					"pageSize" : pageSize
				},
				error : function(request) {
					alert("内容更新失败!");
				},
				success : function(data) {
					var vm = JSON.parse(data);
					if("0" != vm.size){
						for(var i = 0;i < vm.data.length;i++){
							document.body.scrollTop += 10;
							if(vm.data[i].content_type == 'v'){
								$(".extendDiv").append(getVoiceContent(baseDir+vm.data[i].content_item,vm.data[i].item_length,'${photoPath}'));
							}else if(vm.data[i].content_type == 'p'){
							    $(".extendDiv").append(getPhotoContent(baseDir+vm.data[i].content_item,'${photoPath}'));
							}else if(vm.data[i].content_type == 't'){
								$(".extendDiv").append(getTextPanel(vm.data[i].content_item,'${photoPath}'));
							}
						}
						rowNum = vm.currentSize;
					}
				}
			});
		} 
		
		function getTextPanel(chatcontent,photoPath){
	    	var baseDir = '<%=request.getContextPath() %>';
	    	return "<div class=\"row\">"+
			"<div class=\"san_zuob\" id=\"divcss5\">"+
			"<img src=\""+baseDir+photoPath+"\" />"+
			"</div>"+
			"<div class=\"qqright\">"+
				"<div class=\"qqsky\">"+
					"<img class=\"qqsky_fri\" src=\""+baseDir+"/blhrf/img/jt_jt.png\" />"+
					"<div class=\"qqtext\">"+chatcontent+""+
					"</div>"+
				"</div>"+
			"</div>"+
		"</div>";
	    }
		
		
		function getVoice(voiceId){
			
			return "<embed height=\"100\" width=\"100\" src=\""+voiceId+"\" />";
		}
		
		
		
		function getVoiceContent(voiceId,voiceLong,photoPath){
	    	
	    	var baserDir = '<%=request.getContextPath() %>';
	        var content = "<div class=\"row\" onclick=\"palyVoice('"+voiceId+"')\" >"+
			"<div class=\"san_zuob\" id=\"divcss5\">"+
			"<img src=\""+baserDir+photoPath+"\" />"+
			"</div>"+
			"<div class=\"qqright\">"+
				"<div class=\"qqsky qqvoice\" style=\"width:"+(voiceLong+80)+"px ; height:40px ;\">"+
					"<img class=\"qqsky_fri\" src=\""+baserDir+"/blhrf/img/jt_jt.png\" />"+
					"<div>"+
						"<div class=\"voice_move\">"+
							"<img src=\""+baserDir+"/blhrf/img/voice.png\" class=\"voice\">"+
						"</div>"+
						"<div class=\"voice_moveooo\">"+
							"<img src=\""+baserDir+"/blhrf/img/voice.png\" class=\"voice\">"+
						"</div>"+
					"</div>"+
					"<div class=\"qqvoice_hitit\"></div>"+
					"<label>"+voiceLong+" \"</label>"+
					"<em></em>"+
				"</div>"+
			"</div>"+
		"</div>";
		return content;
	 }
	    
  

	    function palyVoice(voiceId){
	     	var div = document.getElementById('voiceTmp');
	    	div.innerHTML = "<audio id=\"shake_action\" src=\""+voiceId+"\" preload=\"auto\" autoplay=\"true\"></audio>";
 	    /* 	$(".voiceTmp").append("<audio id=\"shake_action\" src=\""+voiceId+"\" preload=\"auto\" autoplay=\"true\"></audio>");
 */	    /* 	var myAuto = document.getElementById('shake_action');
	    	myAuto.play(); */
	    }
	    
	    
		function getPhotoContent(phtotPath,photoPath){
	    	
			var baseDir = '<%=request.getContextPath()%>';
			return  "<div class=\"row\">"+
			"<div class=\"san_zuob\" id=\"divcss5\">"+
			"<img src=\""+baseDir+photoPath+"\" />"+
			"</div>"+
			"<div class=\"qqright\">"+
				"<div class=\"qqsky\">"+
				"<img class=\"qqsky_fri\" src=\""+baseDir+"/blhrf/img/jt_jt.png\" />"+
					"<img src=\""+phtotPath+"\" class=\"contentImg\"></img>"+
				"</div>"+
			"</div>"+
		"</div>";
	   
		}
		
	    
		setTimeout('myrefresh()',1); 
		setInterval('myrefresh()',3000); 
	
	</script>

</html>