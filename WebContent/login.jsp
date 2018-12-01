<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//获取绝对路径路径 ,开发项目一定要使用绝对路径，不然肯定出错
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html ">
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 화면</title>
<style type="text/css">
h1 {
	text-align: center;
	margin-bottom: 50px;
}

h4 {
	text-align: left;
	color: red;
}

body {
	background: url(img/login_background.png);
}

a {
	text-decoration: none;
	font-size: 20px;
	color: black;
}

a:hover {
	text-decoration: underline;
	color: red;
}

.form {
	margin-top: 150px;
}
input{
	width: 240px;
	height: 40px;
}
.l {
	background: #00DB00;
	border-radius: 5px;
    width: 240px;
	height: 40px;
	color:white;
	font-size:20px;
	border-color: #00DB00;
}

#name, #password {
	border: solid 2px green;
	border-radius: 5px;
}
input::-webkit-input-placeholder { /* WebKit browsers */ 
color: #93FF93; padding-left:20px;font-size:20px;
} 
input:-moz-placeholder { /* Mozilla Firefox 4 to 18 */ 
color: #93FF93; padding-left:20px;font-size:20px;
} 
input::-moz-placeholder { /* Mozilla Firefox 19+ */ 
color: #93FF93; padding-left:20px;font-size:20px;
} 
input:-ms-input-placeholder { /* Internet Explorer 10+ */ 
color: #93FF93; padding-left:20px;font-size:20px;
} 
</style>

</head>
<body>
	<div class="form">
		<form action="info.jsp" method="post">
			<center>
				<h1>로그인</h1>
				<hr />
				<table>
					<tr>
						<td><input type="text" name="name" id="name" placeholder="id"></td>
					</tr>
					<tr>
						<td><input type="password" name="password" id="password" placeholder="password">
						</td>
					</tr>
					<tr>
						<td><input class="l" type="submit" value="로그인" /></td>
					</tr>
					<tr>
						<td><input class="l" type="button" value="회원가입"
							onclick="window.location.href='register.jsp'" /></td>
					</tr>
				</table>
			</center>
		</form>
	</div>
</body>
</html>