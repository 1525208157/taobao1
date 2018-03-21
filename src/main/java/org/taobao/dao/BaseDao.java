package org.taobao.dao;

import java.util.List;

//�����ܽӿ�
public interface BaseDao<T> {
	
	List<T> selectAll(String sql);
	T selectOne(Integer id);
	void saveOrUpdate(T t);
	void delete(Integer id);
	
	
	
}
