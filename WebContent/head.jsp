<%@page import="com.bie.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>head</title>
<style type="text/css">
#head{background-color:#eee;height:60px;}
a{font-size: 36px;}
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
<table width=100%>
	<tr>
		<td>사용자 : <%=user.getName() %>,환영합니다!</td>
		<td align="right">
			<!-- <a href="cart.jsp">나의 장바구니</a> -->
			<a href="logout.jsp">로그아웃</a>
		</td>
	</tr>
</table>
<%} %>
</div>
</body>
</html>