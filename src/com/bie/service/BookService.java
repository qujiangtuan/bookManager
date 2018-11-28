package com.bie.service;

import java.util.List;

import com.bie.model.Book;

public interface BookService {

	/***
	 * 图书信息查询的方法
	 * @return
	 */
	public List<Book> select(Book book);
	
	/***
	 * 根据id进行查询
	 * @param id
	 * @return
	 */
	public Book getBook(Book book);
}
