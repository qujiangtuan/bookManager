<%@page import="com.bie.dao.BookDao"%>
<%@page import="com.bie.dao.impl.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bie.model.Book" %>
<%@ page import="com.bie.service.BookService" %>
<%@ page import="com.bie.service.impl.BookServiceImpl" %>
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
<title>도서상세정보</title>
</head>
<body>
<%
	Book book=new Book();
	String sid=request.getParameter("bookid");
	String useridStr=request.getParameter("userid");
	System.out.println("bookid="+sid+";userid="+useridStr);
	Integer id=Integer.parseInt(sid);
	Integer userid=Integer.parseInt(useridStr);
	book.setBookid(id);
	book.setUserId(userid);
	BookDao dao=new BookDaoImpl();
	boolean mark=dao.deleteCollectBook(id,userid);
	if(mark){
		request.setAttribute("show", "관심 취소되었습니다!");
	}else{
		request.setAttribute("show", "관심 취소 실패");
	}
	request.getRequestDispatcher("showCollectDelete.jsp").forward(request, response);

%>
</body>
</html>