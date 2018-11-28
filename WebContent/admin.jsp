<%@page import="com.bie.dao.impl.BookDaoImpl"%>
<%@page import="com.bie.dao.BookDao"%>
<%@page import="com.bie.model.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 화면</title>

<style type="text/css">
.c{margin-right:40px;margin-left:40px;}
h1{text-align:center;}
a{font-size:24px;text-decoration:none;color:black;}
a:hover{text-decoration:underline;color:#FF3300;}
h1{color:#00FF99;}
.table_div{width:1000px;height:800px;margin-top:-50px;margin:0 auto;}
table{ width:100%;}
.table_title{height:6px;}
.pic_list{height:100px;}
.pic_list img{height:98px;}
tr td{text-align:center;}
</style>

<script type="text/javascript">
	function clickIt(){
		var p2=document.getElementById("t2").value;
		location.href="admin.jsp?p="+p2;
	}
</script>
</head>
<body>
<marquee><h1>관리자화면</h1></marquee>
<a href="insertbook.jsp">도서추가</a><br/>
<a href="logout.jsp">로그아웃</a>

<%
//获取Tomcat的绝对路径
	String realPath = request.getSession().
    getServletContext().getRealPath("/").replaceAll("\\\\", "//");
//     System.out.println(realPath);
    
	Book book=new Book();
	BookDao dao=new BookDaoImpl();
	//2:获取从下面上一页下一页传来的参数p
	String p2=request.getParameter("p");
	
	//1:设置好第一页开始和一页有五条记录
	int p=1;
	int r=5;
	//5:获取到返回的总页数,将每页的总记录数传进去
	int count=dao.getCount(r);
	
	//3:如果p2不为null且不为空，就转化为p
	if(p2!=null && !p2.equals("")){
		p=Integer.parseInt(p2);
	}
	//4:如果页数为负的那么就赋值为首页
	if(p<=0){
		p=1;
	}
	
	//6:控制后面的页数，如果大于总页数，将最后一页赋值为尾页即可
	if(p>=count){
		p=count;
	}
	
	//7:调用分页的方法进行分页操作
	List<Book> list=dao.bookPage(p, r);
	request.setAttribute("list",list);
	
	request.setAttribute("book", book);
// 	System.out.println(list);
%>
<div class="table_div">
<table align="center" cellpadding="10" cellspacing="10">
	
	<tr bgcolor="green" class="table_title">
		<td>번호</td>
		<td>도서명</td>
		<td>가격</td>
		<td>작자</td>
		<td>사진</td>
		<td>출판사</td>
		<td>수정</td>
		<td>삭제</td>
	</tr>
	<c:set var="bg" value=""></c:set>
	<c:forEach var="b" items="${list }" varStatus="i">
	<c:if test="${i.index%2==0 }">
		<c:set var="bg" value="#09F7F7"></c:set>
	</c:if>
	<c:if test="${i.index%2==1 }">
		<c:set var="bg" value="#7755AA"></c:set>
	</c:if>
	<tr bgcolor="${bg }" class="pic_list"> 
			<td>${b.bookid}</td>
			<td><a href="doInfo2.jsp?bookid=${b.bookid}">${b.bookname }</a></td>
			<td>${b.price }</td>
			<td>${b.author }</td>
<%-- 			<td>${b.pic }</td> --%>
<%-- 			<td><img src="<%=realPath%>${b.pic }"></td> --%>
			<td><img src="${b.pic }"></td>
			<td>${b.publish }</td>
			<td><a href="doInfo3.jsp?bookid=${b.bookid }">도서수정</a></td>
			<td><a href="doInfo4.jsp?bookid=${b.bookid }">도서삭제</a></td>
<%-- 			out.println("<%=realPath%>${b.pic }"); --%>
	</tr>
	</c:forEach>
	
</table>
</div>
<div align="center">
	제<%=p %>/<%=count %>페이지
	<a class="c" href="admin.jsp?p=0"><</a>
	<a class="c"  href="admin.jsp?p=<%=p-1 %>"><<</a>
	<a class="c"  href="admin.jsp?p=<%=p+1 %>">>></a>
	<a class="c"  href="admin.jsp?p=<%=count%>">></a>
	<input type="text" size="2" id="t2">
	<input type="button" value="go" onclick="clickIt()"/>
</div>
</body>
</html>