package com.bie.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bie.dao.NoteBorderDao;
import com.bie.model.NoteBorder;
import com.bie.utils.BaseDao;

public class NoteBorderDaoImpl implements NoteBorderDao{
	/*
	 * (non-Javadoc)
	 * 
	 * @see com.bie.dao.impl.NoteBorderDao#addNoteBorder(com.bie.model.NoteBorder)
	 */
	/* (non-Javadoc)
	 * @see com.bie.dao.impl.NoteBorderDao#addNoteBorder(com.bie.model.NoteBorder)
	 */
	@Override
	public boolean addNoteBorder(NoteBorder note) {
		Connection con = null;
		String sql = "insert into note_border(id,name,title,content,login_date) values(note_seq.nextval,?,?,?,?)";
		try {
			con = BaseDao.getCon();
			PreparedStatement prst = con.prepareStatement(sql);
			prst.setString(1, note.getName());
			prst.setString(2, note.getTitle());
			prst.setString(3, note.getContent());
			prst.setString(4, note.getDate());
			if (prst.executeUpdate() > 0)
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return false;
	}

	/* (non-Javadoc)
	 * @see com.bie.dao.impl.NoteBorderDao#getNoteBorderList(com.bie.model.NoteBorder)
	 */
	@Override
	public List<NoteBorder> getNoteBorderList(NoteBorder note) {
		Connection con = null;
		List<NoteBorder> retList = new ArrayList<NoteBorder>();
		String sqlString = ("select * from note_border order by login_date desc");
		try {
			con = BaseDao.getCon();
			PreparedStatement prst = con.prepareStatement(sqlString);
			ResultSet r = prst.executeQuery();
			while (r.next()) {
				NoteBorder n = new NoteBorder();
				n.setId(r.getInt("id"));
				n.setName(r.getString("name"));
				n.setTitle(r.getString("title"));
				n.setContent(r.getString("content"));
				n.setDate(r.getString("login_date"));
				retList.add(n);
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
