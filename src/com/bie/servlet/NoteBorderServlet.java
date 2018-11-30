package com.bie.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bie.dao.NoteBorderDao;
import com.bie.dao.impl.NoteBorderDaoImpl;
import com.bie.model.NoteBorder;
import com.bie.utils.DateUtil;

/**
 * Servlet implementation class NoteBorderervlet
 */
@WebServlet("/NoteBorderServlet")
public class NoteBorderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
//		String name = request.getParameter("name");
		String name = (String)request.getSession().getAttribute("name");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		NoteBorder note=new NoteBorder();
		note.setName(name);
		note.setTitle(title);
		note.setContent(content);
		note.setDate(DateUtil.getTodayDateTime());
		NoteBorderDao notDao=new NoteBorderDaoImpl();
		
		request.setAttribute("note", note);
		if(notDao.addNoteBorder(note)){
			System.out.println("댓글 성공");
			request.getRequestDispatcher("noteboard.jsp").forward(request, response);
		}else{
			System.out.println("댓글 실패");
		}
	}

}
