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
<title>课程学习</title>
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
<!--[if (gte IE 6)&(lte IE 8)]>
  			<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/selectivizr.js"></script>
  			<noscript><link rel="stylesheet" href="<%=request.getContextPath() %>/blhrf/[fallback css]" /></noscript>
		<![endif]-->
</head>

<body style="background-color: #E8E8E8;">

	<div class="watchDiv">
		<div class="l_title">${courseName}</div>
		<div class="l_content">
			<div class="l_content_coonn">
				<div class="kjgyfuy">

					<div class="row" style="display: none;">
						<div class="san_zuob">
							<img src="<%=request.getContextPath() %>/blhrf/img/san_smalltou.png" />
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
		<div class="xxdjt_jt" onclick="myrefresh()">
					<img src="<%=request.getContextPath() %>/blhrf/img/wqeasdads.png" />
			     	</div>


</body>

<script type="text/javascript">
	
	  var courseId= '${courseId}';
	  var rowNum = 0;
	  var pageSize = 10;
	  var baseDir = '<%=request.getContextPath()%>';
	  var i = 0;
	  var voices = new Array();
	  var voiceLongt1;

	
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
							if(vm.data[i].content_type == 'v'){
								var timestamp = new Date().getTime();
								voices[voices.length] = timestamp;
								$(".voiceTmp").append("<audio id=\""+timestamp+"\" src=\""+baseDir+vm.data[i].content_item+"\" preload=\"auto\" ></audio>");
								$(".extendDiv").append(getVoiceContent(timestamp,vm.data[i].item_length,'${photoPath}'));
							   // getVoiceTime(timestamp);
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
	  
	  
	  
	    function getVoiceTime(voiceId){
	    	
	    	setTimeout(function(){
	    		while(true){
		    		var duration = $("#"+voiceId)[0].duration;
		    		if(isNaN(duration)){
		    			continue;
		    		//	getVoiceTime(voiceId);
		    		}else{
					    document.getElementById(voiceId+"voicelong").value = duration;
		    			return;
		    		}
	    		}
	    	},100);
	    }
		
		function getTextPanel(chatcontent,photoPath){
	    	var baseDir = '<%=request.getContextPath() %>';
	    	return "<div class=\"row\">"+
			"<div class=\"san_zuob\">"+
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
/* 
			var flag = false;
            for(var i = 0;i<voices.length;i++){
				if(voices[i] == voiceId)
					flag = true;
					if(flag)
						playVoices(voices[i]);
			} */
		}
		
		
		function getVoiceContent(timestamp,voiceLong,photoPath){
	    	var baserDir = '<%=request.getContextPath() %>';
	        var content = "<div class=\"row\" onclick=\"palyVoice('"+timestamp+"')\" >"+
			"<div class=\"san_zuob\">"+
				"<img src=\""+baserDir+photoPath+"\" />"+
				"<input type=\"hidden\" id=\""+timestamp+"voicelong\" value=\""+voiceLong+"\" name=\""+timestamp+"voicelong\">"+
			"</div>"+
			"<div class=\"qqright\">"+
				"<div class=\"qqsky qqvoice\">"+
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
	    
  

	function palyVoice(voiceId) {
		
		
		$(".xxdjt_jt").click(function() {
			var texthtm = $('.l_content_coonn .kjgyfuy:first-child').html();
			$(".l_content_coonn").prepend('<div class="kjgyfuy"></div>')
			$(".kjgyfuy:first-child").prepend(texthtm);
			var hyone = setInterval(shown, 600);
			$(".qqvoice").on("click", function() {
				$(this).toggleClass("qqvoice_showandhide");
				if($(this).hasClass("qqvoice_showandhide")) {
					$(this).find(".voice_moveooo").hide().siblings().show();
					$(this).find("em").hide();
				} else {
					$(this).find(".voice_move").hide().siblings().show();
				}
			});
		});
		
		
		
		//getVoiceTime(voiceId);
		for (var i = 0; i < voices.length; i++) {
			var voiceRaido = document.getElementById(voices[i]);
			voiceRaido.pause();
		}

		for (var i = 0; i < voices.length; i++) {
			if (voices[i] == voiceId){
				var voiceRaido = document.getElementById(voiceId);
				var voicelong = document.getElementById(voiceId+"voicelong").value;
				voiceRaido.play();
				if(i < voices.length)
					setTimeout("palyVoice('"+voices[i+1]+"')",voicelong*1000+900); 
				break;
			}
		}

		/* 	$(".voiceTmp").append("<audio id=\"shake_action\" src=\""+voiceId+"\" preload=\"auto\" autoplay=\"true\"></audio>");
		 *//* 	var myAuto = document.getElementById('shake_action');
			myAuto.play(); */
	}

	function getPhotoContent(phtotPath,picture) {

		var baseDir = '<%=request.getContextPath()%>';
			return  "<div class=\"row\">"+
			"<div class=\"san_zuob\">"+
			"<img src=\""+baseDir+picture+"\" />"+
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
	
	</script>

</html>