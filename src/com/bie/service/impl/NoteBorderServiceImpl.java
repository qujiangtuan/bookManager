package com.bie.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.bie.dao.NoteBorderDao;
import com.bie.dao.impl.NoteBorderDaoImpl;
import com.bie.model.NoteBorder;

public class NoteBorderServiceImpl {
	private NoteBorderDao dao=new NoteBorderDaoImpl();
	

//	public List<NoteBorder> selectBorder(NoteBorder note) {
//		//sql语句
//		//String sql="select * from user ";
//		StringBuilder sql=new StringBuilder("select * from note_border where 1=1 ");
//		List<Object> list=new ArrayList<Object>();
//		if(note!=null){
//			//按照姓名查询
//			if(note.getName()!=null && !note.getName().equals("")){
//				sql.append(" and name = ? ");
//				list.add(note.getName());
//			}
//		}
//		return dao.selectBorder(sql.toString(), list.toArray());
//	}
}
