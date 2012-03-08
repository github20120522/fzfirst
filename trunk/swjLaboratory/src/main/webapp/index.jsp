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
<title>主页</title>
<link rel="stylesheet" type="text/css" href="scripts/vtip/vtip.css"/>
<style type="text/css">
img{
	float:left;
	cursor:hand;
}
</style>
<script type="text/javascript" src="scripts/jquery-1.7.1.min.js"></script>
<script src="scripts/artDialog/jquery.artDialog.js?skin=chrome"></script>
<script src="scripts/artDialog/plugins/iframeTools.js"></script>
<script type="text/javascript" src="scripts/vtip/vtip-min.js"></script>
<script type="text/javascript">
function ribbonFunc(ribbon){
	if(ribbon == "ribbon1"){
		art.dialog.open('certprint.jsp',{id: 'certprint',title: '票据套打',width: 720,height: 420,resize: false});
	}else if(ribbon == "ribbon2"){
		art.dialog.open('userSampleAction!viewUserSample.action', {id: 'userSample',title: '用户信息',width: "100%",height: 500});
	}else if(ribbon == "ribbon3"){
		ajaxUserSampleInputStream();
	}else if(ribbon == "ribbon4"){
		ajaxUserSampleResponse();
	}else if(ribbon == "ribbon5"){
		jsonAjaxUserSample();
	}else if(ribbon == "ribbon6"){
		art.dialog.open('fzJofc2Action!gotoJofc2.action', {id: 'jofc2',title: 'jofc2报表',width: 1045,height: 320});
	}else if(ribbon == "ribbon7"){
		art.dialog({
		    id: 'msg',
		    title: '公告',
		    content: 'hello world!',
		    icon: 'face-smile',
		    width: 300,
		    height: 150,
		    left: '100%',
		    top: '100%',
		    fixed: true,
		    drag: true,
		    resize: true,
		    lock: false,
		    ok: function(){
		    	art.dialog({id: "darkCome",title: "黑夜来袭",content: "黑夜来袭！"});
		    	this.content("你好世界!").lock();
		    	return false;
		    }
		});
	}
}

var xmlHttp;
// ajax 方法1
function ajaxUserSampleInputStream(){
	if (window.XMLHttpRequest) {
	   xmlHttp = new XMLHttpRequest();
	} else {
	   xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlHttp.onreadystatechange = ajaxUserSampleInputStreamCallBack;
	url = "userSampleAction!ajaxUserSampleInputStream.action";
	xmlHttp.open("post", url, true);
	xmlHttp.send(null);
}
function ajaxUserSampleInputStreamCallBack(){
	if(xmlHttp.readyState==4){
		if(xmlHttp.status==200){
			var str = xmlHttp.responseText;
			art.dialog({
				id: "inputStreamAjax",
				title: "inputStreamAjax",
				content: str,
				cancelVal: "关闭",
				cancel: true
			});
		}
	}
}
// ajax 方法2
function ajaxUserSampleResponse(){
	if (window.XMLHttpRequest) {
	   xmlHttp = new XMLHttpRequest();
	} else {
	   xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlHttp.onreadystatechange = ajaxUserSampleResponseCallBack;
	url = "userSampleAction!ajaxUserSampleResponse.action";
	xmlHttp.open("post", url, true);
	xmlHttp.send(null);
}
function ajaxUserSampleResponseCallBack(){
	if(xmlHttp.readyState==4){
		if(xmlHttp.status==200){
			var str = xmlHttp.responseText;
			art.dialog({
				id: "reponseAjax",
				title: "reponseAjax",
				content: str,
				cancelVal: "关闭",
				cancel: true
			});
		}
	}
}
//jsonAjax
function jsonAjaxUserSample(){
	if (window.XMLHttpRequest) {
	   xmlHttp = new XMLHttpRequest();
	} else {
	   xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlHttp.onreadystatechange = jsonAjaxUserSampleCallBack;
	url = "userSampleAction!jsonAjaxUserSample.action";
	xmlHttp.open("post", url, true);
	xmlHttp.send(null);
}
function jsonAjaxUserSampleCallBack(){
	if(xmlHttp.readyState==4){
		if(xmlHttp.status==200){
			var str = xmlHttp.responseText;
			var jsonObj = $.parseJSON(str);
			//alert(jsonObj.userSample.id+","+jsonObj.userSample.name+","+jsonObj.userSample.password);
			art.dialog({
				id: "jsonAjax",
				title: "jsonAjax",
				content: "id:"+jsonObj.userSample.id+",名称:"+jsonObj.userSample.name+",密码:"+jsonObj.userSample.password,
				cancelVal: "关闭",
				cancel: true
			});
		}
	}
}
function jsFlower(){
	art.dialog.open(
		'flower.htm',
		{
			id: 'jsflower',
			title: 'js做的玫瑰花。。这可不是图片!',
			width: 610,
			height: 610
		});
}
function jsTree(){
	art.dialog.open(
		'tree.htm',
		{
			id: 'jstree',
			title: 'js做的圣诞树。。。这可不是图片!',
			width: 500,
			height: 500
		});
}
</script>

</head>

<body>
<div style="background-image:url(images/sinablogb.jpg);background-position:center top;background-repeat:no-repeat;width:100%;height:600px;" >
	
	<div style="width:260px;height:81px;margin-left:100px;">
		<div id="ribbon1" class="vtip" title="票据套打" onclick="ribbonFunc('ribbon1');"><a href="#"><img src="images/7ribbons_03.jpg" border="0"/></a></div>
		<div id="ribbon2" class="vtip" title="id为1的用户" onclick="ribbonFunc('ribbon2');"><a href="#"><img src="images/7ribbons_05.jpg" border="0"/></a></div>
		<div id="ribbon3" class="vtip" title="inputStream方法的ajax" onclick="ribbonFunc('ribbon3');"><a href="#"><img src="images/7ribbons_07.jpg" border="0"/></a></div>
		<div id="ribbon4" class="vtip" title="response方法的ajax" onclick="ribbonFunc('ribbon4');"><a href="#"><img src="images/7ribbons_09.jpg" border="0"/></a></div>
		<div id="ribbon5" class="vtip" title="jsonAjax" onclick="ribbonFunc('ribbon5');"><a href="#"><img src="images/7ribbons_11.jpg" border="0"/></a></div>
		<div id="ribbon6" class="vtip" title="jofc2" onclick="ribbonFunc('ribbon6');"><a href="#"><img src="images/7ribbons_13.jpg" border="0"/></a></div>
		<div id="ribbon7" class="vtip" title="artDialog" onclick="ribbonFunc('ribbon7');"><a href="#"><img src="images/7ribbons_15.jpg" border="0"/></a></div>
	</div>
	<div style="margin-left: 100px;display: none;"><input id="surprise" type="button" value="送你一朵js玫瑰花" onclick="jsFlower();$(this).attr('disabled',true).attr('value','漂亮吧');"/></div>
	<div style="margin-left: 100px;display: none;"><input id="surprise" type="button" value="js圣诞树。。" onclick="jsTree();$(this).attr('disabled',true).attr('value','js圣诞树');"/></div>
</div>
</body>
</html>
