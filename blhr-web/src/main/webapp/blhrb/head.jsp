<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>玻璃海微儿后台管理系统</title>
</head>

<link rel="apple-touch-icon" href="http://zzk-test.mvp01.com/resources/assets/images/apple-touch-icon.png">
<link rel="shortcut icon" href="http://zzk-test.mvp01.com/resources/assets/images/favicon.ico">
<!-- Stylesheets -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/blhrb/blhrbmc/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/blhrb/blhrbmc/bootstrap-extend.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/blhrb/blhrbmc/site.css">

<!-- Fonts -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/blhrb/blhrbmc/web-icons.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/blhrb/blhrbmc/brand-icons.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/blhrb/blhrbmc/Roboto_300_400_500_300italic.css">
<!--[if lt IE 9]>
  <script src="/resources/global/vendor/html5shiv/html5shiv.min.js"></script>
  <![endif]-->
<!--[if lt IE 10]>
  <script src="/resources/global/vendor/media-match/media.match.min.js"></script>
  <script src="/resources/global/vendor/respond/respond.min.js"></script>
  <![endif]-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/blhrb/blhrbmc/yoyo-ext.css"></head>

<link rel="stylesheet" type="text/css" href="http://www.jeasyui.net/Public/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="http://www.jeasyui.net/Public/js/easyui/themes/icon.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="http://www.jeasyui.net/Public/js/easyui/jquery.easyui.min.js"></script>
<body>
<nav class="site-navbar navbar navbar-default navbar-fixed-top navbar-mega navbar-inverse" role="navigation">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle hamburger hamburger-close navbar-toggle-left hided" data-toggle="menubar">
            <span class="sr-only">Toggle navigation</span>
            <span class="hamburger-bar"></span>
        </button>

        <button type="button" class="navbar-toggle collapsed" data-target="#site-navbar-collapse" data-toggle="collapse">
            <i class="icon wb-more-horizontal" aria-hidden="true"></i>
        </button>
  <a href="#">
        <div class="navbar-brand navbar-brand-center">
            <span class="navbar-brand-text hidden-xs">玻璃海微儿后台管理系统</span>
        </div>
        </a>
    </div>
    <div class="navbar-container container-fluid">
        <!-- Navbar Collapse -->
        <div class="collapse navbar-collapse navbar-collapse-toolbar" id="site-navbar-collapse">
            <!-- Navbar Toolbar Right -->
            <ul class="nav navbar-toolbar navbar-right navbar-toolbar-right">
                <li class="dropdown">
                    <a class="navbar-avatar dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false" data-animation="scale-up" role="button"
                    	>退出</a>
                    <ul class="dropdown-menu" role="menu">
                        <li role="presentation">
                            <a href="http://zzk-test.mvp01.com/admin/changePasswordUi" role="menuitem"><i class="icon wb-settings" aria-hidden="true"></i> 修改密码</a>
                        </li>
                        <li class="divider" role="presentation"></li>
                        <li role="presentation">
                            <a href="javascript:void(0)" role="menuitem" logouturl="/doLogout" successurl="/loginUi" id="logout"><i class="icon wb-power" aria-hidden="true"></i> 退出</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- End Navbar Toolbar Right -->
        </div>
        <!-- End Navbar Collapse -->
    </div>
</nav><div class="site-menubar site-menubar-light">
    <div class="site-menubar-body">
        <div>
            <div>
                <ul class="site-menu">
                    <li class="site-menu-category">通用</li>
                    <li class="site-menu-item has-sub">
                        <a href="<%=request.getContextPath()%>/blhrb/courseManage.jsp" target="view_frame" data-dropdown-toggle="false">
                            <i class="site-menu-icon md-view-compact" aria-hidden="true"></i>
                            <span class="site-menu-title">课程管理</span>
                        </a>
                    </li>
                    <li class="site-menu-item has-sub">
                        <a href="<%=request.getContextPath()%>/blhrb/userManage.jsp" target="view_frame" data-dropdown-toggle="false">
                            <i class="site-menu-icon md-view-compact" aria-hidden="true"></i>
                            <span class="site-menu-title">微信用户管理</span>
                        </a>
                    </li>
                    <li class="site-menu-item has-sub">
                        <a href="<%=request.getContextPath()%>/openBroacast" target="view_frame" data-dropdown-toggle="false">
                            <i class="site-menu-icon md-google-pages" aria-hidden="true"></i>
                            <span class="site-menu-title">直播管理</span>
                        </a>

                    </li>
                     <li class="site-menu-item has-sub">
                        <a href="<%=request.getContextPath()%>/blhrb/orderManage.jsp" target="view_frame" data-dropdown-toggle="false">
                            <i class="site-menu-icon md-palette" aria-hidden="true"></i>
                            <span class="site-menu-title">订单管理</span>
                        </a>
                    </li>
                   
                    <li class="site-menu-item has-sub">
                        <a href="<%=request.getContextPath()%>/blhrb/dataStat.jsp" target="view_frame" data-dropdown-toggle="false">
                            <i class="site-menu-icon md-palette" aria-hidden="true"></i>
                            <span class="site-menu-title">数据统计</span>
                        </a>
                    </li>
                    <li class="site-menu-item has-sub">
                        <a href="<%=request.getContextPath()%>/blhrb/banner.jsp" target="view_frame" data-dropdown-toggle="false">
                            <i class="site-menu-icon md-palette" aria-hidden="true"></i>
                            <span class="site-menu-title">banner管理</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
function back(){
	
	window.location.href="<%=request.getContextPath()%>/blhrb/login/login.jsp";
	<%-- <%
	request.getRequestDispatcher("/blhrb/login/login.jsp").forward(request,response);
	%> 
	<%response.sendRedirect("/blhr-web/login/login.jsp");%>--%>
}
</script>
</body>
</html>