package org.taobao.service;

import org.taobao.pojo.Users;

public interface UserService {
	Users selectOne(Integer id); //��ѯ��������
	void saveOrUpdate(Users u); //���/�޸�
}
