<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="content-type" />
 <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
 <script src="ckeditor/_samples/sample.js" type="text/javascript"></script>
 <link href="ckeditor/_samples/sample.css" rel="stylesheet" type="text/css" />

  </head>
 
  <body>
 <form action="test2.jsp" method="post">
  <p>
   <label for="editor1">
    Editor 1:点击保存显示结果</label><br />
   <textarea class="ckeditor" cols="80" id="editor1" name="editor1" rows="10">&lt;p&gt;This is some &lt;strong&gt;sample text&lt;/strong&gt;. You are using &lt;a href=">
  
   
    CKEDITOR.replace(' );>
   </script>
  
  </p>
  <p>
   <input type="submit" value="Submit" />
  </p>
 </form>

  </body>
</html>