<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<%@ include file="/include/taglib.jsp"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="Keywords" content="" />
		<meta name="Description" content="" />
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>收款台</title>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/blhrf/css/style.css" />
		<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
		<script type="text/javascript" src="js/script.js"></script>
		<!--[if (gte IE 6)&(lte IE 8)]>
  			<script type="text/javascript" src="js/selectivizr.js"></script>
  			<noscript><link rel="stylesheet" href="<%=request.getContextPath() %>/blhrf/[fallback css]" /></noscript>
		<![endif]-->
		<style type="text/css">
	    	#divcss5{ margin:10px auto} 
            #divcss5 img{ border-radius:50%}
		</style>
		<script type="text/javascript">
		
		function showdiv() {            
            document.getElementById("pay_shouone").style.display ="block";
        }
        
		function hidediv() {
            document.getElementById("pay_shouone").style.display ='none';
        }
		
		</script>
	</head>

	<body style="background-color: #E8E8E8;">
		<div class="bodybox">
			<div class="pay_shouone" id="pay_shouone">
				<div class="pay_shouonebox">
					<h3>确认离开订单将被取消</h3>
					<div class="paffu_zt">
						<a  onclick="hidediv()">取消支付</a>
						<a class="pay_fu" href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxc46e199f49e7a958&redirect_uri=http://www.bolihaiwe.com/blhr-web/bolipay/&response_type=code&scope=snsapi_userinfo&state=${money}|${orderNum }|${payType}#wechat_redirect">确认付款</a>
					</div>
				</div>
			</div>
			<div class="pay_shoutwo">
				<div class="pay_shouonebox">
					<div class="pay_shoutwobox">
						<h2>恭喜您！</h2>
						<p>加入海儿VIP会员</p>
					</div>
				</div>
			</div>
			<div class="xt_jj">
				<div class="xt_jj_con">
					<div class="xt_jj_pic">
					    <div id="divcss5">
					     <c:if test="${category==1}">
			                <img src="${photo }" />
			             </c:if>
			             <c:if test="${category==2}">
			                <img src="<%=request.getContextPath() %>/${photo }" style="width: 40px;height: 40px"/>
			             </c:if>
						</div>
					</div>
					<div class="xt_jj_txt">
						玻璃海账号:${username }
					</div>
					<!--<div class="pay_gq">您的VIP会员已过期</div>-->
				</div>
			</div>
			<div class="pay_dd">
				<div class="pay_ddtitle">
					订单号 ${orderNum}
				</div>
				<div class="pay_ddcon">
					<div class="pay_ddcon_zuo">
						<p>您已经选择：</p>
						<c:if test="${payType==1}"><h3>玻璃海一年月员套餐</h3></c:if>
						
					    <c:if test="${payType==2}"><h3>玻璃海6个月员套餐</h3></c:if>
						
						<c:if test="${payType==3}"><h3>玻璃海1个月员套餐</h3></c:if>
						
						<c:if test="${payType==4}"><h3>玻璃海24小时会员套餐</h3></c:if>
						<span>产品说明:付款后立即生效</span>
					</div>
					<div class="pay_ddcon_you">
						<p><label class="icon">&yen;</label>${money}</p>
						<span>限时优惠</span>
					</div>
				</div>
			</div>
			<div class="pay_je">
				<div class="pay_jetitle">
					<span>订单金额</span>
					<span>${money}元</span>
				</div>
				<div class="pay_jewezf" onclick="showdiv()">
					<ul>
<%-- 						<a href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxc46e199f49e7a958&redirect_uri=http://www.bolihaiwe.com/blhr-web/bolipay/&response_type=code&scope=snsapi_userinfo&state=${money}|${orderNum }|${payType}#wechat_redirect">
 --%>							<li>
								<div style="background-image: url(<%=request.getContextPath() %>/blhrf/img/wechat.png);" class="pay_jewezf_zuo pay_left">
									<p>微信支付</p>
									<span>微信安全支付</span>
								</div>
								<div class="pay_jewezf_you">
									<img src="<%=request.getContextPath() %>/blhrf/img/xt_jt.png" />
								</div>
							</li>
				<!-- 		</a> -->
					</ul>
				</div>
			</div>
			<%-- <div class="pay_je pay_jeling">
				<div class="pay_jetitle">
					<span>其它支付方式</span>
					<span></span>
				</div>
				<div class="pay_jewezf">
					<ul>
						<a href="<%=request.getContextPath() %>/blhrf/">
							<li>
								<div class="border">
									<div style="background-image: url(<%=request.getContextPath() %>/blhrf/img/xt_kj.png);" class="pay_jewezf_zuo">
									<p>快捷支付</p>
									<span>京东快捷支付服务</span>
								</div>
								<div class="pay_jewezf_you">
									<img src="<%=request.getContextPath() %>/blhrf/img/xt_jt.png" />
								</div>
								</div>
								
							</li>
						</a>
					</ul>
				</div>
			</div> --%>
			<div class="xtfoot">
				<ul>
					<li>
						<a href="<%=request.getContextPath() %>/wechatlogin?userId=${userId}">回放课程</a>
					</li>
					<li>
						<a href="#">直播课程</a>
					</li>
					<li class="xt_dot">
						<a href="<%=request.getContextPath() %>/initMyClassInfo?userId=${userId}">我的课堂</a>
					</li>
				</ul>
			</div>
		</div>

	</body>

</html>