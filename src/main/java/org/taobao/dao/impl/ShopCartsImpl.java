package org.taobao.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;
import org.taobao.dao.CartDao;
import org.taobao.util.Shopcarts;

@Repository
public class ShopCartsImpl extends BaseDaoImpl<Shopcarts> implements CartDao {
	@Resource
	private SessionFactory sdf;

	@Override
	public List<Shopcarts> getCarts(String sql) {//自己封装购物车里的实体  购物车页面显示用的
		Session session=sdf.getCurrentSession();
	    SQLQuery sq=session.createSQLQuery(sql);
	    sq.setResultTransformer(Transformers.aliasToBean(Shopcarts.class));
		List<Shopcarts> list=sq.list();
		return list;
	}

	@Override
	public List<Object> getObject(String sql) {//用于批量删除时通过购物车里的cartGoodId 查找goodId
		//用原生sql写的 如果要用求的最后是object的话要么用原生的sql,要么要用hql
		Session session=sdf.getCurrentSession();
	   SQLQuery query=session.createSQLQuery(sql);
		List<Object> list=query.list();
		
		return list;
	}

}
