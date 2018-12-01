<%@page import="com.bie.dao.impl.*"%>
<%@page import="com.bie.dao.*"%>
<%@page import="com.bie.model.*"%>
<%@page import="java.util.List"%>
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
	User user2=(User)session.getAttribute("user");
	
	if(user2==null){
		response.sendRedirect("login.jsp");
	}
	User user=new User();
	//获取login.jsp页面提交的账号和密码
	int id=user2.getId();
	System.out.println("id="+id);
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String phone=request.getParameter("phone");
// 	String isAdmin=request.getParameter("isAdmin");
	String isAdmin="0";
	
	//获取register.jsp页面提交的账号和密码设置到实体类User中
	user.setId(id);
	user.setName(name);
	user.setEmail(email);
	user.setPhone(phone);
	user.setIsAdmin(isAdmin);
	
	//引入数据交互层
	UserDao dao=new UserDaoImpl();
	boolean flag=dao.updateUser(user);
	
	if(flag){
		User user3=new User();
		user3.setName(name);
		user3.setPassword(user2.getPassword());
		user3.setIsAdmin(user2.getIsAdmin());
		
		User us=dao.login2(user);
		session.setAttribute("user",us);
		
		out.print("<script>alert('수정 성공!');window.location='main2.jsp'</script>");
// 		response.sendRedirect("login.jsp");
	}else{
		out.print("<script>alert('수정 실패!');window.location='perInfo.jsp'</script>");
// 		response.sendRedirect("register.jsp");
	}
%>
</body>
</html>