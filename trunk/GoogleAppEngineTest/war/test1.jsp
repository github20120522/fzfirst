<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<script type="text/javascript">
<!--
	function menu(){
		window.location="index.html";
	}
//-->
</script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="content-type" />
		<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
		<script src="ckeditor/_samples/sample.js" type="text/javascript"></script>
		<link href="ckeditor/_samples/sample.css" rel="stylesheet"
			type="text/css" />
	</head>
	<body>

		<form action="test2.jsp" method="post">
			<p>
				<label for="editor1">
					Ckeditor Test:点击保存显示结果
				</label>
				<br />
				<textarea class="ckeditor" cols="80" id="editor2" name="editor2" rows="10">
					<font size="5" color="blue">测试ckeditor控件</font>
				</textarea>
			</p>
			<p>
				<div align="center"><input type="submit" value="提交" /> <input type="button" onclick="menu()" value="主页" /></div>
			</p>
		</form>

	</body>
</html>