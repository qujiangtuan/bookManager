<%@page import="com.bie.dao.impl.BookDaoImpl"%>
<%@page import="com.bie.dao.BookDao"%>
<%@page import="com.bie.model.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.bie.model.User"%>
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
	<title>title</title>
	<link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/lunbostyle.css">
	<style type="text/css">
		.no_1{height:50px;}
		.nav{height:50px;}
		.plist a:hover{text-decoration:underline;color:#FF3300;}
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
            <div class="logo"><a href="main2.jsp"><img src="img/Books-Store-Logo2.jpg" alt=""></a></div>
            <div class="title">
                <div class="search">
                <form action="SearchServlet" method="get">
                    <select class="select" name="select">
                         <option value ="도서명">도서명 </option>
                          <option value ="종류">종류</option>
                          <option value ="작가">작가</option>
                          <option value="출판사">출판사</option>
                    </select>
                    <input type="text"  name="search_input" class="search-text" id="search-text">
<!--                     <div class="search-picture" id="search-picture" onclick="search()"><img src="img/search2.PNG" alt=""></div> -->
                    <input type="submit" class="search-picture" id="search-picture" value="">
				</form>
                </div>
                <div class="cou_center">
                	<ul>
                		<li>010-4042-1777</li>
                        <li>고객센터:</a></li>
<!--                         <li ><a href="noteBorder.jsp"><div class="note_bo">게시판</div></a></li> -->
                        <li ><a href="noteboard.jsp"><div class="note_bo">게시판</div></a></li>
                    </ul>
                </div>
<!--                 <div class="nav-title"> -->
<!--                     <ul> -->
<!--                         <li><a href="add2.html">일정등록</a></li> -->
<!--                         <li><a href="#">일정게시판</a> </li> -->
<!--                         <li><a href="#">개인게시판</a> </li> -->
<!--                     </ul> -->
<!--                 </div> -->
                <div class="login">
                    <ul>
                        <li ><a href="logout.jsp">로그아웃</a></li>
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
               <!--轮播图片-->
	<div class="main" id="main">
		<div class="menu-box">
		</div>
		<!--内容-->
		<div class="sub-menu hide" id="sub-menu">
			<div class="inner-box">
				<div class="sub-inner-box">
					<div class="title">과학</div>
					<div class="sub-row">
						<span class="bold mr10">기술과학 :</span>
						<a href="SearchServlet2?type=a" >건축학</a>
						<span class="ml10 mr10">/</span>
						<a href="SearchServlet2?type=b">기계학</a>
						<span class="ml10 mr10">/</span>
						<a href="SearchServlet2?type=c">화학</a>
					</div>
					<div class="sub-row">
						<span class="bold mr10">자연과학 :</span>
						<a href="SearchServlet2?type=d">수학</a>
						<span class="ml10 mr10">/</span>
						<a href="SearchServlet2?type=e">물리학</a>
						<span class="ml10 mr10">/</span>
						<a href="SearchServlet2?type=f">식물학</a>
						<span class="ml10 mr10">/</span>
						<a href="SearchServlet2?type=g">통계학</a>
						<span class="ml10 mr10">/</span>
						<a href="SearchServlet2?type=ta">기타</a>
					</div>
					<div class="sub-row">
						<span class="bold mr10">사회과학：</span>
						<a href="SearchServlet2?type=h">경제학</a>
						<span class="ml10 mr10">/</span>
						<a href="SearchServlet2?type=i">정치학</a>
						<span class="ml10 mr10">/</span>
						<a href="SearchServlet2?type=n">법학</a>
					</div>
				</div>
			</div>
			<div class="inner-box">
				<div class="sub-inner-box">
					<div class="title">예술</div>
					<div class="sub-row">
                       <span class="bold mr10">음악 :</span>
                       <a href="SearchServlet2?type=j">음악악보</a>
                       <span class="ml10 mr10">/</span>
                       <a href="SearchServlet2?type=k">초급악리</a>
                       <span class="ml10 mr10">/</span>
                       <a href="SearchServlet2?type=ta">기타</a>
					</div>
					<div class="sub-row">
                       <span class="bold mr10">연극:</span>
                       <a href="SearchServlet2?type=l">영화잡지</a>
                       <span class="ml10 mr10">/</span>
                       <a href="SearchServlet2?type=m">서양예술</a>
                       <span class="ml10 mr10">/</span>
                       <a href="SearchServlet2?type=ta">기타</a>
					</div>
					</div>
			</div>
			<div class="inner-box">
				<div class="sub-inner-box">
					<div class="title">언어</div>
					<div class="sub-row">
                       <span class="bold mr10">중국어 :</span>
                       <a href="SearchServlet2?type=o">중국어회화</a>
                       <span class="ml10 mr10">/</span>
                       <a href="SearchServlet2?type=p">HSK기출문제</a>
                       <span class="ml10 mr10">/</span>
                       <a href="SearchServlet2?type=ta">기타</a>
					</div>
					<div class="sub-row">
                       <span class="bold mr10">영어：</span>
                       <a href="SearchServlet2?type=q">영문영법</a>
                       <span class="ml10 mr10">/</span>
                       <a href="SearchServlet2?type=r">단어장</a>
                       <span class="ml10 mr10">/</span>
                       <a href="SearchServlet2?type=ta">기타</a>
					</div>
					<div class="sub-row">
                       <span class="bold mr10">일본어 ：</span>
                       <a href="SearchServlet2?type=s">만화</a>
                       <span class="ml10 mr10">/</span>
                       <a href="SearchServlet2?type=t">문법</a>
                       <span class="ml10 mr10">/</span>
                       <a href="SearchServlet2?type=ta">기타</a>
				</div>
				</div>
			</div>
			<div class="inner-box">
				<div class="sub-inner-box">
					<div class="title">기타</div>
					<div class="sub-row">
                       <span class="bold mr10">문확：</span>
                       <a href="SearchServlet2?type=u"">한국문학</a>
                       <span class="ml10 mr10">/</span>
                       <a href="SearchServlet2?type=v">일본문학</a>
                       <span class="ml10 mr10">/</span>
                       <a href="SearchServlet2?type=w">영미문학</a>
                       <span class="ml10 mr10">/</span>
                       <a href="SearchServlet2?type=ta">기타</a>
					</div>
					<div class="sub-row">
                       <span class="bold mr10">역사：</span>
                       <a href="SearchServlet2?type=x">아시아</a>
                       <span class="ml10 mr10">/</span>
                       <a href="SearchServlet2?type=y">유럽</a>
                       <span class="ml10 mr10">/</span>
                       <a href="SearchServlet2?type=ta">기타</a>
					</div>
				</div>
			</div>
		</div>
		<!-- 菜单 -->
		<div class="menu-content" id="menu-content">
			<div class="menu-item">
				<a href="SearchServlet2?type=aa">
					<span>과학</span>
					<i class="icon">&#xe665;</i>
				</a>
			</div>
			<div class="menu-item">
				<a href="SearchServlet2?type=bb">
					<span>예술</span>
					<i class="icon">&#xe665;</i>
				</a>
			</div>
			<div class="menu-item">
				<a href="SearchServlet2?type=cc">
					<span>언어</span>
					<i class="icon">&#xe665;</i>
				</a>
			</div>
			<div class="menu-item">
				<a href="SearchServlet2?type=ta">
					<span>기타</span>
					<i class="icon">&#xe665;</i>
				</a>
			</div>
		</div>
		<div class="banner" id="banner">
			<a href="#">
				<div class="banner-slide slide1 slide-active"></div>
			</a>
			<a href="#">
				<div class="banner-slide slide2"></div>
			</a>
			<a href="#">
				<div class="banner-slide slide3"></div>
			</a>
		</div>
		<a href="javascript:void(0)" class="button prev" id="prev"></a>
		<a href="javascript:void(0)" class="button next" id="next"></a>
		<div class="dots" id="dots">
			<span class="active"></span>
			<span></span>
			<span></span>
		</div>
	</div>
	<%
	//获取Tomcat的绝对路径
		String realPath = request.getSession().
	    getServletContext().getRealPath("/").replaceAll("\\\\", "//");
	
		Book book=new Book();
		BookDao dao=new BookDaoImpl();
// 		List<Book> list=dao.select("select * from book",null);
		Book getbook = (Book)request.getSession().getAttribute("searchBook");
		if(getbook==null){
			getbook=new Book();
		}
		List<Book> list=dao.getBookList(getbook);
		int sum=list.size();
	%>
	<!-- ABOUT2区 -->
			<div class="about2">
				<table class="table" cellspacing="10">
				<!-- m=1 -->
				<%if(sum==1){ %>
					<tr>
						<td class="background1">
									<a href="detail.jsp?id=${list.get(0).getId() }"><img src="<%=list.get(0).getPic()%>"></a>
									<div class="c1"  id="shoucang<%=list.get(0).getBookid() %>" onclick="changPic(<%=sum%>,<%=list.get(0).getBookid() %>)"></div>
									<div class="book_title"><h3><%=list.get(0).getBookname() %></h3></div>
						</td>
						<td></td><td></td><td></td>
					</tr>
				<%} %>
				<!-- m=1 -->
				<%if(sum==2){ %>
					<tr>
						<td class="background1">
									<a href="doInfo.jsp?bookid=<%=list.get(0).getBookid()%>"><img src="<%=list.get(0).getPic()%>"></a>
									<div class="c1"  id="shoucang<%=list.get(0).getBookid() %>" onclick="changPic(<%=sum%>,<%=list.get(0).getBookid() %>)"></div>
									<div class="book_title"><h3><%=list.get(0).getBookname() %></h3></div>
						</td>
						<td class="background1">
									<a href="doInfo.jsp?bookid=<%=list.get(1).getBookid()%>"><img src="<%=list.get(1).getPic()%>"></a>
									<div class="c1"  id="shoucang<%=list.get(1).getBookid() %>" onclick="changPic(<%=sum%>,<%=list.get(1).getBookid() %>)"></div>
									<div class="book_title"><h3><%=list.get(1).getBookname() %></h3></div>
						</td>
						<td></td><td></td>
					</tr>
				<%} %>
				<!--m=1 -->
				<%if(sum==3){ %>
					<tr>
						<td class="background1">
									<a href="doInfo.jsp?bookid=<%=list.get(0).getBookid()%>"><img src="<%=list.get(0).getPic()%>"></a>
									<div class="c1"  id="shoucang<%=list.get(0).getBookid() %>" onclick="changPic(<%=sum%>,<%=list.get(0).getBookid() %>)"></div>
									<div class="book_title"><h3><%=list.get(0).getBookname() %></h3></div>
						</td>
						<td class="background1">
									<a href="doInfo.jsp?bookid=<%=list.get(1).getBookid()%>"><img src="<%=list.get(1).getPic()%>"></a>
									<div class="c1"  id="shoucang<%=list.get(1).getBookid() %>" onclick="changPic(<%=sum%>,<%=list.get(1).getBookid() %>%>)"></div>
									<div class="book_title"><h3><%=list.get(1).getBookname() %></h3></div>
						</td>
						<td class="background1">
									<a href="doInfo.jsp?bookid=<%=list.get(2).getBookid()%>"><img src="<%=list.get(2).getPic()%>"></a>
									<div class="c1"  id="shoucang<%=list.get(2).getBookid() %>" onclick="changPic(<%=sum%>,<%=list.get(2).getBookid() %>)"></div>
									<div class="book_title"><h3><%=list.get(2).getBookname() %></h3></div>
						</td>
						<td></td>
					</tr>
				<%} %>
				<!--m=1 -->
				<%if(sum==4){ %>
					<tr>
						<td class="background1">
									<a href="doInfo.jsp?bookid=<%=list.get(0).getBookid()%>"><img src="<%=list.get(0).getPic()%>"></a>
									<div class="c1"  id="shoucang<%=list.get(0).getBookid() %>" onclick="changPic(<%=sum%>,<%=list.get(0).getBookid() %>)"></div>
									<div class="book_title"><h3><%=list.get(0).getBookname() %></h3></div>
						</td>
						<td class="background1">
									<a href="doInfo.jsp?bookid=<%=list.get(1).getBookid()%>"><img src="<%=list.get(1).getPic()%>"></a>
									<div class="c1"  id="shoucang<%=list.get(1).getBookid() %>" onclick="changPic(<%=sum%>,<%=list.get(1).getBookid() %>)"></div>
									<div class="book_title"><h3><%=list.get(1).getBookname() %></h3></div>
						</td>
						<td class="background1">
									<a href="doInfo.jsp?bookid=<%=list.get(2).getBookid()%>"><img src="<%=list.get(2).getPic()%>"></a>
									<div class="c1"  id="shoucang<%=list.get(2).getBookid() %>" onclick="changPic(<%=sum%>,<%=list.get(2).getBookid() %>)"></div>
									<div class="book_title"><h3><%=list.get(2).getBookname() %></h3></div>
						</td>
						<td class="background1">
									<a href="doInfo.jsp?bookid=<%=list.get(3).getBookid()%>"><img src="<%=list.get(3).getPic()%>"></a>
									<div class="c1 "  id="shoucang<%=list.get(3).getBookid() %>" onclick="changPic(<%=sum%>,<%=list.get(3).getBookid() %>)"></div>
									<div class="book_title"><h3><%=list.get(3).getBookname() %></h3></div>
						</td>
					</tr>
				<%} %>
				<%if(sum>4){ %>
					<% for(int i=0;i<sum;i++){ %>
						<%if((i+1)%4==1){ %>
							<tr>
						<%} %>
								<td class="background1">
									<a href="doInfo.jsp?bookid=<%=list.get(i).getBookid()%>"><img src="<%=list.get(i).getPic()%>"></a>
									<div class="c1"  id="shoucang<%=list.get(i).getBookid() %>" onclick="changPic(<%=sum%>,<%=list.get(i).getBookid()%>)"></div>
									<div class="book_title"><h3><%=list.get(i).getBookname() %></h3></div>
							 	 </td>
						<%if((i+1)%4==0){ %>
							</tr>
						<%} %>
						
<%-- 						<%if(sum<4){ %> --%>
<!-- 						</tr> -->
<%-- 						<%} %> --%>
					<%} %>
				<%} %>

		</table>
			</div>
	<div class="footer">
		대연캠퍼스 : (48513) 부산광역시 남구 용소로 45 TEL : 051-629-4114 FAX : 051-629-5119  |  용당캠퍼스 : (48547) 부산광역시 남구 신선로 365 TEL : 051-629-4114 FAX : 051-629-6040
	</div>
		
	</div>
	<script type="text/javascript">
		function changPic(sum,id){
			var start=document.getElementById("shoucang"+id);
				if(start.className=="c1"){
					start.className="c2";
					window.location.href="doInfo5.jsp?bookid="+id;
				}else{
					start.className="c1";
				}
		}
		changPic();
	</script>
	<script src="js/lunboscript.js"></script>
	<script src="js/main.js"></script>
</body>
</html>