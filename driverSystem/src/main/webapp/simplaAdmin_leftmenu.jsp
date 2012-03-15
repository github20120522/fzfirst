<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<base target="swj_main"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Simpla Admin</title>
<!--                       CSS                       -->
<!-- Main Stylesheet -->
<link rel="stylesheet" href="scripts/simplaAdmin/resources/css/style.css" type="text/css" media="screen" />
<!--                       Javascripts                       -->
<!-- jQuery -->
<script type="text/javascript" src="scripts/simplaAdmin/resources/scripts/jquery-1.3.2.min.js"></script>
<!-- jQuery Configuration -->
<script type="text/javascript" src="scripts/simplaAdmin/resources/scripts/simpla.jquery.configuration.js"></script>
</head>
<body id="simpla-left">
<div id="body-wrapper">
	<!-- Wrapper for the radial gradient background -->
	<div id="sidebar">
		<div id="sidebar-wrapper">
			<!-- Sidebar with logo and menu -->
			<h1 id="sidebar-title"><a href="#" target="_self">Simpla Admin</a></h1>
			<!-- Logo (221px wide) -->
			<a href="#" target="_self"><img id="logo" src="scripts/simplaAdmin/resources/images/logo.png" alt="Simpla Admin logo" /></a>
			<!-- Sidebar Profile links -->
			<div id="profile-links"> 
				你好, 
				<a href="#" target="_self"><sec:authentication property="name" /></a>, 
				<a href="#" target="_self" rel="modal" title="3 Messages">欢迎使用本系统</a>
				<br />
				<br />
				<a href="drivermain.jsp">主页</a>
				 | 
				<a href="#" onclick="window.parent.location='j_spring_security_logout'">注销</a> 
			</div>
        
			<ul id="main-nav">
				<!-- Accordion Menu -->
				<li>
					<a href="#" class="nav-top-item"> 个人中心 </a>
					<ul>
						<li><a href="driverAction!showUserBill.action">我的车票</a></li>
						<li><a href="userAction!viewAccount.action">我的账户</a></li>
					</ul>
				</li>
				<li>
					<a href="#" class="nav-top-item"> 火车票在线 </a>
					<ul>
						<li><a href="driverAction!listDriverInfo.action?oneOnce=1">车票查询与订购</a></li>
						<li><a href="driverAction!retreatBill.action">车票退票</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	<!-- End #sidebar -->
</div>
</body>
</html>
