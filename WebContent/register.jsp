<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//获取绝对路径路径 ,开发项目一定要使用绝对路径，不然肯定出错
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
				+ request.getServerName() + ":" + request.getServerPort()
				+ path + "/";
%> 
<!DOCTYPE html >
<html>
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<style type="text/css">
h1{text-align:center;}
h4{text-align:right;color:red;}
body{background:url(images/2.png)}
.c{background:#00DB00;border-radius:5px;}
input,.but{width:300px;height:40px;border:1px;border-radius:5px;font-size:24px;color:#6F00D2;}
.but{background-color:#00DB00;}
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

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//alert("测试jQuery是否能用");
		$("#form1").submit(function(){
			var name=$("#name").val();//获取提交的值
			if(name.length==0){//进行判断，如果获取的值为0那么提示账号不能为空
				//alert("aa");//测试使用
				$("#nameError").html("아이디를 입력해주세요!");
				return false;
			}
			//密码进行验证不能为空
			var password=$("#password").val();//获取提交的密码的值
			if(password.length==0){
				$("#passwordError").html("비밀번호를 입력해주세요!");
				return false;
			}
			
			//确认密码进行验证
			var relpassword=$("#relpassword").val();//获取提交的确认密码的值
			if(relpassword.length==0){
				$("#relpasswordError").html("비밀번호를 입력해주세요!");
				return false;
			}
			
			if(password!=relpassword){
				$("#relpasswordError").html("두번 입력한 비밀번호는 다릅니다,다시 입력해주세요!");
				return false;
			}
		});
	
	});
</script>
</head>
<body>
<form action="doregister.jsp" method="post" id="form1">
	<h1>회원가입</h1>
	<h4>ㅎㅎ</h4>	
	<hr/>
	<table align="center">
		<tr>
<!-- 			<td>아&nbsp;&nbsp;이&nbsp;&nbsp;&nbsp;디：</td> -->
			<td>
				<input type="text" name="name" id="name" placeholder="id"/>
				<div id="nameError" style="display:inline;color:red;"></div>
			</td>
		</tr>
		<tr>
<!-- 			<td>비&nbsp;&nbsp;밀&nbsp;&nbsp;번&nbsp;&nbsp;호：</td> -->
			<td>
				<input type="password" name="password" id="password " placeholder="password">
				<div id="passwordError" style="display:inline;color:red;"></div>
			</td>
		</tr>
		<tr>
<!-- 			<td>비밀번호 확인：</td> -->
			<td>
				<input type="password" name="relpassword" id="relpassword" placeholder="password">
				<div id="relpasswordError" style="display:inline;color:red;"></div>
			</td>
		</tr>
		<tr>
<!-- 			<td>전화번호：</td> -->
			<td><input type="text" name="phone" id="phone" placeholder="phone"></td>
		</tr>
		<tr>
<!-- 			<td>이메일：</td> -->
			<td><input type="text" name="email" id="email" placeholder="email"></td>
		</tr>
		<tr>
			<td>
				<input class="c" type="submit" value="회원가입"/>
			</td>
		</tr>
		<tr>
			<td>
				<button type="button" onclick="window.location.href='login.jsp'" class="but">로그인</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>