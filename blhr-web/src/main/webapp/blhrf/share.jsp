<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
</head>
<body>
<font size="60">
<input id="onMenuShareTimeline" type="button" value="分享到朋友圈"/>
<input id="onMenuShareAppMessage" type="button"  value="发送给朋友"/>
<input id="onMenuShareQQ" type="button"  value="发送给QQ好友"/>
<input id="onMenuShareWeibo" type="button"  value="分享到腾讯微博"/>
<input id="onMenuShareQZone" type="button"  value="分享到QQ空间">
</font>

<script type="text/javascript">

	wx.config({
	   // debug: true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
	    appId: '${appId}', // 必填，公众号的唯一标识
	    timestamp: '${share_signature_package.timestamp}', // 必填，生成签名的时间戳
	    nonceStr: '${share_signature_package.noncestr}', // 必填，生成签名的随机串
	    signature: '${share_signature_package.signature}',// 必填，签名，见附录1
	    jsApiList: [
		            'onMenuShareTimeline',
		            'onMenuShareAppMessage',
		            'onMenuShareQQ',
		            'onMenuShareWeibo',
		            'onMenuShareQZone'
		            
	     ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
	});
	
    wx.ready(function(){
    	  // debug: true,
    /* 	 wx.checkJsApi({
    		    jsApiList: ['onMenuShareTimeline',
    			            'onMenuShareAppMessage',
    			            'onMenuShareQQ',
    			            'onMenuShareWeibo',
    			            'onMenuShareQZone',
    			            'startRecord'], // 需要检测的JS接口列表，所有JS接口列表见附录2,
    		    success: function(res) {
    		        // 以键值对的形式返回，可用的api值true，不可用为false
    		        // 如：{"checkResult":{"chooseImage":true},"errMsg":"checkJsApi:ok"}
    		        alert(JSON.stringify(res));
    		    }
    		}); */
    	
        document.querySelector('#onMenuShareTimeline').onclick = function(){
          wx.onMenuShareTimeline({
            title: '促销易幸运大抽奖',
            link: 'http://www.bolihaiwe.com/index/',
            imgUrl: 'http://www.bolihaiwe.com/blhrf/photo/photo.jpg',
            trigger: function (res) {
                alert('分享到朋友圈');
              },
              success: function (res) {
               alert('已分享');
              },
              ancel: function (res) {
            alert('已取消');
          },
              fail: function (res) {
                  alert('错误');
              }
            
          });
          }
      });
    
      document.querySelector('#onMenuShareAppMessage').onclick = function(){
        wx.onMenuShareAppMessage({
          title: '促销易幸运大抽奖',
          link: 'http://www.bolihaiwe.com/index/',
          imgUrl: 'http://www.bolihaiwe.com/blhrf/photo/photo.jpg',
          trigger: function (res) {
              alert('分享给朋友');
            },
            success: function (res) {
             alert('已分享');
            },
            ancel: function (res) {
          alert('已取消');
        },
            fail: function (res) {
                alert('错误');
            }
        });
        }
      
      document.querySelector('#onMenuShareQQ').onclick = function(){
          wx.onMenuShareQQ({
            title: '促销易幸运大抽奖',
            link: 'http://www.bolihaiwe.com/index/',
            imgUrl: 'http://www.bolihaiwe.com/blhrf/photo/photo.jpg',
            trigger: function (res) {
                alert('分享给QQ好友');
              },
              success: function (res) {
               alert('已分享');
              },
              ancel: function (res) {
            alert('已取消');
          },
              fail: function (res) {
                  alert('错误');
              }
          });
          }
    
      
      document.querySelector('#onMenuShareWeibo').onclick = function(){
          wx.onMenuShareWeibo({
            title: '促销易幸运大抽奖',
            link: 'http://www.bolihaiwe.com/index/',
            imgUrl: 'http://www.bolihaiwe.com/blhrf/photo/photo.jpg',
            trigger: function (res) {
                alert('分享腾讯微博');
              },
              success: function (res) {
               alert('已分享');
              },
              ancel: function (res) {
            alert('已取消');
          },
              fail: function (res) {
                  alert('错误');
              }
          });
          }
      
      document.querySelector('#onMenuShareQZone').onclick = function(){
          wx.onMenuShareQZone({
            title: '促销易幸运大抽奖',
            link: 'http://www.bolihaiwe.com/index/',
            imgUrl: 'http://www.bolihaiwe.com/blhrf/photo/photo.jpg',
            trigger: function (res) {
                alert('分享QQ空间');
              },
              success: function (res) {
               alert('已分享');
              },
              ancel: function (res) {
            alert('已取消');
          },
              fail: function (res) {
                  alert('错误');
              }
          });
          }
      
      
    
    
    wx.error(function(res){

    	alert(res);

    });
    
</script>

</body>
</html>