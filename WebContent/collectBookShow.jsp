<%@page import="com.bie.dao.impl.BookDaoImpl"%>
<%@page import="com.bie.dao.BookDao"%>
<%@page import="com.bie.model.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.bie.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%
	String basePath = request.getScheme() + "://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<%-- <%@ include file="head2.jsp" %> --%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 화면</title>
<!-- 分页 查看-->
<link rel="stylesheet" type="text/css" href="<%=basePath %>js/dataTable/jquery.dataTables.min.css">
<script type="text/javascript" src="<%=basePath %>js/dataTable/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>js/dataTable/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/lunbostyle.css">
<style type="text/css">
body{background-color:#BBFFBB;}
.c{margin-right:40px;margin-left:40px;}
h1{text-align:center;color:#9F35FF;}
table a{font-size:24px;text-decoration:none;color:black;}
table a:hover{text-decoration:underline;color:#006000;}
.table_div{width:1000px;height:800px;margin:0 auto;}
table{ width:100%;}
.table_title{height:6px;}
.pic_list{height:100px;}
.pic_list img{height:98px;}
tr td{text-align:center;background-color:#BBFFBB;}
.but{width:100px;height:40px;line-height:40px;text-align:center;border-radius:5px;background-color:#FF44FF;margin-left:20px;}
.button_div{position:absolute;top:200px;left:20px;width:200px;height:100px;}
#head{height:60px; margin:0 auto;background-color:green;text-align:center;line-height:60px;clear:both;}
#head2{height:60px; margin:0 auto;text-align:center;line-height:60px;color:red;font-size:20px;}
h2{margin:0 auto;color:white;font-size:26px;}
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
<div id="head">
	<h2>도서 관심</h2>
</div>
<%
	User user3=(User)session.getAttribute("user");
	int userid=user3.getId();
	System.out.println("useridSession="+userid);
	if(user3==null){
		response.sendRedirect("login.jsp");
	}else{
%>
		<div  id="head2">
			<marquee><%=user3.getName() %>,환영합니다!</marquee>
		</div>
<%} %>

<!-- <div class="button_div"> -->
<!-- 	<div class="but"><a href="insertbook.jsp" >도서추가</a></div><br/> -->
<!-- 	<div class="but"><a href="logout.jsp" >로그아웃</a></div> -->
<!-- </div> -->
<%
//获取Tomcat的绝对路径
	String realPath = request.getSession().
    getServletContext().getRealPath("/").replaceAll("\\\\", "//");
//     System.out.println(realPath);
    
	Book book=new Book();
	book.setUserId(user3.getId());
	
	BookDao dao=new BookDaoImpl();
// 	List<Book> list=dao.bookPage(p, r);
    List<Book> list=dao.getCollectBookList(book);
	request.setAttribute("list",list);
	System.out.println("collectList====="+list);
	
// 	request.setAttribute("book", book);
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
		<th>관심</th>
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
			<td><a href="doInfo.jsp?bookid=${b.bookid}">${b.bookname }</a></td>
			<td><a href="doInfo.jsp?bookid=${b.bookid}">${b.bookTp1 }</td>
			<td>${b.price }</td>
			<td>${b.author }</td>
			<td><img src="${b.pic }"></td>
			<td>${b.publish }</td>
			<td><a href="doInfoCollectDelete.jsp?bookid=${b.bookid }&userid=<%=userid%>">취소</a></td>
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