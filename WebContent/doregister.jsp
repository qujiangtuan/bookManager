<%@page import="com.bie.dao.impl.UserDaoImpl"%>
<%@page import="com.bie.dao.UserDao"%>
<%@page import="com.bie.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>处理注册的页面</title>
</head>
<body>
<%
	User user=new User();
	//获取login.jsp页面提交的账号和密码
	String name=request.getParameter("name");
	String password=request.getParameter("password");
	String email=request.getParameter("email");
	String phone=request.getParameter("phone");
// 	String isAdmin=request.getParameter("isAdmin");
	String isAdmin="0";
	
	//获取register.jsp页面提交的账号和密码设置到实体类User中
	user.setName(name);
	user.setPassword(password);
	user.setEmail(email);
	user.setPhone(phone);
	user.setIsAdmin(isAdmin);
	
	//引入数据交互层
	UserDao dao=new UserDaoImpl();
	boolean flag=dao.register(user);
	
	if(flag){
		out.print("<script>alert('회원가입 성공!');window.location='login.jsp'</script>");
// 		response.sendRedirect("login.jsp");
	}else{
		out.print("<script>alert('회원가입 실패!');window.location='register.jsp'</script>");
// 		response.sendRedirect("register.jsp");
	}
%>
</body>
</html>