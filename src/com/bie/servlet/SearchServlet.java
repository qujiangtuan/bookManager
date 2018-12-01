package com.bie.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bie.dao.BookDao;
import com.bie.dao.impl.BookDaoImpl;
import com.bie.model.Book;

/**
 * Servlet implementation class SearchServlte
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
//		String type2 =null;
//		type2 = request.getParameter("type");
//		System.out.println("type2="+type2);
//		
		
		String search_input=null;
		String select="도서명";
		String bookName=null,author=null,type=null,publish=null;
		try {
			search_input = request.getParameter("search_input");
			select=request.getParameter("select");
		} catch (Exception e) {
			search_input=null;
			select="도서명";
		}
//			System.out.println(search_input+select);
			Book book=new Book();
			if("도서명".equals(select)) {
				bookName=search_input;
			}else if("종류".equals(select)){
				type=search_input;
			}else if("작가".equals(select)){
				author=search_input;
			}else if("출판사".equals(select)){
				publish=search_input;
			}
		book.setBookname(bookName);
		book.setBookTp1(type);
		book.setAuthor(author);
		book.setPublish(publish);
		
//		BookDao bookDao=new BookDaoImpl();
//		List<Book> bookList = bookDao.getBookList(book);
//		request.getSession().setAttribute("bookList", bookList);
		
		request.getSession().setAttribute("searchBook", book);
		
		request.getRequestDispatcher("main.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
