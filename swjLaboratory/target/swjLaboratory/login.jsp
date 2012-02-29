<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>登录</title>
</head>

<body>
	<h3>用户登录</h3>
	${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}
	<form action="j_spring_security_check" method="post">
		用户名:<input name="j_username" type="text"/><br/>
		密码:&nbsp;&nbsp;<input name="j_password" type="password"/><br/>
		两周内自动登录:<input name="_spring_security_remember_me" type="checkbox" checked/><br/>
		<input type="submit" value="登录" />
	</form>
	<br/>
	测试用户：{[user,user],[admin,admin]}
</body>
</html>
