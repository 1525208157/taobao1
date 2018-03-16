package org.taobao.dao.impl;


import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.taobao.dao.BaseDao;

public class BaseDaoImpl<T> implements BaseDao<T>{
	
	@Resource
	private SessionFactory sf;
	private Class<T> cls;
	
	public BaseDaoImpl() {
		//动态获取泛型的class对象实现hibernate参数的传入
		Type type = getClass().getGenericSuperclass();
		cls = (Class<T>) ((ParameterizedType) type).getActualTypeArguments()[0];
	}

	@Override
	public List<T> selectAll(String sql) {
		Session session = sf.getCurrentSession();
		SQLQuery query = session.createSQLQuery(sql);
		query.addEntity(cls);
		return query.list();
	}

	@Override
	public T selectOne(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveOrUpdate(T t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Integer id) {
		// TODO Auto-generated method stub
		
	}

}
