<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="Keywords" content="" />
		<meta name="Description" content="" />
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>直播录入</title>
		<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/blhrf/css/style.css" />
		<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/jquery-2.1.0.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/jquery.mobile-1.4.5.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/script.js"></script>
		<style type="text/css">
	    	#divcss5{ margin:10px auto} 
	        #divcss5 img{ border-radius:50%}
		</style>
	</head>

	<body style="background-color: #E8E8E8;" onload="window.scrollTo(0,document.body.scrollHeight);">
		<div class="titleTop">
			<img src="<%=request.getContextPath() %>/blhrf/img/zb.png" class="zbImg"> 直播课程 <span class="topText"></span>
			<a class="sukc" href="<%=request.getContextPath() %>/endCourse?userId=${userId}&courseId=${courseId}&category=1">结束课程</a>
		</div>

		<div class="watchDiv">
			<div class="l_title">${courseName}</div>
			<div class="l_content">
				<%-- <div class="xxdjt_jt">
					<img src="<%=request.getContextPath() %>/blhrf/img/up.png" />
				</div> --%>
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
							<!-- 	<label>11"</label> -->
								<em></em>
							</div>
						</div>
					</div>
			
					<div id="extendDiv" class="extendDiv"></div>
					</div>
				</div>
			</div>
		</div>
		
		<div>
			<div class="foot_foot">
				<div class="foot_footleft">
					<img src="<%=request.getContextPath() %>/blhrf/img/llll_zuo.jpg"/>
				</div>
				<%-- <div class="foot_footright">
					<img src="<%=request.getContextPath() %>/blhrf/img/llll_you.png"/>
				</div> --%>
				<div class="fuzhi_box">
					<a>按住 说话</a>
				</div>
			</div>
			<div class="foot_foot">
				<div class="foot_footleft">
					<img src="<%=request.getContextPath() %>/blhrf/img/kkkk_zuo.jpg"/>
				</div>
				<div class="foot_footright">
					<img src="<%=request.getContextPath() %>/blhrf/img/kkkk_you.png" onclick="sendPhoto()" >
				</div>
				<button class="send" onclick="sendText()">发送</button>
				<div class="fuzhi_box">
					<input class="wechat_input" class="wechat_input" type="text" name="chatcontent" id="chatcontent"  />
				</div>
			</div>
		</div>
		
		<div class="speak_show">
			<div style="width: 120px;margin: auto;margin-top: 40px;">
				<div class="speak_show_left">
					<img src="<%=request.getContextPath() %>/blhrf/img/record.png" />
				</div>
				<div class="speak_show_right">
					<div class="speak_show_right_con">
						<img src="<%=request.getContextPath() %>/blhrf/img/p6.png" />
					</div>
				</div>
			</div>
		</div>
		
	</body>
	
	<script type="text/javascript">
	
	
	//var voiceId ;
	wx.config({
	   // debug: true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
	    appId: '${appId}', // 必填，公众号的唯一标识
	    timestamp: '${chat_signature_package.timestamp}', // 必填，生成签名的时间戳
	    nonceStr: '${chat_signature_package.noncestr}', // 必填，生成签名的随机串
	    signature: '${chat_signature_package.signature}',// 必填，签名，见附录1
	    jsApiList: [
	                'chooseImage',
		            'startRecord',
		            'stopRecord',
		            'playVoice',
		            'uploadImage',
		            'downloadImage',
		            'uploadVoice',
		            'downloadImage'
	     ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
	});

    wx.ready(function(){
    	
    	var flag = false;
    	$(".fuzhi_box a").on("touchstart", function(e) {
    		event.preventDefault();
    		flag = true;
    		if(flag == true) {
    			$(".speak_show").show();
    			$(".fuzhi_box").find("a").html("松开 结束");
    			wx.startRecord();
    		}
    		return false;
    	});
    	$(".fuzhi_box a").on("touchend", function(e) {
    		event.preventDefault();
    		flag = false;
    		if(flag == false) {
    			$(".speak_show").hide();
    			$(".fuzhi_box").find("a").html("按住 说话");
    			wx.stopRecord({
	 				success: function (res) {
	 				var voiceId = res.localId;
					document.body.scrollTop += 10;
					$(".extendDiv").append(getVoiceContent(voiceId,'${photoPath}'));
					wx.uploadVoice({
				 	 	      localId: voiceId.toString(), // 需要上传的图片的本地ID，由chooseImage接口获得
				 	 	      isShowProgressTips: 1, // 默认为1，显示进度提示
				 	 		  success: function (res) {
				 	 	      var serverId = res.serverId; // 返回图片的服务器端ID
				 	 	      //alert("上传语音成功"+serverId);
				 	 	      var voiceLength = synchronizedData(serverId,"v");

				 	 	   }
				 	 	}); 
	  			    }
	 			});
    		}
    		return false;
    	});


    	var hy = setInterval(shuwntwo, 600);
    	var hyone = setInterval(shown, 600);
    	$(".qqvoice").bind("click", function() {
    		$(this).toggleClass("qqvoice_showandhide");
    		if($(this).hasClass("qqvoice_showandhide")) {
    			$(this).find(".voice_moveooo").hide().siblings().show();
    			$(this).find("em").hide();
    			 
    		} else {
    			$(this).find(".voice_move").hide().siblings().show();
    		}
    	});

    	function shuwntwo() {
    		$(".speak_show_right_con").animate({
    			"height": 85 + "px"
    		}, 600, function() {
    			$(".speak_show_right_con").css("height", "8px");
    		});
    	}

    	function shown() {
    		$(".voice_move").css("width", "3px").animate({
    			"width": 15 + "px"
    		}, 600, function() {
    			$(".voice_move").css("width", "3px");
    		});
    	}
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
				if(-1 == data.detailId)
					alert("内容发送失败!");
				else
					return data;
			}
		});
    }
    

    function palyVoice(voiceId){
    	 wx.playVoice({
				 localId: voiceId
			      }); 
    }
    
    
    function sendText(){
    	
    	var chatcontent = document.getElementById("chatcontent").value;
    	if(chatcontent == null || chatcontent == "")
    		return ;
    	
    	$.ajax({
			type : "POST",
			async : false,
			url : "<%=request.getContextPath()%>/sendTextContentf",
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
				if(-1 == data)
					alert("内容发送失败!");
				else{
					$(".extendDiv").append(getTextPanel(chatcontent,'${photoPath}'));
					document.body.scrollTop += 10;
					document.getElementById("chatcontent").value = "";
				}
					
			}
		});
    }
    
    
    
    function sendPhoto(){
    	wx.chooseImage({
			    count: 1, // 默认9
			    sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
			    sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
			    success: function (res) {
			        var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
				  document.body.scrollTop += 10;
			      wx.uploadImage({
					    localId: localIds.toString(), // 需要上传的图片的本地ID，由chooseImage接口获得
					    isShowProgressTips: 1, // 默认为1，显示进度提示
					    success: function (res) {
					        var serverId = res.serverId; // 返回图片的服务器端ID
					      //  alert("上传图片成功"+serverId);
					        synchronizedData(serverId,"p");
						    $(".extendDiv").append(getPhotoContent(localIds,'${photoPath}'));
					    }
					});
			    }
			});
    }
    
    
    function getVoiceContent(voiceId,photoPath){
    	
    	var baserDir = '<%=request.getContextPath() %>';
        var content = "<div class=\"row\" onclick=\"palyVoice('"+voiceId+"')\" >"+
		"<div class=\"san_zuob\" id=\"divcss5\">"+
		"<img src=\""+baserDir+photoPath+"\" />"+
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
				"<label>11\"</label>"+
				"<em></em>"+
			"</div>"+
		"</div>"+
	"</div>";
	return content;
  
 }
    
    function getPhotoContent(phtotPath,photoPath){
    	
    	var baseDir = '<%=request.getContextPath() %>';
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
    
    
</script>
	
</html>