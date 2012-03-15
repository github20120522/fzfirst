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
<title>车辆信息</title>
<style type="text/css">
#tb tr:hover{
	background-color:#FEF693;
}
</style>
<script type="text/javascript" src="<s:url value='/'/>scripts/jquery-1.7.1.min.js"></script>
<script src="<s:url value='/'/>scripts/artDialog/jquery.artDialog.js?skin=chrome"></script>
<script src="<s:url value='/'/>scripts/artDialog/plugins/iframeTools.js"></script>
<script language="javascript" type="text/javascript" src="<s:url value='/'/>scripts/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#tb tr:even").attr("bgcolor","#CCFFCC");
		$("#tb tr:odd").attr("bgcolor","#CCE9D8");
	});
	function buy(driverid){
		art.dialog.open('driverAction!buyBill.action?oneOnce=1&driverid='+driverid+'&date='+document.all.date.value, {id: 'buyBill',title: '车票订购',width: 170,height: 120});
	}
</script>
</head>

<body style="background-image:url(images/sinablogb.jpg);background-position:center top;background-repeat:no-repeat;width:100%;height:600px;">
	<form action="driverAction!listDriverInfo.action" method="post">
		<table width="400px;" style="margin-top: 50px;margin-left: 50px;">
			<tr>
				<td colspan="2">
					车&nbsp;&nbsp;次：<input name="driverInfo.id" value="${driverInfo.id}" type="text" size="10"/>
				</td>
			</tr>
			<tr>
				<td>
					始发地：<input name="driverInfo.from_city" value="${driverInfo.from_city}" type="text" size="10"/>
				</td>
				<td>
					到达地：<input name="driverInfo.to_city" value="${driverInfo.to_city}" type="text" size="10"/>
				</td>
			</tr>
			<tr>
				<td>
					日&nbsp;&nbsp;期：<input name="date" readonly="readonly" class="Wdate" type="text" onclick="WdatePicker()"/>
				</td>
				<td>
					<input name="search" type="submit" value="查  询"/>
				</td>
			</tr>
		</table>
	</form>
	
	<table id="tb" cellpadding="0" align="center" cellspacing="0" width="800px;" style="margin-top: 50px;margin-left: 50px;">
		<tr>
			<td>车次</td>
			<td>始发地</td>
			<td>到达地</td>
			<td>开始时间</td>
			<td>到达时间</td>
			<td>里程</td>
			<td>用时</td>
			<td>价格</td>
			<td>购买</td>
		</tr>
		<s:iterator var="driverInfo" value="list">
			<tr>
				<td><s:property value="id"/></td>
				<td><s:property value="from_city"/></td>
				<td><s:property value="to_city"/></td>
				<td><s:property value="from_time"/></td>
				<td><s:property value="to_time"/></td>
				<td><s:property value="mileage"/></td>
				<td><s:property value="usetime"/></td>
				<td><s:property value="price_note"/></td>
				<td><a href="javascript:buy('<s:property value='id'/>')">订票</a></td>
			</tr>
		</s:iterator>
	</table>
	
</body>
<script type="text/javascript">
<!--
	var today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth();
	var day = today.getDate();
	if((month*1+1)<10){
		month = "0"+(month*1+1);
	}
	if(day*1<10){
		day = "0"+day;
	}
	document.all.date.value = year+"-"+month+"-"+day;
//-->
</script>
</html>