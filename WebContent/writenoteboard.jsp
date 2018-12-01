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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/lunbostyle.css">
<style type="text/css">
   .container{clear:both;}
   .no_1{height:60px;}
   .nav{height:60px;}
   .user-pList{width:100px;height:110px;}
</style>
<title>Insert title here</title>
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
                         <p class="plist"><a href="perInfo.jsp">개인정보</a></p>
                        <p class="plist"><a href="collectBookShow.jsp">관&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;심</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    		<%
						if(user==null){
							response.sendRedirect("login.jsp");
						}else{
							session.setAttribute("name",user.getName());
		    } %>
<div class="container">
	<div class="row">
		<form method="post" action="NoteBorderServlet">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color:#eeeeee; text-align: center;">게시판글쓰기양식</th>
					</tr>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="content" maxlength="2048" style="height: 350px;"></textarea></td>
						</tr>
					</tbody>
				</thead>
		</table>
		<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
		</form>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js.bootstrap.js"></script>
</body>
</html>