<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.bie.model.*"%>
<%@ page import="com.bie.dao.UserDao" %>
<%@ page import="com.bie.dao.impl.UserDaoImpl" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>login successful or failful</title>
<style type="text/css">
h1{text-align:center;}
h4{text-align:right;color:red;}
body{background:url(images/2.png)}
a{text-align:center;text-decoration:none;color:blue;}
a:hover{text-decoration:underline;font-size:18px;}

</style>
</head>
<body>
<h4>ㅎㅎ</h4>
<hr/>
<h1>도서 List</h1>
<%
//引入数据交互层
	User user=new User();
	UserDao dao=new UserDaoImpl();
	String name=request.getParameter("name");
	String password=request.getParameter("password");
	
	String isAdmin=request.getParameter("isAdmin");
	
	
	user.setName(name);
	user.setPassword(password);
	user.setIsAdmin(isAdmin);
	
	User us=dao.login(user);
	
	
	
	session.setAttribute("user",user);
	if(us != null){
		//如果是管理员跳转到管理员页面
		if(user.getIsAdmin().equals("1")){
			//out.println(us.getIsAdmin());
			response.sendRedirect("admin.jsp");
		}else if(user.getIsAdmin().equals("0")){
			
			//如果是普通会员，跳转到图书列表的页面
			response.sendRedirect("book.jsp");
		}
		
	}else{
		//response.sendRedirect("login.jsp");
		
		out.println("로그인 실패되었습니다!");
	}
%>


</body>
</html>