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
<title>注册</title>
<style type="text/css">
img{
	float:left;
	cursor:hand;
}
#tb tr:hover{
	background-color:#CCFFCC;
}
#tb td{
	width: 100px;
	color: blue;
}
#tb tr{
	line-height: 30px;
}
.double{
	background-color:#CCCCCC;
}
</style>
<script type="text/javascript" src="scripts/jquery-1.7.1.min.js"></script>
<script src="scripts/artDialog/jquery.artDialog.js?skin=chrome"></script>
<script src="scripts/artDialog/plugins/iframeTools.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//$("#tb tr:even").addClass("double");
		$("#resBtn").click(function(){
			$("#username").val("");
			$("#password").val("");
			$("#again").val("");
		});
		$("#regBtn").click(function(){
			if($("#userFlag").val() != "Y"){
				art.dialog({
					id: "userFlag",
					title: "提示信息",
					content: "用户名已存在！",
					cancelVal: "关闭",
					time: 2,
					cancel: true
				});
				$("#username").focus();
				return false;
			}else if($("#passFlag").val() != "Y"){
				art.dialog({
					id: "passFlag",
					title: "提示信息",
					content: "两次密码输入不一致！",
					cancelVal: "关闭",
					time: 2,
					cancel: true
				});
				$("#password").focus();
				return false;
			}else{
				document.forms[0].submit();
			}
		});
		$("#username").blur(function(){
			ajaxUserCheck();
		});
		$("#password").blur(function(){
			passCheck();
		});
		$("#again").blur(function(){
			passCheck();
		});
	});
	
	var xmlHttp;
	if (window.XMLHttpRequest) {
	   xmlHttp = new XMLHttpRequest();
	} else {
	   xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	function ajaxUserCheck(){
		if($("#username").val() != ""){
			xmlHttp.onreadystatechange = ajaxUserCheckCallBack;
			url = "userAction!checkUser.action?name="+$("#username").val();
			xmlHttp.open("post", encodeURI(url), true);
			xmlHttp.send(null);
		}
	}
	function ajaxUserCheckCallBack(){
		if(xmlHttp.readyState==4){
			if(xmlHttp.status==200){
				var str = xmlHttp.responseText;
				var show = "";
				if(str == "Y"){
					$("#userImgCheck").attr("src","images/success.jpg").show();
					$("#userFlag").val("Y");
				}else{
					$("#userImgCheck").attr("src","images/failed.jpg").show();
					$("#userFlag").val("");
				}
			}
		}
	}
	function passCheck(){
		if($("#password").val() == $("#again").val()){
			$("#passFlag").val("Y");
			$("#passImgCheck").attr("src","images/success.jpg").show();
		}else{
			$("#passFlag").val("");
			$("#passImgCheck").attr("src","images/failed.jpg").show();
		}
	}
</script>
</head>

<body style="background-image:url(images/sinablogb.jpg);background-position:center top;background-repeat:no-repeat;width:100%;height:600px;">
	<form action="userAction!saveUser.action" method="post">
		<div style="margin-top: 50px;margin-left: 100px;">用户注册</div>
		<table id="tb" cellpadding="0" cellspacing="0" style="margin-top: 10px;margin-left: 100px;">
			<tr><td>用户名：</td><td><input id="username" name="user.username" size="15" maxlength="8" /></td><td><img id="userImgCheck" style="display: none"/></td></tr>
			<tr><td>密码：</td><td><input id="password" name="user.password" type="password" size="15" maxlength="8" /></td><td></td></tr>
			<tr><td>密码确认：</td><td><input id="again" name="again" type="password" size="15" maxlength="8" /></td><td><img id="passImgCheck" style="display: none"/></td></tr>
		</table>
		<dir style="margin-left: 100px;">
			<input id="userFlag" type="hidden" />
			<input id="passFlag" type="hidden" />
			<input id="regBtn" type="button" value="注册" />
			<input id="resBtn" type="button" value="重置" />
		</dir>
	</form>
</body>
</html>