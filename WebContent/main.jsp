<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
				+ request.getServerName() + ":" + request.getServerPort()
				+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath %>" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>main</title>
	<link rel="stylesheet" type"text/css" href="css/main.css">
	<style type="text/css">
		
	</style>
</head>
<body>
	<div id="top" class="top">
		<div class="warp">010</div>
	</div>
	<div id="header" class="header"></div>
	<div id="nav" class="nav"></div>
	<div id="banner" class="banner">
		<div class="banner-slider"></div>
		<div class="banner-search"></div>
		<div class="banner-help"></div>
	</div>
	<div id="content" class="content">
		<div class="content-tab"></div>
		<div class="content-news"></div>
		<div class="content-close"></div>
	</div>
	<div id="footer" class="footer"></div>

</body>
</html>