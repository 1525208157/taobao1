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
	public List<Shopcarts> getCarts(String sql) {//�Լ���װ���ﳵ���ʵ��  ���ﳵҳ����ʾ�õ�
		Session session=sdf.getCurrentSession();
	    SQLQuery sq=session.createSQLQuery(sql);
	    sq.setResultTransformer(Transformers.aliasToBean(Shopcarts.class));
		List<Shopcarts> list=sq.list();
		return list;
	}

	@Override
	public List<Object> getObject(String sql) {//��������ɾ��ʱͨ�����ﳵ���cartGoodId ����goodId
		//��ԭ��sqlд�� ���Ҫ����������object�Ļ�Ҫô��ԭ����sql,ҪôҪ��hql
		Session session=sdf.getCurrentSession();
	   SQLQuery query=session.createSQLQuery(sql);
		List<Object> list=query.list();
		
		return list;
	}

}
