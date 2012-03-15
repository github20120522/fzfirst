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
<title>用户账户信息</title>
<style type="text/css">
#tb tr:hover{
	background-color:#CCFFCC;
}
#tb td{
	color: blue;
}
</style>
<script type="text/javascript" src="scripts/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#ppBtn").click(function(){
			plusAccount();
		});
	});
	var xmlHttp;
	if (window.XMLHttpRequest) {
	   xmlHttp = new XMLHttpRequest();
	} else {
	   xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	function plusAccount(){
		xmlHttp.onreadystatechange = plusAccountCallBack;
		url = "userAction!plusAccount.action";
		xmlHttp.open("post", url, true);
		xmlHttp.send(null);
	}
	function plusAccountCallBack(){
		if(xmlHttp.readyState==4){
			if(xmlHttp.status==200){
				var str = xmlHttp.responseText;
				$("#nowPriceTd").html(":"+str);
			}
		}
	}
</script>
</head>

<body  style="background-image:url(images/sinablogb.jpg);background-position:center top;background-repeat:no-repeat;width:100%;height:600px;" >
	<div id="show" style="margin-left:20px;padding-top:50px;">
			<table id="tb" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td>账户名</td>
					<td>:<sec:authentication property="name"/></td>
				</tr>
				<tr>
					<td>当前余额</td>
					<td id="nowPriceTd">:<s:property value="userAccount.nowPrice"/></td>
				</tr>
				<tr>
					<td>历史消费</td>
					<td>:<s:property value="userAccount.historyPrice"/></td>
				</tr>
			</table>
	</div>
	<div style="margin-left:20px">
		充值：
		<input id="ppBtn" type="button" value="充值+1000"/>
	</div>
</body>
</html>
