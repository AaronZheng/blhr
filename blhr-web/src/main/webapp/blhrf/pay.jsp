<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>微信支付</title>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
</head>
<body>

	</body>
	<script type="text/javascript">
	
	 //当微信内置浏览器完成内部初始化后会触发WeixinJSBridgeReady事件。
	 document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		//公众号支付
			WeixinJSBridge.invoke('getBrandWCPayRequest',{
				"appId" : "${appid}", //公众号名称，由商户传入
				"timeStamp" : "${timeStamp}", //时间戳
				"nonceStr" : "${nonceStr}", //随机串
				"package" : "${package}", ////扩展包
				"signType" : "MD5", //微信签名方式:1.sha1
				"paySign" : "${paySign}" ////微信签名
			},
			function(res){
				// if(res.err_msg == get_brand_wcpay_request:ok ) {
				window.location.href = "<%=request.getContextPath() %>/initMyClassInfo?userId=${userId}";
				// }
				// 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回ok，但并不保证它绝对可靠。
				//因此微信团队建议，当收到ok返回时，向商户后台询问是否收到交易成功的通知，若收到通知，前端展示交易成功的界面；若此时未收到通知，商户后台主动调用查询订单接口，查询订单的当前状态，并反馈给前	展示相应的界面。
		});
		//WeixinJSBridge.log('yo~ ready.');
	}, false);
	
	 /*  	wx.config({
		    debug: true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
		    appId: '${appid}', // 必填，公众号的唯一标识
		    timestamp: '${pay_signature_package.timestamp}', // 必填，生成签名的时间戳
		    nonceStr: '${pay_signature_package.noncestr}', // 必填，生成签名的随机串
		    signature: '${pay_signature_package.signature}',// 必填，签名，见附录1
		    jsApiList: [
			            'chooseWXPay'
		     ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
		});
		
	    wx.ready(function(){
		    debug: true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
	        document.querySelector('#getBrandWCPayRequest').onclick = function(){
	        	alert("支付操作");
	          wx.chooseWXPay({
	        	  timestamp: '${timeStamp}',
	              nonceStr: '${nonceStr}',
	              package: '${package}',
	              signType: 'MD5',
	              paySign: '${paySign}',
	              success: function (res) {
	                  alert("成功"+JSON.stringify(res))// 支付成功后的回调函数
	              },
	              trigger: function (res) {
	                  alert("触发"+JSON.stringify(res))// 支付成功后的回调函数
	              },
	              fail: function (res) {
	                  alert("失败"+JSON.stringify(res))// 支付成功后的回调函数
	              },
	          });
	          }
	      });  */
	
	</script>

</body>
</html>