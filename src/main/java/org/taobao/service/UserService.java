package org.taobao.service;

import java.util.List;

import org.taobao.pojo.Users;

public interface UserService {
	Users selectOne(Integer id); //查询单个对象
	void saveOrUpdate(Users u); //添加/修改
	List<Users> selectUser(String sql); //验证
}
