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
		<title>观看直播</title>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/blhrf/css/style.css" />
		<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/jquery-2.1.0.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/script.js"></script>
		<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	</head>

	<body style="background-color: #E8E8E8;">
		<div class="titleTop">
			<img src="<%=request.getContextPath() %>/blhrf/img/zb.png" class="zbImg"> 直播课程 <span class="topText">(200人正在学)</span>

			<a class="sukc" href="<%=request.getContextPath() %>/blhrf/#">结束课程</a>

		</div>

		<div class="watchDiv">
			<div class="l_title">孩子咳嗽怎么办？</div>
			<div class="l_content">
				<div class="l_content_coonn">
				<div class="row">
					<div class="san_zuob">
						<img src="<%=request.getContextPath() %>/blhrf/img/san_smalltou.png" />
					</div>
					<div class="qqright">
						<div class="qqsky">
							<img src="<%=request.getContextPath() %>/blhrf/img/jt_jt.png" />
							<div class="qqtext">咳嗽是一种症状，不是一种疾病。对待咳嗽，首先确定引发咳嗽的原因－病毒、细菌、过敏、异物等。根据原因进行治疗咳嗽是一种症状，不是一种疾病。 咳嗽是一种症状，不是一种疾病。咳嗽是一种症状，不是一种疾病。
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="san_zuob">
						<img src="<%=request.getContextPath() %>/blhrf/img/san_smalltou.png" />
					</div>
					<div class="qqright">
						<div class="qqsky">
							<img src="<%=request.getContextPath() %>/blhrf/img/jt_jt.png" />
							<img src="<%=request.getContextPath() %>/blhrf/img/san_pic.jpg" class="contentImg"></img>
						</div>
					</div>
				</div>
				<div class="myvoice">
				<div class="row">
					<div class="san_zuob">
						<img src="<%=request.getContextPath() %>/blhrf/img/san_smalltou.png" />
					</div>
					<div class="qqright" id="qqrightVoice">
						<div class="qqsky qqvoice">
							<img src="<%=request.getContextPath() %>/blhrf/img/jt_jt.png" />

							<img src="<%=request.getContextPath() %>/blhrf/img/voice.png" class="voice">

						</div>
					</div>
					</div>
				</div>
				</div>
			<%-- 	<div class="xxdjt_jt">
					<img src="<%=request.getContextPath() %>/blhrf/img/qwerfd.png" />
				</div> --%>
			</div>

		</div>
		<!--<div class="arrow">
            	<img src="<%=request.getContextPath() %>/blhrf/img/arrow.png"/>
            </div>-->
		<div class="fuzhi_box">
			<span>按住 说话</span>
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
	
	
	<script>
		
			
			
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
					            'downloadImage'
				     ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
				});
				
			    wx.ready(function(){
			    	var photoPath;
			  	      /*   document.querySelector('#onMenuShareTimeline').onclick = function(){
			    			wx.chooseImage({
			    			    count: 1, // 默认9
			    			    sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
			    			    sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
			    			    success: function (res) {
			    			        var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
			    			        alert(localIds);
			    			    document.getElementById("photoshow").innerHTML='<img alt="" src="'+localIds+'">';
			    			    }
			    			});
			          } */
			  	        
			  	      var serverPath;
			 	   /*   document.querySelector('#uploadImage').onclick = function(){
			 	    	 alert("上传图片"+photoPath);
			 	         wx.uploadImage({
			 	 			    localId: photoPath.toString(), // 需要上传的图片的本地ID，由chooseImage接口获得
			 	 			    isShowProgressTips: 1, // 默认为1，显示进度提示
			 	 			    success: function (res) {
			 	 			        var serverId = res.serverId; // 返回图片的服务器端ID
			 	 			        serverPath = serverId;
			 	 			        alert("上传图片成功"+serverPath);
			     			    	document.getElementById("serverId").innerText=serverId;
			 	 			    }
			 	 			});
			        } */
			 	  /*    document.querySelector('#downloadImage').onclick = function(){
			 	    	 alert("下载图片");
			 	    	 wx.downloadImage({
			 	    		    serverId: serverPath, // 需要下载的图片的服务器端ID，由uploadImage接口获得
			 	    		    isShowProgressTips: 1, // 默认为1，显示进度提示
			 	    		    success: function (res) {
			 	    		        var localIda = res.localId; // 返回图片下载后的本地ID
			 	    		        alert("下载图片本地地址");
			     			    	document.getElementById("photoshowdown").innerHTML='<img alt="" src="'+localIda+'">';
			 	    		    }
			 	    		});
			        } */
			 	     
			  /*    document.querySelector('#fuzhi_box').touchstart = function(){
			    	 alert("开始录音");
		 			wx.startRecord();
		       }
			     
			     var voiceId;
			     document.querySelector('#fuzhi_box').touchend = function(){
			    	 alert("停止录音");
		 			wx.stopRecord({
		 				success: function (res) {
		 					voiceId = res.localId;
		 			    }
		 			});
		       }
			     
			     document.querySelector('#playVoice').onclick = function(){
			    	 alert("播放录音");
		 			wx.playVoice({
		 				 localId: voiceId
		 			});
		       }
			    
			     wx.error(function(res){
				    }); */
			     
			     
			     
			     
			     
			     $(document).ready(function() {
						var flag = false;
						var voiceId ;
						$(".fuzhi_box").on("touchstart", function() {
							flag = true;
							if(flag == true) {
								$(".speak_show").show();
								$(".fuzhi_box").find("span").html("松开 结束");
								wx.startRecord();

							}
						});
						$(".fuzhi_box").on("touchend", function() {
							flag = false;
							var voiceId ;
							if(flag == false) {
								$(".speak_show").hide();
								$(".fuzhi_box").find("span").html("按住 说话");
								wx.stopRecord({
					 				success: function (res) {
					 					var voiceId = res.localId;
					 					 wx.playVoice({
							 				 localId: voiceId
							 			      }); 
					 			    }
					 			});
								 
								//$(".l_content_coonn").append($('.myvoice').html());
							}
						});
						
/* 
						   $(".qqrightVoice").click(function() {
							   alert("abcd");
							   wx.playVoice({
				 				 localId: voiceId
				 			      }); 
							});  */
						   
						 /*   document.querySelector('#qqrightVoice').onclick = function(){
						    	 alert("播放录音");
					 			wx.playVoice({
					 				 localId: voiceId
					 			});
					       } */
						

						setInterval(function() {
							$(".speak_show_right_con").animate({
								"height": 85 + "px"
							}, 600, function() {
								$(".speak_show_right_con").css("height", "8px");
							});
						}, 600);
					});
					
			     
			    });
			    
			
			
		</script>
	</body>

</html>