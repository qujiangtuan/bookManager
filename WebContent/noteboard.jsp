<%@page import="com.bie.dao.impl.*"%>
<%@page import="com.bie.dao.*"%>
<%@page import="com.bie.model.*"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/lunbostyle.css">
<title>Insert title here</title>
<style type="text/css">
   .container{clear:both;}
   .no_1{height:60px;}
   .nav{height:60px;}
   .user-pList{width:100px;height:110px;}
   	.title_div1{
		clear:both;
	    position:absolute; 
/*  	    position:relative;  */
 	    top:55px; 
 	    left:0px; 
		text-align:center;
	    width:100%;
	    height:50px;
	background-color:#07cbc9;
	line-height:50px;
	font-size:24px;
	
	}
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
                        <p class="plist"><a href="perInfo.jsp">개인정보</a></p>
                        <p class="plist"><a href="collectBookShow.jsp">관&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;심</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%
//获取Tomcat的绝对路径
	String realPath = request.getSession().
    getServletContext().getRealPath("/").replaceAll("\\\\", "//");
//     System.out.println(realPath);
    
	NoteBorder note=new NoteBorder();
	NoteBorderDao noteDao=new NoteBorderDaoImpl();
	
	List<NoteBorder> notlist=noteDao.getNoteBorderList(note);
// 	System.out.println(notlist);
%>
<div class="title_div1"><span>리뷰게시판</span></div>
<div class="container">
	<div class="row">
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th style="background-color:#eeeeee; text-align: center;">번호</th>
					<th style="background-color:#eeeeee; text-align: center;">제목</th>
					<th style="background-color:#eeeeee; text-align: center;">작성자</th>
					<th style="background-color:#eeeeee; text-align: center;">내용</th>
					<th style="background-color:#eeeeee; text-align: center;">작성일</th>
				</tr>
				<tbody>
					<%for(int i=0;i<notlist.size();i++){ %>
				<tr class="pic_list">
					<td><%=notlist.get(i).getId() %></td>
					<td><%=notlist.get(i).getName() %></td>
					<td><%=notlist.get(i).getTitle() %></td>
<%-- 					<td><%=notlist.get(i).getContent() %></td> --%>
					<td><textarea class="content" name="content" id="content"  rows="3" cols="30" readonly><%=notlist.get(i).getContent() %></textarea></td>
					<td><%=notlist.get(i).getDate() %></td>
				</tr>
			<%} %>
				</tbody>
			</thead>
		</table>
		<a href="writenoteboard.jsp" class="btn btn-primary pull-right">글쓰기</a>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js.bootstrap.js"></script>
</body>
</html>