<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	//获取绝对路径路径 ,开发项目一定要使用绝对路径，不然肯定出错
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
				+ request.getServerName() + ":" + request.getServerPort()
				+ path + "/";
    //获取Tomcat的绝对路径
    String realPath = request.getSession().
            getServletContext().getRealPath("/");
//     out.println(realPath);
%>
<!DOCTYPE html ">
<html>
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 추가화면</title>
</head>
<body>
<marquee><h1>도서 추가화면</h1></marquee>
<!-- <form action="InsertBookServlet" method="post" enctype="multipart/form-data"> -->
<form action="InsertBookServlet" method="post"  enctype="multipart/form-data" >
	<table align="center" cellpadding="10" cellspacing="10" width="600px">
		<tr bgcolor="pink" align="center">
			<td>도서명</td>
			<td><input type="text" name="bookname"/></td>
		</tr>
		<tr bgcolor="green" align="center">
			<td>가격</td>
			<td><input type="text" name="price"/></td>
		</tr>
		<tr bgcolor="yellow" align="center">
			<td>작자</td>
			<td><input type="text" name="author"/></td>
		</tr>
		<tr bgcolor="green" align="center">
			<td>사진</td>
			<td><input type="file" name="pic"/></td>
		</tr>
		<tr bgcolor="blue" align="center">
			<td>출판사</td>
			<td><input type="text" name="publish"/></td>
		</tr>
		<tr bgcolor="pink" align="center"> 
			<td colspan="2" >
				<input type="submit" value="추가">
				<input type="reset" value="취소">
				<a href="admin.jsp">도서 목록</a>
			</td>
		</tr>
	</table>	
</form>
</body>
</html>