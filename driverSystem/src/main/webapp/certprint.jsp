<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>certprint</title>
<link href="scripts/certprint/certprint.css" rel="stylesheet" type="text/css">
<script language="javascript" src="scripts/certprint/json-min.js"></script>
<script language="javascript" src="scripts/certprint/dragdrop-min.js"></script>
<script language="javascript" src="scripts/certprint/certprint-min.js"></script>
<style media="print">
.noprint { display: none }
</style>
<script defer>
<!--
function toPageSetup(){
	if(factory.object)
		factory.printing.PageSetup();
	else
		alert("对不起!现在不支持!");
}

function toPreview(){
	if(factory.object)
		factory.printing.Preview();
	else
		alert("对不起!现在不支持!");
}

function toPrint(){
	if(factory.object)
		factory.printing.Print(true);
	else
		window.print();
}

function toSwitchSet(){
	if(bSwitch.value=="隐藏设置"){
		bSwitch.value="显示设置";
		bodyOnBeforePrint();
	}else{
		bSwitch.value="隐藏设置";
		bodyOnAfterPrint();
	}
}

function toInit(certType){
	if (factory.object) {
		// -- basic features
		factory.printing.header = "";
		factory.printing.footer = "";
		factory.printing.portrait = true;
		factory.printing.leftMargin = 1;
		factory.printing.topMargin = 1;
		factory.printing.rightMargin = 1;
		factory.printing.bottomMargin = 1;
	}
	
	if(navigator.appName.indexOf("Explorer") > -1){	
		bSwitch.style.display="none";	
	}else{
		bSetup.style.display="none";
		bPreview.style.display="none";
	}
	
	if(certType=='0000'){	
		//证件大小[width,height]单位cm(1cm=37.795px)
		var certSize = [18.5,9.5];
		//证件背景
		var certBackImg = "scripts/certprint/img/shenli.jpg";
		//证件数据
		var certData = "'姓名','性别','国籍','出生日期','身份证件号'";
		//证件数据的位置[top,left]单位px
		var certDataPos = "[['180px','100px'],['200px','100px']]";
		
		//绘制证件打印的调整版面
		//有背景
		drawCert(certSize,certData,certDataPos,certBackImg);
		//无背景
		//drawCert(certSize,certData,certDataPos);
	}
}
-->
</script>
</head>

<body onload="toInit('0000');" onbeforeprint="bodyOnBeforePrint();" onafterprint="bodyOnAfterPrint();" >


<!--证件显示容器-->
<div id="scrollPanel" class="scroll"></div>
<!--打印工具-->
<div id="toolbarPanel" class="noprint" style="top:390px;left:4px;position: absolute;">
	<input type="button" id="bSetup" value="打印设置" onclick="toPageSetup();">
	<input type="button" id="bPreview" value="打印预览" onclick="toPreview();">
	<input type="button" id="bPrint" value="打&nbsp;&nbsp;印" onclick="toPrint();">
	<input type="button" id="bSwitch" value="隐藏设置" onclick="toSwitchSet();">
	<input type="button" id="test" value="数据位置" onclick="alert(collectDataPos());">
	<input type="text" id="dataDetail" value="">
	<input type="button" id="bDel" value="删除" onclick="dropTarget();">
	<input type="button" id="bAdd" value="增加" onclick="addDataObj(document.getElementById('dataDetail'));">
</div>
<object id="factory" style="display:none" viewastext classid="clsid:1663ED61-23EB-11D2-B92F-008048FDD814" 

codebase="scripts/certprint/smsx.cab#Version=6,3,434,26">
</body>
</html>