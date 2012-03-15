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
<title>注册成功</title>
<script type="text/javascript" src="scripts/jquery-1.7.1.min.js"></script>
<script src="scripts/artDialog/jquery.artDialog.js?skin=chrome"></script>
<script src="scripts/artDialog/plugins/iframeTools.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		setInterval("window.location = 'simplaAdmin_login.jsp';",1000);
	});
</script>
</head>

<body style="background-image:url(images/sinablogb.jpg);background-position:center top;background-repeat:no-repeat;width:100%;height:600px;">
注册成功...
</body>
</html>