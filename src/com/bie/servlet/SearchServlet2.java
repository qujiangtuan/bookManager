package com.bie.servlet;

import java.io.IOException;
import java.util.List;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bie.dao.BookDao;
import com.bie.dao.impl.BookDaoImpl;
import com.bie.model.Book;
import com.bie.utils.StringUtil;

/**
 * Servlet implementation class SearchServlte
 */
@WebServlet("/SearchServlet2")
public class SearchServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String type2 =null;
		type2 = request.getParameter("type");
		String type=ResourceBundle.getBundle("type").getString(type2);
//		System.out.println("type2="+type);
//		
		
		String bookType=null;
			Book book=new Book();
			if(StringUtil.isEmpty(type)) {
				bookType=type;
			}
		book.setBookTp1(type);
		
		BookDao bookDao=new BookDaoImpl();
		List<Book> bookList = bookDao.getBookList(book);
		request.getSession().setAttribute("searchBook", book);
		
		request.getRequestDispatcher("main.jsp").forward(request, response);
	}

}
