package org.taobao.service;

import java.util.List;

import org.taobao.pojo.Users;

public interface UserService {
	Users selectOne(Integer id); //��ѯ��������
	void saveOrUpdate(Users u); //���/�޸�
	List<Users> selectUser(String sql); //��֤
}
