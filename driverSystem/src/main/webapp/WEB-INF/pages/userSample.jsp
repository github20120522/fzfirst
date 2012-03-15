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
<title>user sample!</title>
<style type="text/css">
img{
	float:left;
	cursor:hand;
}
</style>
</head>

<body>
<div style="background-image:url(images/sinablogb.jpg);background-position:center top;background-repeat:no-repeat;width:100%;height:600px;" >
	<div id="show" style="width:260px;margin-left:100px;padding-top:20px;">
		<s:if test="userSample != null">
			id : <input name="userSample.id" value="${userSample.id}" size="3" style="border: 0px;"/><br>
			name : <input name="userSample.name" value="${userSample.name}" size="3" style="border: 0px;"/><br>
			password : <input name="userSample.password" value="${userSample.password}" size="3" style="border: 0px;"/><br>
		</s:if>
	</div>
</div>
</body>
</html>
