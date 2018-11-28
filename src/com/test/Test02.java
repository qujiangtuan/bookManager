package com.test;

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
 * Servlet implementation class Test02
 */
@WebServlet("/Test02")
public class Test02 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String realPath = request.getSession().
			    getServletContext().getRealPath("/").replaceAll("\\\\", "//");
			
				Book book=new Book();
				BookDao dao=new BookDaoImpl();
				List<Book> list=dao.select("select * from book",null);
				System.out.println(list);
	}

}
