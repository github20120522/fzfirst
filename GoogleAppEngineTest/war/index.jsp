<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
  </head>
  
  <body>
    <h1 align="center"><font color="red">HelloWorld,HelloGoogleAppEngine!</font></h1><br>
	<div align="center">
		My97DatePicker日期控件：<input class="Wdate" type="text" onClick="WdatePicker()"> <font color=red>&lt;- 点我弹出日期控件</font>
	</div>
  </body>
</html>
