<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <meta http-equiv="Refresh" content="1;url=/index">
 --><title>链接测试</title>
</head>
<body>
<font size="60">
<a href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxc46e199f49e7a958&redirect_uri=http://www.bolihaiwe.com/blhr-web/wechatlogin&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect">移动端测试</a>
<a href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxc46e199f49e7a958&redirect_uri=http://www.bolihaiwe.com/blhr-web/bolipay/&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect">支付功能</a>
<a href="<%=request.getContextPath()%>/index">主页测试</a>
<a href="<%=request.getContextPath()%>/wechatlogin?userId=oA4ZPwHCtVJOBzNw3r-1TS6nn7EM">PC端移动端测试</a>
<a href="<%=request.getContextPath()%>/initsharePage">分享测试</a>
<a href="<%=request.getContextPath()%>/initChatPage">聊天测试</a>
<a href="<%=request.getContextPath()%>/initMyClassInfo?userId=zhangjie">我的课堂</a>
<a href="<%=request.getContextPath()%>/initLogin">微儿健康后台管理系统</a>
<a href="<%=request.getContextPath()%>/blhrf/touchT.jsp">长按按钮测试</a>
<%-- <a href="<%=request.getContextPath()%>/../blhrb/index.jsp">用户管理(会员讲师)</a>
<a href="<%=request.getContextPath()%>/../blhrb/dataStat.jsp">订单</a> --%>
<!-- <a href="http://203.195.235.76/jssdk/">shareDemo</a>
 --></f"blhr-web/src/main/webapp/index.jsp"ont>
</body>
</html>