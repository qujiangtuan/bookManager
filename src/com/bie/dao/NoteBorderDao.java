package com.bie.dao;

import java.util.List;

import com.bie.model.NoteBorder;

public interface NoteBorderDao {

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.bie.dao.impl.NoteBorderDao#addNoteBorder(com.bie.model.NoteBorder)
	 */
	boolean addNoteBorder(NoteBorder note);

	List<NoteBorder> getNoteBorderList(NoteBorder note);

}