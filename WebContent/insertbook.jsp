<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	//获取绝对路径路径 ,开发项目一定要使用绝对路径，不然肯定出错
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
				+ request.getServerName() + ":" + request.getServerPort()
				+ path + "/";
    //获取Tomcat的绝对路径
    String realPath = request.getSession().
            getServletContext().getRealPath("/");
//     out.println(realPath);
%>
<!DOCTYPE html ">
<html>
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	body{background-color:#BBFFBB;}
	.select{
		width:160px;
	}
</style>
<title>도서 추가화면</title>
</head>
<body>
<marquee><h1>도서 추가화면</h1></marquee>
<!-- <form action="InsertBookServlet" method="post" enctype="multipart/form-data"> -->
<form action="InsertBookServlet" method="post"  enctype="multipart/form-data" >
	<table align="center" cellpadding="10" cellspacing="10" width="600px">
		<tr bgcolor="pink" align="center">
			<td>도서명</td>
			<td><input type="text" name="bookname"/></td>
		</tr>
		<tr bgcolor="green" align="center">
			<td>종류</td>
			<td>
				<select class="select" name="select">
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
			<td>가격</td>
			<td><input type="text" name="price"/></td>
		</tr>
		<tr bgcolor="yellow" align="center">
			<td>작가</td>
			<td><input type="text" name="author"/></td>
		</tr>
		<tr bgcolor="green" align="center">
			<td>사진</td>
			<td><input type="file" name="pic"/></td>
		</tr>
		<tr bgcolor="blue" align="center">
			<td>출판사</td>
			<td><input type="text" name="publish"/></td>
		</tr>
		<tr bgcolor="#00BB00" align="center"> 
			<td colspan="2" >
				<input type="submit" value="추가">
				<input type="reset" value="취소">
				<a href="admin.jsp">도서 목록</a>
			</td>
		</tr>
	</table>	
</form>
</body>
</html>