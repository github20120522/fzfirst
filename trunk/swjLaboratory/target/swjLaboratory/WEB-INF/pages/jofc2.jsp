<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<script type="text/javascript" src="<s:url value="/scripts/swfobject.js"/>"></script>
		<script type="text/javascript">
			swfobject.embedSWF("<s:url value="/flash/open-flash-chart.swf"/>", "fz_chart", "1024", "300", "9.0.0", 
			"expressInstall.swf",
			{"data-file":"<s:url value="/fzJofc2Action!jofc2Test.action"/>"});
		</script>
	</head>
	<body>
		<div id="fz_chart"></div>
	</body>
</html>