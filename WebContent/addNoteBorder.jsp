<%@page import="com.bie.dao.impl.*"%>
<%@page import="com.bie.dao.*"%>
<%@page import="com.bie.model.*"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>" />
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/lunbostyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>title</title>
<link rel="stylesheet" type"text/css" href="">
<style type="text/css">
	body{background:url(img/side3.jpg);}
	.note_div{
		width:410px;
		height:300px;
		margin:50px auto;
/* 		background-color:green; */
	}
	.note_table{
	width:100%;
		height:300px;
		font-size:20px;
	}
	.center{
		text-align:center;
	}
	.but{
		width:100px;
		height:40px;
		border-radius:5px;
		background-color:#00EC00;
	}
	#name{width:256px;height:25px;}
	#title{width:256px;height:25px;}
	#content{width:256px;}
/* 	.title{ */
/* 		width:100%; */
/* 		height:50px; */
/* 		line-height:50px; */
/* 		font-size:30px; */
/* 		color:white; */
/* 		background-color:#07cbc9; */
/* 		text-align:center; */
/* 	} */
	
</style>
</head>
<body>
<%
	User user=(User)session.getAttribute("user");
	if(user==null){
		response.sendRedirect("login.jsp");
	}else{
%>
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
                        <li ><a href="main.jsp">로그아웃</a></li>
<!--                         <li ><a href="register.jsp">회원가입</a></li> -->
						<li class="long"><%=user.getName() %></li>
							<%}%>
                    </ul>
                </div>
                <div class="user-picture"><a href="#"><img src="img/user.PNG" alt=""></a>
                    <div class="user-pList">
                        <p class="plist"><a href="#">개인정보</a></p>
                        <p class="plist"><a href="#">장바구니</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>


<!-- 	<div class="title">댓글 남김</div> -->
	<div class="note_div">
		<form action="NoteBorderServlet"  method="post">
			<table class="note_table" >
				<tr>
					<td>작성자：</td>
					<%
						if(user==null){
							response.sendRedirect("login.jsp");
						}else{
					%>
					<td><input type="text" name="name" id="name" value="${user.getName() }"></td>
					<%} %>
				</tr>
				<tr>
					<td>제목：</td>
					<td><input type="text" name="title" id="title"></td>
				</tr>
				<tr>
					<td>내용：</td>
					<td><textarea class="content" name="content" id="content"  rows="10" cols="30"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" class="center">
					<input type="submit" value="댓글" name="submit" id=""submit"" class="but">
					<button type="button" onclick="window.location.href='noteBorder.jsp'" class="but">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>