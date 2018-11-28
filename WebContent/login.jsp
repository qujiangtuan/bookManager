<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//获取绝对路径路径 ,开发项目一定要使用绝对路径，不然肯定出错
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
				+ request.getServerName() + ":" + request.getServerPort()
				+ path + "/";
%>
<!DOCTYPE html ">
<html>
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 화면</title>
<style type="text/css">
h1{text-align:center;margin-bottom:50px;}
h4{text-align:left;color:red;}
body{background:url(img/login_background.png);}
a{text-decoration:none;font-size:20px;color:black;}
a:hover{text-decoration:underline;font-size:24px;color:red;}	
.form{margin-top:150px;}
.l,.c{background:green;border-radius:5px;}

</style>

</head>
<body>
<div class="form">
<form action="info.jsp" method="post">
	<center>
	<h1>로그인</h1>
	<hr/>
	<table >
		<tr>
			<td>아이디：</td>
			<td><input type="text" name="name" id="name"></td>
		</tr>
		<tr>
			<td>비밀번호：</td>
			<td><input type="password" name="password" id="password"></td>
			<td><a href="searchPassword.jsp">비밀번호 찾기</a></td>
		</tr>
		<!-- <tr>
			<td>权限：</td>
			<td>
				<select name="isAdmin">
					<option value="1">관리자</option>
					<option value="0">학생</option>
				</select>
			</td>
			
		</tr> -->
		<tr>
			<td colspan="1">
			</td>
			<td>
				<input class="l" type="submit" value="로그인"/>
				<input class="c" type="reset" value="취소"/>
				<a href="register.jsp" target="_blank">회원가입</a>
			</td>
		</tr>
	</table>
	</center>
</form>
</div>
</body>
</html>