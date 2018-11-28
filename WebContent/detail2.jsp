<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bie.model.Book" %>
<%@ page import="com.bie.service.BookService" %>
<%@ page import="com.bie.service.impl.BookServiceImpl" %>

<%@ include file="head2.jsp" %>
<%
	//获取绝对路径路径 ,开发项目一定要使用绝对路径，不然肯定出错
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
				+ request.getServerName() + ":" + request.getServerPort()
				+ path + "/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서상세정보화면</title>

<style type="text/css">
h1{text-align:center;}
a{font-size:24px;text-decoration:none;}
a:hover{text-decoration:underline;font-size:28px;}
</style>
</head>
<body>
<h1>도서상세정보화면</h1>
<%
	Book book=(Book)session.getAttribute("book");
%>
<table align="center" cellpadding="20" cellspacing="20">
	<tr>
		<td>번호</td>
		<td>도서명</td>
		<td>가격</td>
		<td>작자</td>
		<td>사진</td>
		<td>출판사</td>
	</tr>
	<tr>
		<td><%=book.getBookid() %></td>
		<td><%=book.getBookname() %></td>
		<td><%=book.getPrice() %></td>
		<td><%=book.getAuthor() %></td>
		<td><img src="images/<%=book.getPic() %>"></td>
		<td><%=book.getPublish() %></td>
	</tr>
	<tr>
		<td colspan="3"></td>
		<!-- <td><a href="doCard.jsp">장바구니에 추가</a></td> -->
		<td><a href="admin.jsp">도서 목록</a></td>
		<td colspan="2"></td>
	</tr>
</table>

</body>
</html>
