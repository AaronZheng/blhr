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
<title>${courseName}</title>
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
		<div class="xxdjt_jt" id="xxdjt_jt" onclick="myrefresh()">
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
	  var currentVoiceId;
	  var voiceMove;
	  var voicesSetTime = new Array();
	

	 function shown() {
			$("."+currentVoiceId+"voice_move").css("width", "3px").animate({
				"width": 15 + "px"
			}, 600, function() {
				$("."+currentVoiceId+"voice_move").css("width", "3px");
			});
	  }
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
								var wid = $(window).width();
								$(".qqright").css({"width": wid - 95 + "px",});
							}else if(vm.data[i].content_type == 'p'){
							    $(".extendDiv").append(getPhotoContent(baseDir+vm.data[i].content_item,'${photoPath}'));
								var wid = $(window).width();
								$(".qqright").css({"width": wid - 95 + "px",});
							}else if(vm.data[i].content_type == 't'){
								$(".extendDiv").append(getTextPanel(vm.data[i].content_item,'${photoPath}'));
								var wid = $(window).width();
								$(".qqright").css({"width": wid - 95 + "px",});
							}
						}
						if(vm.data.length < 10){
				            document.getElementById("xxdjt_jt").style.display ="none";
						}
						rowNum = vm.currentSize;
						$(".qqvoice").on("click", function() {
							//voiceMove = setInterval(shown, 600);
							$(this).toggleClass("qqvoice_showandhide");
							if($(this).hasClass("qqvoice_showandhide")) {
								$(this).find(".voice_moveooo").hide().siblings().show();
								$(this).find("em").hide();
							} else {
								$(this).find(".voice_move").hide().siblings().show();
							}
						});
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
		
		
		function getVoice(voiceId){
			
			return "<embed height=\"100\" width=\"100\" src=\""+voiceId+"\" />";
		}
		
		
		function getVoiceContent(timestamp,voiceLong,photoPath){
	    	var baserDir = '<%=request.getContextPath() %>';
	        var content = "<div class=\"row\" onclick=\"palyVoice('"+timestamp+"',true)\" >"+
			"<div class=\"san_zuob\" id=\"divcss5\">"+
				"<img src=\""+baserDir+photoPath+"\" />"+
				"<input type=\"hidden\" id=\""+timestamp+"voicelong\" value=\""+voiceLong+"\" name=\""+timestamp+"voicelong\">"+
			"</div>"+
			"<div class=\"qqright "+timestamp+"qqright\">"+
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
	    
		

	function palyVoice(voiceId,first) {

		if(first){
			for(var i = 0;i< voicesSetTime.length;i++)
				clearTimeout(voicesSetTime[i]);
			voicesSetTime = new Array();
		}
		
		if(currentVoiceId != null && currentVoiceId != ""){
			var voiceRaido = document.getElementById(currentVoiceId);
			endVoice(currentVoiceId+"qqright")
			if(voiceRaido != null){
				voiceRaido.pause();
			    voiceRaido.currentTime = 0.0;
			}
		}
		 currentVoiceId = voiceId;
        
		for (var i = 0; i < voices.length; i++) {
			if (voices[i] == voiceId){
				var voiceRaido = document.getElementById(voiceId);
				var voicelong = document.getElementById(voiceId+"voicelong").value;
				startVoice(currentVoiceId+"qqright")
				if(voiceRaido != null)
					voiceRaido.play();
				if(i < voices.length)
					voicesSetTime[voicesSetTime.length] = setTimeout("palyVoice('"+voices[i+1]+"','false')",voicelong*1000+900); 
				break;
			}
		}

	}

	function getPhotoContent(phtotPath,picture) {

		var baseDir = '<%=request.getContextPath()%>';
			return  "<div class=\"row\">"+
			"<div class=\"san_zuob\" id=\"divcss5\">"+
			"<img src=\""+baseDir+picture+"\" />"+
			"</div>"+
			"<div class=\"qqright\">"+
				"<div class=\"qqsky\">"+
				"<img class=\"qqsky_fri\" src=\""+baseDir+"/blhrf/img/jt_jt.png\" />"+
				"<span class=\"push_hitinnner\"  >"+
					"<img src=\""+phtotPath+"\" class=\"contentImg\"></img>"+
				"<a class=\"push_hit push_hitoonnee\" onclick=\"openBigPicture($(this))\"></a>"+
				"</span>"+
				"<ul>"+
				"<li style=\"width: 100%;background-color: transparent;top: 30%;\">"+
					"<div class=\"hujigyft\">"+
						"<img src=\""+phtotPath+"\" class=\"contentImg\" style=\"width: 100%;height:100%\" >"+
					"</div>"+
				"</li>"+
			    "</ul>"+
				"</div>"+
			"</div>"+
		"</div>";
	}
	    
	setTimeout('myrefresh()',1); 
	
	function openBigPicture(pictureDiv){
		    pictureDiv.parents(".qqsky").find("ul").fadeIn(300);
			var hu=pictureDiv.siblings("img").attr("src");
			pictureDiv.siblings("ul").find(".hujigyft img").attr("src",hu);
	}
	</script>

</html>