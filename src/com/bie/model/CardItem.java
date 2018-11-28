package com.bie.model;

/**
 * 购物车的实体类
 */
public class CardItem {

	private Book book;//书本的实体类
	private int number;//数量

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

}
