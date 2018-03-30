package org.taobao.service.impl;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.taobao.dao.UserDao;
import org.taobao.pojo.Users;
import org.taobao.service.UserService;


@Service
@Transactional
public class UserServiceImpl implements UserService{
	@Resource
	private UserDao ud;
	
	@Override
	public Users selectOne(Integer id) {
		Users user = ud.selectOne(id);
		return user;
	}

	@Override
	public void saveOrUpdate(Users u) {
		ud.saveOrUpdate(u);
	}

	@Override
	public List<Users> selectUser(String sql) {
		List<Users> users = ud.selectAll(sql);
		return users;
	}

}
