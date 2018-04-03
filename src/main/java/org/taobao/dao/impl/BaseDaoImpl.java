package org.taobao.dao.impl;


import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import javax.annotation.Resource;
import javax.persistence.JoinColumn;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.taobao.dao.BaseDao;
import org.taobao.util.Shopcarts;

import javassist.convert.Transformer;

//主功能实现类
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
		/*1.两个表或多个表查出来个多字段，这时要从新建一个单独的实体这个实体于表没有映射关系，这时就不能这样写了要sq.setResultTransformer(Transformers.aliasToBean(Shopcarts.class));
		2.如果两个表中 一个dept，一个是emp，在dept里写的是单向的一对多关系，并加了@JoinColumn(name="userId")，这时不会
		在多一张表，而是在dept表中有个userId但在实体里没有，这时用查询语句查询dept表（userId只是当条件），把这个表其它的外键全部写上时（除了userId其它的要全部写上，不然要报错），也可以直接用上面的方法来查找实体*/
		
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
