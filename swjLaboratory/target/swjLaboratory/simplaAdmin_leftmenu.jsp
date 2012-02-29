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
				你有 
				<a href="#" target="_self" rel="modal" title="3 Messages">3 条消息</a>
				<br />
				<br />
				<a href="index.jsp">主页</a>
				 | 
				<a href="#" onclick="window.parent.location='j_spring_security_logout'">注销</a> 
			</div>
        
			<ul id="main-nav">
				<!-- Accordion Menu -->
				<li>
					<a href="simplaAdmin_leftmenu.jsp" class="nav-top-item no-submenu">
					<!-- Add the class "no-submenu" to menu items with no sub menu -->
						刷新 
					</a> 
				</li>
				<li>
					<a href="#" class="nav-top-item"> 在线工具 </a>
					<ul>
						<li><a href="native2ascii.htm">在线native2ascii</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	<!-- End #sidebar -->
</div>
</body>
</html>
