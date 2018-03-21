package org.taobao.dao.impl;

import java.util.List;

import javax.annotation.Resource;

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
	public List<Shopcarts> getCarts(String sql) {
		Session session=sdf.getCurrentSession();
	    SQLQuery sq=session.createSQLQuery(sql);
	    sq.setResultTransformer(Transformers.aliasToBean(Shopcarts.class));
		List<Shopcarts> list=sq.list();
		return list;
	}

}
