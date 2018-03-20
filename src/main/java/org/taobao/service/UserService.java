package org.taobao.service;

import org.taobao.pojo.Users;

public interface UserService {
	Users selectOne(Integer id); //查询单个对象
	void saveOrUpdate(Users u); //添加/修改
}
