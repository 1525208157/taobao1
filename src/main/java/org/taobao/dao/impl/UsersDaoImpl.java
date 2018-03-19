package org.taobao.dao.impl;

import org.springframework.stereotype.Repository;
import org.taobao.dao.UsersDao;
import org.taobao.pojo.Users;

//用户功能实现类
@Repository
public class UsersDaoImpl extends BaseDaoImpl<Users> implements UsersDao{
	@Override
	public Users selectOne(Integer id) {
		// TODO Auto-generated method stub
		return super.selectOne(id);
	}
	
	@Override
	public void saveOrUpdate(Users u) {
		// TODO Auto-generated method stub
		super.saveOrUpdate(u);
	}
	
}
