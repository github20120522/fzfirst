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
<title>购票</title>
<link rel="stylesheet" type="text/css" href="scripts/vtip/vtip.css"/>
<script type="text/javascript">
	function toggleCheck(id){
		if(id == "first"){
			document.all.second.checked = false;
			document.all.first.checked = true;
		}else{
			document.all.first.checked = false;
			document.all.second.checked = true;
		}
	}
</script>
</head>

<body>
	<form action="driverAction!buyBill.action">
		<div>选择价格：</div>
		<div><s:property value="driverInfo.price_note" /></div>
		<div>日期：<s:property value="date"/><input name="date" value="${date}" type="hidden"/><input name="driverid" value="${driverid}" type="hidden"/></div>
		<div>
			<s:property value="driverInfo.price_first" /><input id="first" name="driverInfo.price_first" type="checkbox" onclick="toggleCheck('first');" checked value="${driverInfo.price_first}" />
			,
			<s:property value="driverInfo.price_second" /><input id="second" name="driverInfo.price_second" type="checkbox" onclick="toggleCheck('second');" value="${driverInfo.price_second}" />
		</div>
		<div align="right">
			<input name="buyBtn" value="购买" type="submit" onclick="" />
		</div>
	</form>
</body>
</html>