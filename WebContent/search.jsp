<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//获取绝对路径路径 ,开发项目一定要使用绝对路径，不然肯定出错
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
				+ request.getServerName() + ":" + request.getServerPort()
				+ path + "/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>alert</title>


<script type="text/javascript">
	alert("비밀번호는：${user.password} 입니다!");
</script>

</head>
<body style="background-color:pink;">
<h1>비밀번호는：${user.password} 입니다</h1>
<a href="javascript: window.history.go(-1)">返回上一级</a>
</body>
</html>