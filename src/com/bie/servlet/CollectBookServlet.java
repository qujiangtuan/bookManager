package com.bie.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bie.dao.BookDao;
import com.bie.dao.impl.BookDaoImpl;
import com.bie.model.Book;
import com.bie.model.User;

@WebServlet("/CollectBookServlet")
public class CollectBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int HashMap = 0;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		User user=(User)request.getSession().getAttribute("user");
		if(user==null){
			response.sendRedirect("login.jsp");
		}
		
		Book book=new Book();
		book=(Book)request.getSession().getAttribute("collectbook");
		book.setUserId(user.getId());
		BookDao dao=new BookDaoImpl();
		boolean mark=dao.collectBook(book);
//		request.setAttribute("book", book);
		if(mark){
			request.setAttribute("show2", "관심 추가 성공!");
		}else{
			request.setAttribute("show2", "관심 추사 실패!");
		}
		request.getRequestDispatcher("show2.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
