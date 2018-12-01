<%@page import="com.bie.dao.impl.*"%>
<%@page import="com.bie.dao.*"%>
<%@page import="com.bie.model.*"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bie.model.Book" %>
<%@ page import="com.bie.service.BookService" %>
<%@ page import="com.bie.service.impl.BookServiceImpl" %>

<%-- <%@ include file="head.jsp" %> --%>
<%
	//获取绝对路径路径 ,开发项目一定要使用绝对路径，不然肯定出错
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
				+ request.getServerName() + ":" + request.getServerPort()
				+ path + "/";
%> 
<!DOCTYPE html >
<html>
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서상세정보</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/lunbostyle.css">
<style type="text/css">
h1{clear:both;text-align:center;}
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

	  <!-- 导航条-->
    <div class="no_1">
        <div class="nav">
            <div class="logo"><a href=""><img src="img/Books-Store-Logo2.jpg" alt=""></a></div>
            <div class="title">
                <div class="cou_center">
                	<ul>
                		<li>010-4042-1777</li>
                        <li>고객센터:</a></li>
                    </ul>
                </div>
                <div class="login">
                    <ul>
						<%
							User user=(User)session.getAttribute("user");
							if(user==null){
								%>
								<li ><a href="login.jsp">로그인</a></li>
                        		<li class="long"><a href="register.jsp">회원가입</a></li>
								<%
							}else{
						%>
                        <li ><a href="main2.jsp">로그아웃</a></li>
						<li class="long"><%=user.getName() %></li>
						<%}%>
                    </ul>
                </div>
                <div class="user-picture"><a href="#"><img src="img/user.PNG" alt=""></a>
                    <div class="user-pList">
                        <p class="plist"><a href="perInfo.jsp">개인정보</a></p>
                        <p class="plist"><a href="collectBookShow.jsp">관&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;심</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
<h1>도서상세정보</h1>
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
