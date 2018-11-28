<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.bie.model.Book"%>
<%@page import="com.bie.dao.impl.BookDaoImpl"%>
<%@page import="com.bie.dao.BookDao"%>
<%@page import ="java.io.*" %>
<%@page import="com.oreilly.servlet.*"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 추가 화면 처리</title>
</head>
<body>
<%
	//从页面获取插入的值
	String bookname=request.getParameter("bookname");	
System.out.println("bookname==="+bookname);
	String price=request.getParameter("price");	
	System.out.println("price==="+price);
	String author=request.getParameter("author");	
	System.out.println("author==="+author);
// 	String pic=request.getParameter("pic");	
	String publish=request.getParameter("publish");	
	System.out.println("publish==="+publish);

	//文件上传
	String savePath="uploadFile";
	int uploadFileSizeLimit=5*1024*1024;
	String encType="utf-8";
	
	ServletContext context=getServletContext();
	String uploadFilePath=context.getRealPath(savePath);
// 	System.out.println(uploadFilePath);
	
	File uploadDir = new File(uploadFilePath);
	if (!uploadDir.exists()) {
	    uploadDir.mkdir();
	}
	String fileName=null;
	try {
		MultipartRequest multi=new MultipartRequest
				(request, 
						uploadFilePath, 
						uploadFileSizeLimit, 
						encType, 
						new DefaultFileRenamePolicy());
		fileName=multi.getFilesystemName("pic");
		
		if(fileName==null) {
			out.println("도서 사진을 입력해주세요!");
		}else {
			out.println("성공");
		}
	} catch (Exception e) {
		System.out.println("오류:"+e);
	}
	String pic_path_service="/bookManagerSys/WebContent/uploadFile/"+fileName;
	Book book=new Book();
	//将页面获取的值设置到set方法中
	book.setBookname(bookname);
	book.setAuthor(author);
	int price2=Integer.parseInt(price);
	book.setPrice(price2);
	book.setPic(pic_path_service);
	book.setPublish(publish);
	
	
	BookDao dao=new BookDaoImpl();
	boolean mark=dao.insertBook(book);
	request.setAttribute("book", book);
	if(mark){
		request.setAttribute("show", "도서 추사 성공!");
	}else{
		request.setAttribute("show", "도서 추사 실패!");
	}
	request.getRequestDispatcher("show.jsp").forward(request, response);
%>
</body>
</html>