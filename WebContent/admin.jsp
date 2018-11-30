<%@page import="com.bie.dao.impl.BookDaoImpl"%>
<%@page import="com.bie.dao.BookDao"%>
<%@page import="com.bie.model.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%
	String basePath = request.getScheme() + "://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 화면</title>
<!-- 分页 查看-->
<link rel="stylesheet" type="text/css" href="<%=basePath %>js/dataTable/jquery.dataTables.min.css">
<script type="text/javascript" src="<%=basePath %>js/dataTable/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>js/dataTable/jquery.dataTables.min.js"></script>

<style type="text/css">
body{background-color:#BBFFBB;}
.c{margin-right:40px;margin-left:40px;}
h1{text-align:center;color:#9F35FF;}
a{font-size:24px;text-decoration:none;color:black;}
a:hover{text-decoration:underline;color:#006000;}
.table_div{width:1200px;height:800px;margin:0 auto;}
table{ width:100%;}
.table_title{height:6px;}
.pic_list{height:100px;}
.pic_list img{height:98px;}
tr td{text-align:center;background-color:#BBFFBB;}
.but{width:100px;height:40px;line-height:40px;text-align:center;border-radius:5px;background-color:#FF44FF;margin-left:20px;}
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
	<div class="but"><a href="insertbook.jsp" >도서추가</a></div><br/>
	<div class="but"><a href="logout.jsp" >로그아웃</a></div>

<%
//获取Tomcat的绝对路径
	String realPath = request.getSession().
    getServletContext().getRealPath("/").replaceAll("\\\\", "//");
//     System.out.println(realPath);
    
	Book book=new Book();
	BookDao dao=new BookDaoImpl();
// 	List<Book> list=dao.bookPage(p, r);
    List<Book> list=dao.getBookList(new Book());
	request.setAttribute("list",list);
	
	request.setAttribute("book", book);
// 	System.out.println(list);
%>
<div class="table_div">
<table align="center" cellpadding="10" cellspacing="10" class="tablelist" id="example" border="1">
	<thead>
	<tr bgcolor="green" class="table_title">
		<th>번호</th>
		<th>도서명</th>
		<th>종류</th>
		<th>가격</th>
		<th>작가</th>
		<th>사진</th>
		<th>출판사</th>
		<th>수정</th>
		<th>삭제</th>
	</tr>
	</thead>
	<tbody>
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
			<td><a href="doInfo2.jsp?bookid=${b.bookid}">${b.bookTp1 }</td>
			<td>${b.price }</td>
			<td>${b.author }</td>
			<td><img src="${b.pic }"></td>
			<td>${b.publish }</td>
			<td><a href="doInfo3.jsp?bookid=${b.bookid }">도서수정</a></td>
			<td><a href="doInfo4.jsp?bookid=${b.bookid }">도서삭제</a></td>
<%-- 			out.println("<%=realPath%>${b.pic }"); --%>
	</tr>
	</c:forEach>
	</tbody>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#example").dataTable({
				 "bProcessing" : true, //DataTables载入数据时，是否显示‘进度’提示
				 "aLengthMenu" : [5, 10, 15], //更改显示记录数选项
				 "sPaginationType" : "full_numbers", //详细分页组，可以支持直接跳转到某页
				 "bAutoWidth" : true, //是否自适应宽度
				 //"bJQueryUI" : true,
				 "oLanguage": { //国际化配置  
		                "sProcessing" : "데이터 가져 오기, 기다려주세요....",    
		                "sLengthMenu" : "표시 _MENU_",    
		                "sZeroRecords" : "검색 할 내용이 없습니다.",    
		                "sInfo" : "_START_에서 _END_ 레코드까지 전체 레코드는 _TOTAL_입니다.",    
		                "sInfoEmpty" : "레코드 수는 0입니다.",    
		                "sInfoFiltered" : "(모든 기록 _MAX_)",    
		                "sInfoPostFix" : "",    
		                "sSearch" : "검색",    
		                "sUrl" : "",    
		                "oPaginate": {    
		                    "sFirst" : "<",    
		                    "sPrevious" : "<<",    
		                    "sNext" : ">>",    
		                    "sLast" : ">"    
		                }  
		            },  
		    });
		});
	</script>
</table>
</div>
<!-- <div align="center"> -->
<%-- 	제<%=p %>/<%=count %>페이지 --%>
<!-- 	<a class="c" href="admin.jsp?p=0"><</a> -->
<%-- 	<a class="c"  href="admin.jsp?p=<%=p-1 %>"><<</a> --%>
<%-- 	<a class="c"  href="admin.jsp?p=<%=p+1 %>">>></a> --%>
<%-- 	<a class="c"  href="admin.jsp?p=<%=count%>">></a> --%>
<!-- 	<input type="text" size="2" id="t2"> -->
<!-- 	<input type="button" value="go" onclick="clickIt()"/> -->
<!-- </div> -->
</body>
</html>