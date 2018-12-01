package com.bie.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bie.dao.BookDao;
import com.bie.model.Book;
import com.bie.utils.BaseDao;
import com.bie.utils.StringUtil;

public class BookDaoImpl implements BookDao{

	@Override
	public List<Book> select(String sql, Object[] arr) {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			con=BaseDao.getCon();//第一步连接数据库
			ps=con.prepareStatement(sql);//第二步：预编译
			if(arr!=null){
				for(int i=0;i<arr.length;i++){
					ps.setObject(i+1, arr[i]);
				}
			}
			//第四步执行sql
			rs=ps.executeQuery();
			List<Book> list=new ArrayList<Book>();
			while(rs.next()){
				Book book=new Book();
				book.setBookid(rs.getInt("bookid"));
				book.setBookTp1(rs.getString("type"));
				book.setBookname(rs.getString("bookname"));
				book.setPrice(rs.getInt("price"));
				book.setAuthor(rs.getString("author"));
				book.setPic(rs.getString("pic"));
				book.setPublish(rs.getString("publish"));
				
				list.add(book);
			}
			return list;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			//关闭资源，避免出现异常
			BaseDao.close(con, ps, rs);
		}
		
		return null;
	}

	@Override
	public Book getBook(Integer id) {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			con=BaseDao.getCon();//第一步连接数据库
			String sql="select * from book where bookid = ? ";
			ps=con.prepareStatement(sql);//第二步：预编译
			ps.setInt(1, id);
			
			//第四步执行sql
			rs=ps.executeQuery();
			while(rs.next()){
				Book books=new Book();
				books.setBookid(rs.getInt("bookid"));
				books.setBookname(rs.getString("bookname"));
				books.setBookTp1(rs.getString("type"));
				books.setPrice(rs.getInt("price"));
				books.setAuthor(rs.getString("author"));
				books.setPic(rs.getString("pic"));
				books.setPublish(rs.getString("publish"));
				
				return books;
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			//关闭资源，避免出现异常
			BaseDao.close(con, ps, rs);
		}
		
		return null;
	}

	@Override
	public List<Book> bookPage(int page, int record) {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			con=BaseDao.getCon();//第一步连接数据库
			//第二步书写sql语句
//			String sql="select * from book limit ?,? ";
			String sql="select *  " + 
					"from ( select rownum r,a.*  " + 
					"from book a  " + 
					"where rownum<=? )  " + 
					"where r>=?";
			ps=con.prepareStatement(sql);//第三步：预编译
			//第几页需要设置好是页数减一乘以每页的记录数即是第多少页
//			ps.setInt(1, (page-1)*record);
//			ps.setInt(2, record);
			ps.setInt(1, record);
			ps.setInt(2, (page-1)*record);
			
			
			//第四步执行sql
			rs=ps.executeQuery();
			List<Book> list=new ArrayList<Book>();
			while(rs.next()){
				Book book=new Book();
				book.setBookid(rs.getInt("bookid"));
				book.setBookname(rs.getString("bookname"));
				book.setBookTp1(rs.getString("type"));
				book.setPrice(rs.getInt("price"));
				book.setAuthor(rs.getString("author"));
				book.setPic(rs.getString("pic"));
				book.setPublish(rs.getString("publish"));
				
				list.add(book);
			}
//			System.out.println("list="+list);
			return list;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//关闭资源，避免出现异常
			BaseDao.close(con, ps, rs);
		}
		
		return null;
	}

	@Override
	public int getCount(int record) {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		//设置初始值为-1
		int n=-1;
		try {
			con=BaseDao.getCon();//第一步连接数据库
			//第二步书写sql语句
			String sql="select count(*) from book ";
			ps=con.prepareStatement(sql);//第三步：预编译
			
			//第四步执行sql
			rs=ps.executeQuery();
			if(rs.next()){
				//获取第一条记录，因为查询count(1)就一条记录，获取即可,即总记录数
				n=rs.getInt(1);
				//将总记录数除以每页的总记录数然乎向上取整即可
				n=(int)Math.ceil(1.0*n/record);
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//关闭资源，避免出现异常
			BaseDao.close(con, ps, rs);
		}
		
		return n;
	}

	@Override
	public boolean insertBook(Book book) {
		String sql="insert into book values(book_SEQ.nextval,?,?,?,?,?,?)";
		List<Object> list=new ArrayList<Object>();
		list.add(book.getBookname());
		list.add(book.getPrice());
		list.add(book.getAuthor());
		list.add(book.getPic());
		list.add(book.getPublish());
		list.add(book.getBookTp1());
		
		boolean mark=BaseDao.addUpdateDelete(sql, list.toArray());
		if(mark){
			return true;
		}else{
			return false;
		}
		
	}
	
	@Override
	public boolean collectBook(Book book) {
		String sql="insert into cbook values(?,?,?,?,?,?,?,?)";
		List<Object> list=new ArrayList<Object>();
		list.add(book.getBookid());
		list.add(book.getBookname());
		list.add(book.getPrice());
		list.add(book.getAuthor());
		list.add(book.getPic());
		list.add(book.getPublish());
		list.add(book.getBookTp1());
		list.add(book.getUserId());
		
		boolean mark=BaseDao.addUpdateDelete(sql, list.toArray());
		if(mark){
			return true;
		}else{
			return false;
		}
		
	}

	@Override
	public boolean updateBook(Book book) {
		String sql="update book SET bookname=?,type=?,price=?,author=?,publish=? where bookid=? ";
		if(book!=null && book.getBookid()!=null){
			List<Object> list=new ArrayList<Object>();
			list.add(book.getBookname());
			list.add(book.getBookTp1());
			list.add(book.getPrice());
			list.add(book.getAuthor());
			list.add(book.getPublish());
			
			list.add(book.getBookid());
			boolean mark=BaseDao.addUpdateDelete(sql, list.toArray());
			if(mark){
				return true;
			}else{
				return false;
			}
		}
		return false;
	}
	

	@Override
	public boolean deleteBook(Integer id) {
		String sql="delete from book where bookid=? ";
		List<Object> list=new ArrayList<Object>();
		list.add(id);
		boolean mark=BaseDao.addUpdateDelete(sql, list.toArray());
		if(mark){
			return true;
		}else{
			return false;
		}
	}
	
	@Override
	public boolean deleteCollectBook(Integer id,Integer userid) {
		System.out.println("id="+id+",userid="+userid);
		String sql="delete from cbook where bookid="+id+" and userid="+userid;
		Connection con = null;
        try {
        	con = BaseDao.getCon();
                  PreparedStatement prst=con.prepareStatement(sql);
//                  prst.setInt(1,id);
//                  prst.setInt(2,userid);
                  if(prst.executeUpdate()>0){
                            return true;
                  }
        } catch (SQLException e) {    
                  e.printStackTrace();
        }catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
        return false;
	}
	
	public List<Book> getBookList(Book book) {
		Connection con = null;
		List<Book> retList = new ArrayList<Book>();
		StringBuffer sqlString=new StringBuffer("select * from book ");
		if(!StringUtil.isEmpty(book.getBookname())){
            sqlString.append(" and bookname like '%"+book.getBookname()+"%'");
		}
		if(!StringUtil.isEmpty(book.getAuthor())){
            sqlString.append(" and author like '%"+book.getAuthor()+"%'");
		}
		if(!StringUtil.isEmpty(book.getBookTp1())){
            sqlString.append(" and type like '%"+book.getBookTp1()+"%'");
		}
		if(!StringUtil.isEmpty(book.getPublish())){
            sqlString.append(" and publish like '%"+book.getPublish()+"%'");
		}
		try {
			con = BaseDao.getCon();
			 PreparedStatement prst=con.prepareStatement(sqlString.toString().replaceFirst("and", "where"));
			ResultSet rs = prst.executeQuery();
			while (rs.next()) {
				Book b=new Book();
				b.setBookid(rs.getInt("bookid"));
				b.setBookname(rs.getString("bookname"));
				b.setBookTp1(rs.getString("type"));
				b.setPrice(rs.getInt("price"));
				b.setAuthor(rs.getString("author"));
				b.setPic(rs.getString("pic"));
				b.setPublish(rs.getString("publish"));
				retList.add(b);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return retList;
	}
	public List<Book> getCollectBookList(Book book) {
		Connection con = null;
		List<Book> retList = new ArrayList<Book>();
		String sqlString="select * from cbook where userid='"+book.getUserId()+"'";
		try {
			con = BaseDao.getCon();
			 PreparedStatement prst=con.prepareStatement(sqlString);
			ResultSet rs = prst.executeQuery();
			while (rs.next()) {
				Book b=new Book();
				b.setBookid(rs.getInt("bookid"));
				b.setBookname(rs.getString("bookname"));
				b.setBookTp1(rs.getString("type"));
				b.setPrice(rs.getInt("price"));
				b.setAuthor(rs.getString("author"));
				b.setPic(rs.getString("pic"));
				b.setPublish(rs.getString("publish"));
				b.setUserId(rs.getInt("userid"));
				retList.add(b);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return retList;
	}
	
}
