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
<title>退票</title>
<script type="text/javascript" src="<s:url value='/'/>scripts/jquery-1.7.1.min.js"></script>
<script src="<s:url value='/'/>scripts/artDialog/jquery.artDialog.js?skin=chrome"></script>
<script src="<s:url value='/'/>scripts/artDialog/plugins/iframeTools.js"></script>
<script type="text/javascript">
	function retreatBill(){
		if($("#billcode").val() != "" && $("#billcode").val() != null){
			art.dialog.open(
				'driverAction!retreatBillEnd.action?billcode='+$("#billcode").val(), 
				{
					id: 'retreatBillEnd',
					title: '退票',
					width: 170,
					height: 120
				}
			);
		}else{
			art.dialog({id: "info",title: "提示",content: "请输入退票票号！"});
		}
	}
</script>
</head>

<body style="background-image:url(images/sinablogb.jpg);background-position:center top;background-repeat:no-repeat;width:100%;height:600px;">
	<div style="margin-left: 30px; margin-top: 50px;color: blue">
		<div>车票退票</div>
		<div>注意：退票会扣除票价20%的手续费</div>
		<div>并且在我的车票中会删除此条记录，所退款会返还到我的账户</div>
		<div>票号：<input id="billcode" name="driverBill.billcode" type="text" /></div>
		<div style="margin-left: 150px;">
			<input name="reBtn" value="退  票" type="button" onclick="retreatBill()"/>
		</div>
	</div>
</body>
</html>