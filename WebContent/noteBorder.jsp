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
<title>게시판 화면</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/lunbostyle.css">
<style type="text/css">
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

	}
	span{ 
	    color:white;
	    font-size:30px;}
	a{text-decoration:none;color:#9F35FF;}
	a:hover{text-decoration:underline;color:#FF359A;}
	.table_div{width:1000px;height:800px;margin-top:300px;margin:0 auto;}
	table{ width:100%;font-size:24px;}
	.table_title{height:30px;}
	.pic_list{height:30px;}
	tr td{text-align:center;}
	.menu{position:absolute;top:160px; left:20px;width:100px;
	height:50px;background-color:#00DB00;line-height:50px;
	text-align:center;border-radius:5px;}
	textarea{border:0px;}
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
	
		<div class="title_div1"><span>리뷰게시판</span></div>
		<a href="addNoteBorder.jsp">
		<div class="menu" >
			<h1>댓글</h1>
		</div>
		</a>
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
	<div class="table_div">
		<table align="center" cellpadding="10" cellspacing="10" class="table_note">
			<tr bgcolor="green" class="table_title">
				<td>번호</td>
				<td>작성자</td>
				<td>제목</td>
				<td>내용</td>
				<td>시간</td>
			</tr>
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
			

		</table>
	</div>

</body>
</html>