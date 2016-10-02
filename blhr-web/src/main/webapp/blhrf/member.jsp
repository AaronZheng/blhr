<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/taglib.jsp"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="Keywords" content="" />
		<meta name="Description" content="" />
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>成为会员</title>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/blhrf/css/style.css" />
		<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/jquery-2.1.0.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/blhrf/js/script.js"></script>
		<!--[if (gte IE 6)&(lte IE 8)]>
  			<script type="text/javascript" src="js/selectivizr.js"></script>
  			<noscript><link rel="stylesheet" href="<%=request.getContextPath() %>/blhrf/[fallback css]" /></noscript>
		<![endif]-->
		<style type="text/css">
	    	#divcss5{ margin:10px auto} 
            #divcss5 img{ border-radius:50%}
		</style>
	</head>

	<body style="background-color: #E8E8E8;">
		<div class="bodybox">
			<div class="xt_jj">
				<div class="xt_jj_con">
					<div class="xt_jj_pic">
					    <div id="divcss5">
					     <c:if test="${category==1}">
			                <img src="${photo }" />
			             </c:if>
			             <c:if test="${category==2}">
			                <img src="<%=request.getContextPath() %>/${photo }" style="width: 46px;height: 46px"/>
			             </c:if>
						</div>
					</div>
					<div class="xt_jj_txt">
						<label>玻璃海账号:</label><span class="name">${username}</span>
					</div>
				</div>
			</div>
			<div class="xt_tc">

				<div class="xt_tc_tittle">
					<div class="xt_tc_tittlecon">
						玻璃海VIP套餐
							<c:if test="${isMember==2}">续费</c:if>
					</div>
				</div>
				<ul>
					<li><span>一年付费会员</span>
						<a href="<%=request.getContextPath() %>/payAction?userId=${userId}&payType=1">开通</a>
					</li>
					<li><span>6个月付费会员</span>
						<a href="<%=request.getContextPath() %>/payAction?userId=${userId}&payType=2">开通</a>
					</li>
					<li><span>1个月付费会员</span>
						<a href="<%=request.getContextPath() %>/payAction?userId=${userId}&payType=3">开通</a>
					</li>
					<li><span>24小时体验会员</span>
					    <a href="<%=request.getContextPath() %>/payAction?userId=${userId}&payType=4">开通</a>
					</li>
				</ul>
			</div>
			<div class="xt_qx">
				<div class="xt_tc_tittle_2">
					<div class="xt_tc_tittlecon">
						玻璃海VIP会员特权
						<a href="">会员服务协议&gt;</a>
					</div>
				</div>
				<div class="xt_qx_text">
					<span>1、会员可以收听所有免费的直播和回放课堂内容。</span>
					<span>2、直播课堂会限定进入总人数，会员优先。</span>
				</div>
			</div>
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