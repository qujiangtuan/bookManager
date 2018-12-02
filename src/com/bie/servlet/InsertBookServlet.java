package com.bie.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bie.dao.BookDao;
import com.bie.dao.impl.BookDaoImpl;
import com.bie.model.Book;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/InsertBookServlet")
public class InsertBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int HashMap = 0;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		  //获取Tomcat的绝对路径
//	    String realPath = request.getSession().
//	    getServletContext().getRealPath("/");
		
		
		String bookname=null,type=null,price=null,author=null,publish=null;
		Map<String ,String> map=null;
		String fileName=null;

		String realFolder="";
		//업로드용 폴더 이름
		String savePath="/uploadFile";
		int uploadFileSizeLimit=5*1024*1024;//5MByte
		String encType="utf-8";
		//ServletContext는 정보를 저장하기 위한 전역 공간
		//ServletContext context=getServletContext();
		//서블잇상의 upload폴더 경로를 알아온다
		//realFolder=context.getRealPath(savePath);
		
		realFolder="H:\\Program Files\\eclipse\\eclipse-2018-09-workspace\\bookManagerSys\\WebContent\\uploadFile";
		File f=new File("H://Program Files/eclipse/eclipse-2018-09-workspace/bookManagerSys/WebContent/uploadFile");
		if (!f.exists()) {
		    f.mkdir();
		}
		
		//콘솔 /브라우저에 실제 경로를 출력
//		System.out.println("서버상의 실제 디렉토리 : ");
//		System.out.println(realFolder);
//		
		//파일을 받아와서 폴더에 업로드 하면 된다
		MultipartRequest multi=null;
		try{
			 multi=new MultipartRequest
					(request, realFolder,uploadFileSizeLimit, encType, 
							new DefaultFileRenamePolicy());
			 fileName=multi.getFilesystemName("pic");
			 
//			 if(fileName==null) {
////					System.out.println("fileName==null");
////					
//				}else {
//					System.out.println("<br>file경로:"+fileName);
//			}
			Enumeration en=multi.getParameterNames();
			map=new HashMap<String ,String>();
			while(en.hasMoreElements()){
				String name=(String)en.nextElement();
				String value=multi.getParameter(name);
				map.put(name, value);
			}
			System.out.println(map);
			for(Map.Entry<String,String> enty:map.entrySet()) {
				if("bookname".equals(enty.getKey())) {bookname=enty.getValue();}
				else if("select".equals(enty.getKey())) {type=enty.getValue();}
				else if("price".equals(enty.getKey())) {price=enty.getValue();}
				else if("author".equals(enty.getKey())) {author=enty.getValue();}
				else if("publish".equals(enty.getKey())) {publish=enty.getValue();}
			}
//				System.out.println("bookname==="+bookname);
//				System.out.println("price==="+price);
//				System.out.println("author==="+author);
//				System.out.println("publish==="+publish);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("예외 발생:"+e);
		}
		String realFolder2=realFolder.replaceAll("\\\\", "//");
		String pic_path_service=savePath+"/"+fileName;
		Book book=new Book();
		//将页面获取的值设置到set方法中
		book.setBookname(bookname);
		book.setBookTp1(type);
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
	}
	
}
