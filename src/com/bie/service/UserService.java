package com.bie.service;

import java.util.List;

import com.bie.model.User;

public interface UserService {

	/***
	 * 用户查询的信息
	 * @param user
	 * @return
	 */
	public List<User> selectUser(User user);
}
