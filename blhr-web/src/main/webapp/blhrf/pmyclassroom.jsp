<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="Keywords" content="" />
		<meta name="Description" content="" />
		<meta name="viewport" content="width=device-width,initial-scale=0.5,minimum-scale=0.5,maximum-scale=0.5,user-scalable=no" />
		<title>微儿健康</title>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/blhrf/css/style.css" />
		<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/jquery-2.1.0.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/script.js"></script>
		<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
		<style type="text/css">
	    	#divcss5{ margin:10px auto} 
            #divcss5 img{ border-radius:50%}
		</style>
	</head>

	<body style="background-color: #E8E8E8;">
		<div class="bodybox">
			<div style="background-image: url(<%=request.getContextPath() %>/blhrf/img/xt_bg.png);" class="xthead">
<%-- 				<img src="<%=request.getContextPath() %>/blhrf/img/xt_head.png" />
 --%>			<div id="divcss5" >
                <img src="${memberInfo.photo }" />
                </div>
				<span>${memberInfo.username }</span>
			</div>
			<div class="xtcont">
				<ul>
					<a href="<%=request.getContextPath() %>/openPayMenu?userId=${userId}&isMember=${memberInfo.ismember}">
					
					<c:if test="${memberInfo.ismember==1}">
						<li style="background-image: url(<%=request.getContextPath() %>/blhrf/img/xt_1.png);" class="xt_1">
							
							<span>开通VIP</span>
							<span>
							<img src="<%=request.getContextPath() %>/blhrf/img/xt_jt.png"/>
						</span>
						</li>
						</c:if><c:if test="${memberInfo.ismember==2}">
						
					    <li style="background-image: url(<%=request.getContextPath() %>/blhrf/img/xt_1.png);" class="xt_1">
							<div>
								<span>微儿健康VIP套餐</span>
								<span>
							<img src="<%=request.getContextPath() %>/blhrf/img/xt_jt.png"/>
						 </span></div>
							<label>${memberInfo.validateTime }到期</label>
						</li>
						</c:if>
						
					</a>
					<a href="<%=request.getContextPath() %>/queryFavoriteCourse?userId=${userId}">
						<li style="background-image: url(<%=request.getContextPath() %>/blhrf/img/xt_3.png);" class="xt_3">
							<span>我听过的课程</span>
							<span>
							<img src="<%=request.getContextPath() %>/blhrf/img/xt_jt.png"/>
						</span>
						</li>
					</a>
					<a href="<%=request.getContextPath() %>/queryLearnedCourse">
						<li style="background-image: url(<%=request.getContextPath() %>/blhrf/img/xt_4.png);" class="xt_4">
							<span>我收藏的课程</span>
							<span>
							<img src="<%=request.getContextPath() %>/blhrf/img/xt_jt.png"/>
						</span>
						</li>
					</a>
					<a href="<%=request.getContextPath() %>/blhrf/login.jsp">
						<li style="background-image: url(<%=request.getContextPath() %>/blhrf/img/xt_5.png);" class="xt_5">
							<span>讲师登录</span>
							<span>
							<img src="<%=request.getContextPath() %>/blhrf/img/xt_jt.png"/>
						</span>
						</li>
					</a>
				</ul>
			</div>
	        <div class="xtfoot xtfootcol">
				<ul>
					<li>
						<a href="<%=request.getContextPath() %>/wechatlogin?userId=${userId}">回放课程</a>
					</li>
					<li>
						<a href="<%=request.getContextPath() %>/queryBroadCastCourse?userId=${userId}">直播课程</a>
					</li>
					<li class="xt_dot">
						<a href="<%=request.getContextPath() %>/initMyClassInfo?userId=${userId}">我的课堂</a>
					</li>
				</ul>
			</div>
	</div>
			<script type="text/javascript">
	
	 //当微信内置浏览器完成内部初始化后会触发WeixinJSBridgeReady事件。
	 document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		//公众号支付
			//alert("pay action--发起支付操作");
			WeixinJSBridge.invoke('getBrandWCPayRequest',{
				"appId" : "${appid}", //公众号名称，由商户传入
				"timeStamp" : "${timeStamp}", //时间戳
				"nonceStr" : "${nonceStr}", //随机串
				"package" : "${package}", ////扩展包
				"signType" : "MD5", //微信签名方式:1.sha1
				"paySign" : "${paySign}" ////微信签名
			},
			function(res){
						});
	}, false);
	    
	</script>
	
	
	</body>
</html>