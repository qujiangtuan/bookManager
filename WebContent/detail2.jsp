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
/* a{font-size:24px;text-decoration:none;} */
/* a:hover{text-decoration:underline;font-size:28px;} */
.table2a{font-size:24px;text-decoration:none;}
.table2 a:hover{text-decoration:underline;font-size:28px;}
.table_div2{width:800px;height:auto;margin:0 auto;}
.table2{width:100%;height:700px;color:green;font-size:24px; }
.table2 img{height:400px;}
.table2 .l{width:200px;text-align:center;}
.table2 .h{height:500px;}
.table2 tr{width:200px;}
.table2 td{background-color:#93FF93;border-radius:5px;margin:10px 10px;}
.picTd{text-align:center;}
.user-pList{width:100px;height:110px;}
</style>
</head>
<body>
<h1>도서상세정보화면</h1>
<%
	Book book=(Book)session.getAttribute("book");
%>
<div class="table_div2">
<!-- cellpadding="10" cellspacing="20"  -->
<table align="center" class="table2" border="2">
<!-- 	<tr> -->
<!-- 		<td class="l">번호</td> -->
<%-- 		<td><%=book.getBookid() %></td> --%>
<!-- 	</tr> -->
	<tr>
		<td class="l">도서명</td>
		<td><%=book.getBookname() %></td>
	</tr>
	<tr>
		<td class="l">작자</td>
		<td><%=book.getAuthor() %></td>
	</tr>
	<tr>
		<td class="l">출판사</td>
		<td><%=book.getPublish() %></td>
	</tr>
	<tr class="h">
		<td class="l">사진</td>
		<td class="picTd">
		<img src="<%=book.getPic() %>">
		</td>
	</tr>
</table>
</div>

</body>
</html>
