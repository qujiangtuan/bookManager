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
                    <select class="select">
                    	<option value ="volvo">전체 </option>
                          <option value ="volvo">과학 </option>
                          <option value ="saab">예술</option>
                          <option value="opel">언어</option>
                          <option value="audi">기타</option>
                    </select>
                    <input type="text" class="search-text">
                    <div class="search-picture"><a href="#"><img src="img/search2.PNG" alt=""></a></div>
                    <!-- <div class="search-text"></div> -->
                    
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
                        <p class="plist"><a href="#">개인정보</a></p>
                        <p class="plist"><a href="#">장바구니</a></p>
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
						<a href="">건축학</a>
						<span class="ml10 mr10">/</span>
						<a href="">기계학</a>
						<span class="ml10 mr10">/</span>
						<a href="">화학</a>
					</div>
					<div class="sub-row">
						<span class="bold mr10">자연과학 :</span>
						<a href="">수학</a>
						<span class="ml10 mr10">/</span>
						<a href="">물리학</a>
						<span class="ml10 mr10">/</span>
						<a href="">식물학</a>
						<span class="ml10 mr10">/</span>
						<a href="">통계학</a>
						<span class="ml10 mr10">/</span>
						<a href="">기타</a>
					</div>
					<div class="sub-row">
						<span class="bold mr10">사회과학：</span>
						<a href="">경제학</a>
						<span class="ml10 mr10">/</span>
						<a href="">정치학</a>
						<span class="ml10 mr10">/</span>
						<a href="">법학</a>
					</div>
				</div>
			</div>
			<div class="inner-box">
				<div class="sub-inner-box">
					<div class="title">예술</div>
					<div class="sub-row">
                       <span class="bold mr10">음악 :</span>
                       <a href="">음악악보</a>
                       <span class="ml10 mr10">/</span>
                       <a href="">초급악리</a>
                       <span class="ml10 mr10">/</span>
                       <a href="">기타</a>
					</div>
					<div class="sub-row">
                       <span class="bold mr10">연극:</span>
                       <a href="">영화잡지</a>
                       <span class="ml10 mr10">/</span>
                       <a href="">서양 예술</a>
                       <span class="ml10 mr10">/</span>
                       <a href="">기타</a>
					</div>
					</div>
			</div>
			<div class="inner-box">
				<div class="sub-inner-box">
					<div class="title">언어</div>
					<div class="sub-row">
                       <span class="bold mr10">중국어 :</span>
                       <a href="">중국어회화</a>
                       <span class="ml10 mr10">/</span>
                       <a href="">HSK기출문제</a>
                       <span class="ml10 mr10">/</span>
                       <a href="">기타</a>
					</div>
					<div class="sub-row">
                       <span class="bold mr10">영어：</span>
                       <a href="">영문영법</a>
                       <span class="ml10 mr10">/</span>
                       <a href="">단어장</a>
                       <span class="ml10 mr10">/</span>
                       <a href="">기타</a>
					</div>
					<div class="sub-row">
                       <span class="bold mr10">일본어 ：</span>
                       <a href="">만화</a>
                       <span class="ml10 mr10">/</span>
                       <a href="">문법</a>
                       <span class="ml10 mr10">/</span>
                       <a href="">기타</a>
				</div>
				</div>
			</div>
			<div class="inner-box">
				<div class="sub-inner-box">
					<div class="title">기타</div>
					<div class="sub-row">
                       <span class="bold mr10">문확：</span>
                       <a href="">한국문학</a>
                       <span class="ml10 mr10">/</span>
                       <a href="">일본문학</a>
                       <span class="ml10 mr10">/</span>
                       <a href="">영미문학</a>
                       <span class="ml10 mr10">/</span>
                       <a href="">기타</a>
					</div>
					<div class="sub-row">
                       <span class="bold mr10">역사：</span>
                       <a href="">아시아</a>
                       <span class="ml10 mr10">/</span>
                       <a href="">유럽</a>
                       <span class="ml10 mr10">/</span>
                       <a href="">기타</a>
					</div>
				</div>
			</div>
		</div>
		<!-- 菜单 -->
		<div class="menu-content" id="menu-content">
			<div class="menu-item">
				<a href="">
					<span>과학</span>
					<i class="icon">&#xe665;</i>
				</a>
			</div>
			<div class="menu-item">
				<a href="">
					<span>예술</span>
					<i class="icon">&#xe665;</i>
				</a>
			</div>
			<div class="menu-item">
				<a href="">
					<span>언어</span>
					<i class="icon">&#xe665;</i>
				</a>
			</div>
			<div class="menu-item">
				<a href="">
					<span>기타</span>
					<i class="icon">&#xe665;</i>
				</a>
			</div>
		</div>
		<div class="banner" id="banner">
			<a href="">
				<div class="banner-slide slide1 slide-active"></div>
			</a>
			<a href="">
				<div class="banner-slide slide2"></div>
			</a>
			<a href="">
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
		List<Book> list=dao.select("select * from book",null);
		int sum=list.size();
// 		System.out.println(list);
	%>
	<!-- ABOUT2区 -->
			<div class="about2">
				<table class="table" >
				<% for(int i=1;i<sum;i++){ %>
					<%if(i%4==1){ %>
						<tr>
					<%} %>
							<td class="background1">
								<img src="<%=list.get(i).getPic()%>">
								<div class="c1  <%=i %>"  id="shoucang" onclick="changPic(<%=sum%>,<%=i%>)"></div>
								<div class="book_title"><h3><%=list.get(i).getBookname() %></h3></div>
						 	 </td>
					<%if(i%4==0){ %>
						</tr>
					<%} %>
					
				<%}%>
			
				
		</table>
			</div>
	<div class="footer">
		대연캠퍼스 : (48513) 부산광역시 남구 용소로 45 TEL : 051-629-4114 FAX : 051-629-5119  |  용당캠퍼스 : (48547) 부산광역시 남구 신선로 365 TEL : 051-629-4114 FAX : 051-629-6040
	</div>
		
	</div>
	<script type="text/javascript">
		function changPic(sum,i){
			var start=document.getElementById("shoucang");
// 			document.write(start.className);
// 			document.write("<br>");
// 			document.write("sum="+sum);
// 			document.write("<br>");
// 			document.write("i="+i);
// 			document.write("<br>");
// 			start.addEventListener("click",function(){
	
// 			for(i=1;i<sum;i++){
// 				document.write("c1 "+i);
				var k="c1 "+i;
// 				document.write(k);
				if(start.className=="c1 "+i){
					start.className="c2 "+i;
				}else{
					start.className="c1 "+i;
				}
// 			}
			
		
// 				if(start.className=="c1 "){
// 					start.className="c2 ";
// 				}else{
// 					start.className="c1 "i;
// 				}
			
				
// 			});
		}
		changPic();
	</script>
	<script src="js/lunboscript.js"></script>
	<script src="js/main.js"></script>
</body>
</html>