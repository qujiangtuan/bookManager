<%@page import="com.bie.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 화면</title>
<style type="text/css">
#head{height:60px; margin:0 auto;background-color:green;text-align:center;line-height:60px;}
a{font-size: 36px;}
h3{margin:0 auto;color:red;font-size:24px;}
</style>
</head>
<body>
<%
	User user=(User)session.getAttribute("user");
	if(user==null){
		response.sendRedirect("login.jsp");
	}else{
%>

<div id="head">
		<marquee><%=user.getName() %>,환영합니다!</marquee>
<%} %>
</div>
</body>
</html>