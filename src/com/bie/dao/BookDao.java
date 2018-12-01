package com.bie.dao;

import java.util.List;

import com.bie.model.Book;

public interface BookDao {
	
	/***
	 * 图书信息查询的方法
	 */
	public List<Book> select(String sql,Object[] arr);
	
	/***
	 * 获取图书的编号进行查询
	 */
	public Book getBook(Integer id);
	
	/***
	 * 分页查询的方法
	 * @param page 第几页
	 * @param record 一页有多少记录
	 * @return
	 */
	public List<Book> bookPage(int page,int record);
	
	/***
	 * 获取总页数
	 * @param record
	 * @return
	 */
	public int getCount(int record);
	
	/***
	 * 添加图书
	 * @param book
	 * @return
	 */
	public boolean insertBook(Book book);
	
	/***
	 * 修改图书的方法
	 * @param book
	 * @return
	 */
	public boolean updateBook(Book book);
	
	/***
	 * 删除图书的方法
	 * @param id
	 * @return
	 */
	public boolean deleteBook(Integer id);
	
	public List<Book> getBookList(Book book);

	public boolean collectBook(Book book);
	public List<Book> getCollectBookList(Book book);

	boolean deleteCollectBook(Integer id, Integer userid);
}
