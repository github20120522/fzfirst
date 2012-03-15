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
<title>我的车票</title>
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
</script>
</head>

<body style="background-image:url(images/sinablogb.jpg);background-position:center top;background-repeat:no-repeat;width:100%;height:600px;">
	<table id="tb" cellpadding="0" align="center" cellspacing="0" width="800px;" style="margin-top: 50px;margin-left: 50px;">
		<tr>
			<td>车次</td>
			<td>票号</td>
			<td>发车时间</td>
			<td>费用</td>
		</tr>
		<s:iterator var="driverBill" value="dbList">
			<tr>
				<td><s:property value="driverid"/></td>
				<td><s:property value="billcode"/></td>
				<td><s:property value="createtime"/></td>
				<td><s:property value="price"/></td>
			</tr>
		</s:iterator>
	</table>
	
</body>
</html>