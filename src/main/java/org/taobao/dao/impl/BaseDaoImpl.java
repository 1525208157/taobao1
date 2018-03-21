package org.taobao.dao.impl;


import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.taobao.dao.BaseDao;

import javassist.convert.Transformer;

//������ʵ����
public class BaseDaoImpl<T> implements BaseDao<T>{
	@Resource
	private SessionFactory sf;
	private Class<T> cls;
	
	public BaseDaoImpl() {
		//��̬��ȡ���͵�class����ʵ��hibernate�����Ĵ���
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
		Session session = sf.getCurrentSession();
		T t = session.get(cls, id);
		return t;
	}

	@Override
	public void saveOrUpdate(T t) {
		Session session = sf.getCurrentSession();
		session.saveOrUpdate(t);
	}

	@Override
	public void delete(Integer id) {
		Session session = sf.getCurrentSession();
		T t = session.get(cls, id);
		session.delete(t);
	}

	/*@Override//Emp.class
	public void f(String sql,Class cls) {
		Session session = sf.getCurrentSession();
		SQLQuery sqlQuery = session.createSQLQuery(sql);
		sqlQuery.setResultTransformer(Transformers.aliasToBean(cls));
		
	}*/

}
