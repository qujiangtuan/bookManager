<%@page import="com.bie.model.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html ">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	.select{width:150px;}
</style>
<title>도서 수정화면</title>
</head>
<body>
<marquee><h1>도서 수정화면</h1></marquee>
<%
	Book book=(Book)session.getAttribute("book");
%>

<form action="doupdatebook.jsp" method="post" id="userForm" name="userForm">
	<input type="hidden" name="bookid" value="${book.bookid }"/>
	<table align="center" cellpadding="10" cellspacing="10" width="100%">
		<tr bgcolor="pink" align="center">
			<td>도서명:<input type="text" name="bookname" value="${book.bookname }"/></td>
		</tr>
		<tr bgcolor="#BE77FF" align="center">
			<td>종류:
			<select class="select" name="select" >
						<option value="건축학">건축학</option>
						<option value="기계학">기계학</option>
						<option value="화학">화학</option>
						<option value="수학">수학</option>
						<option value="물리">물리</option>
						<option value="식물학">식물학</option>
						<option value="통계학">통계학</option>
						<option value="경제학">경제학</option>
						<option value="정치학">정치학</option>
						<option value="법학">법학</option>
						<option value="음악악보">음악악보</option>
						<option value="초급악리">초급악리</option>
						<option value="영화잡지">영화잡지</option>
						<option value="서양예술">서양예술</option>
						<option value="중국어회화">중국어회화</option>
						<option value="HSK기출문제">HSK기출문제</option>
						<option value="영문영법">영문영법</option>
						<option value="단어장">단어장</option>
						<option value="만화">만화</option>
						<option value="영문영법">영문영법</option>
						<option value="문학">문학</option>
						<option value="아시아">아시아</option>
						<option value="유럽">유럽</option>
						<option value="유럽">기타</option>
				</select>
			</td>
		</tr>
		<tr bgcolor="green" align="center">
			<td>가격:<input type="text" name="price" value="${book.price }"/></td>
		</tr>
		<tr bgcolor="yellow" align="center">
			<td>작가:<input type="text" name="author" value="${book.author }"/></td>
		</tr>
<!-- 		<tr bgcolor="green" align="center"> -->
<%-- 			<td>사진:<input type="text" name="pic" value="${book.pic }"/></td> --%>
<!-- 		</tr> -->
		<tr bgcolor="blue" align="center">
			<td>출판사:<input type="text" name="publish" value="${book.publish }"/></td>
		</tr>
		<tr bgcolor="pink" align="center"> 
			<td>
				<input type="submit" value="수정">
				<input type="reset" value="취소">
				<a href="admin.jsp">도서 목록</a>
			</td>
		</tr>
	</table>	
</form>
<script type="text/javascript">
	function jsSelectItemByValue(objSelect, objItemText) { 
	for (var i = 0; i < objSelect.options.length; i++) { 
		if (objSelect.options[i].value == objItemText) { 
			objSelect.options[i].selected = true; 
			break; 
			} 
		}
	}; 
	jsSelectItemByValue(document.forms['userForm'].select, ${book.bookTp1 });
	</script>
</body>
</html>