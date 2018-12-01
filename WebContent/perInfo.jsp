<%@page import="com.bie.dao.impl.*"%>
<%@page import="com.bie.dao.*"%>
<%@page import="com.bie.model.*"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

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
	<title>개인정보</title>
	<link rel="stylesheet" type"text/css" href="">
	<style type="text/css">
h1{text-align:center;}
h4{text-align:right;color:red;}
body{background:url(images/2.png)}
.c{background:#00DB00;border-radius:5px;}
input,.but{width:300px;height:40px;border:1px;border-radius:5px;font-size:24px;color:#6F00D2;}

.but{background-color:#00DB00;}
input::-webkit-input-placeholder { /* WebKit browsers */ 
color: #93FF93; padding-left:20px;font-size:20px;
} 
input:-moz-placeholder { /* Mozilla Firefox 4 to 18 */ 
color: #93FF93; padding-left:20px;font-size:20px;
} 
input::-moz-placeholder { /* Mozilla Firefox 19+ */ 
color: #93FF93; padding-left:20px;font-size:20px;
} 
input:-ms-input-placeholder { /* Internet Explorer 10+ */ 
color: #93FF93; padding-left:20px;font-size:20px;
} 
.font{font-size:24px;}
</style>
	</head>
<body>
<%
	User user=(User)session.getAttribute("user");
    System.out.println("user="+user);
	if(user==null){
		response.sendRedirect("login.jsp");
	}else{
%>
<form action="doUpdateUser.jsp" method="post" id="form1">
	<h1>개인정보</h1>
	<hr/>
	<table align="center">
		<tr>
			<td class="font">아&nbsp;&nbsp;이&nbsp;&nbsp;디：</td>
			<td>
				<input type="text" name="name" id="name" value="${user.name}" />
				<div id="nameError" style="display:inline;color:red;"></div>
			</td>
		</tr>
		<tr>
			<td class="font">전화번호：</td>
			<td><input type="text" name="phone" id="phone" value="<%=user.getPhone()%>"></td>
		</tr>
		<tr>
			<td class="font">이&nbsp;&nbsp;메&nbsp;&nbsp;일：</td>
			<td><input type="text" name="email" id="email" value="<%=user.getEmail()%>"></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input class="c" type="submit" value="수정"/>
			</td>
		</tr>
		<tr>
			<td ></td>
			<td>
				<button type="button" onclick="window.location.href='main2.jsp'" class="but">취소</button>
			</td>
		</tr>
	</table>
</form>
<%} %>
</body>
</html>