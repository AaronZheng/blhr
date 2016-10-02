<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图片测试</title>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
</head>
<body>
<input type="button" style="width: 300px;height: 200px" id="onMenuShareTimeline" value="打开图片">
<input type="button" style="width: 300px;height: 200px" id="uploadImage" value="上传图片">
<input type="button" style="width: 300px;height: 200px" id="downloadImage" value="下载图片">
<input type="button" style="width: 300px;height: 200px" id="startRecord" value="开始录音">
<input type="button" style="width: 300px;height: 200px" id="stopRecord" value="停止录音">
<input type="button" style="width: 300px;height: 200px" id="playVoice" value="播放录音">
<input type="button" style="width: 300px;height: 200px" id="uploadVoice" value="播放录音">
<input type="button" style="width: 300px;height: 200px" id="downloadVoice" value="播放录音">
<div id="photoshow"></div>
<div id="photoshowdown"></div>
<div id="serverId"></div>



	<script type="text/javascript">
	
	
	wx.config({
		    debug: true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
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
	    	
	    	var photoPath;
	    	
	  	        document.querySelector('#onMenuShareTimeline').onclick = function(){
	    			wx.chooseImage({
	    			    count: 1, // 默认9
	    			    sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
	    			    sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
	    			    success: function (res) {
	    			        var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
	    			        alert(localIds);
	    			        photoPath = localIds;
	    			    /*     var photodiv = document.getElementById("photoshow").innerHTML;
	    			        photodiv = '<img alt="" src="'+localIds+'">';  */
	    			    document.getElementById("photoshow").innerHTML='<img alt="" src="'+localIds+'">';
	    			    }
	    			});
	          }
	  	        
	  	      var serverPath;
	 	     document.querySelector('#uploadImage').onclick = function(){
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
	            }
	 	     document.querySelector('#downloadImage').onclick = function(){
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
	        }
	 	     
	  	        
	  	        
	  	        
	  	        
	    
	     document.querySelector('#startRecord').onclick = function(){
	    	 alert("开始录音");
 			wx.startRecord();
       }
	     
	     var voiceId;
	     document.querySelector('#stopRecord').onclick = function(){
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
	     
	     
	     var voiceserverPath;
 	     document.querySelector('#uploadVoice').onclick = function(){
 	    	 alert("上传语言"+voiceId);
 	         wx.uploadVoice({
 	 			    localId: voiceId.toString(), // 需要上传的图片的本地ID，由chooseImage接口获得
 	 			    isShowProgressTips: 1, // 默认为1，显示进度提示
 	 			    success: function (res) {
 	 			        var serverId = res.serverId; // 返回图片的服务器端ID
 	 			        voiceserverPath = serverId;
 	 			        alert("上传语言"+voiceserverPath);
     			    	document.getElementById("serverId").innerText=serverId;
 	 			    }
 	 			});
            }
 	     
 	     document.querySelector('#downloadVoice').onclick = function(){
 	    	 alert("下载语音");
 	    	 wx.downloadImage({
 	    		    serverId: voiceserverPath, // 需要下载的图片的服务器端ID，由uploadImage接口获得
 	    		    isShowProgressTips: 1, // 默认为1，显示进度提示
 	    		    success: function (res) {
 	    		    	alert("下载语音"+voiceserverPath);
 	    		        var localIda = res.localId; // 返回图片下载后的本地ID
     			    	document.getElementById("photoshowdown").innerHTML='<img alt="" src="'+localIda+'">';
 	    		    }
 	    		});
        }
	     
	    
	     wx.error(function(res){
		    });
	     
	    });
	    
	  
	
	</script>







</body>
</html>