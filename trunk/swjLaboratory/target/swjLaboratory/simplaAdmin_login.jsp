<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Simpla Admin</title>
<!--                       CSS                       -->
<!-- Reset Stylesheet -->
<link rel="stylesheet" href="scripts/simplaAdmin/resources/css/reset.css" type="text/css" media="screen" />
<!-- Main Stylesheet -->
<link rel="stylesheet" href="scripts/simplaAdmin/resources/css/style.css" type="text/css" media="screen" />
<!-- Invalid Stylesheet. This makes stuff look pretty. Remove it if you want the CSS completely valid -->
<link rel="stylesheet" href="scripts/simplaAdmin/resources/css/invalid.css" type="text/css" media="screen" />
<!--                       Javascripts                       -->
<!-- jQuery -->
<script type="text/javascript" src="scripts/simplaAdmin/resources/scripts/jquery-1.3.2.min.js"></script>
<!-- jQuery Configuration -->
<script type="text/javascript" src="scripts/simplaAdmin/resources/scripts/simpla.jquery.configuration.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#j_username").focus();
});
</script>
</head>
<body id="login">
<div id="login-wrapper" class="png_bg">
  <div id="login-top">
    <h1>Simpla Admin</h1>
    <!-- Logo (221px width) -->
    <a href="#"><img id="logo" src="scripts/simplaAdmin/resources/images/logo.png" alt="Simpla Admin logo" /></a> </div>
  <!-- End #logn-top -->
  <div id="login-content">
    <form action="j_spring_security_check" method="post">
      <div class="notification information png_bg">
        <div> 系统登录 ${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message} </div>
      </div>
      <p>
        <label>用户名</label>
        <input id="j_username" name="j_username" class="text-input" type="text" />
      </p>
      <div class="clear"></div>
      <p>
        <label>密码</label>
        <input id="j_password" name="j_password" class="text-input" type="password" />
      </p>
      <div class="clear"></div>
      <p id="remember-password">
        <input id="_spring_security_remember_me" name="_spring_security_remember_me" type="checkbox" checked/>
        记住我 </p>
      <div class="clear"></div>
      <p>
        <input class="button" type="submit" value="登   陆" />
      </p>
      <div class="clear"></div>
      <p>用户admin，admin全部权限，用户user，user部分权限</p>
    </form>
  </div>
  <!-- End #login-content -->
</div>
<!-- End #login-wrapper -->
</body>
</html>
