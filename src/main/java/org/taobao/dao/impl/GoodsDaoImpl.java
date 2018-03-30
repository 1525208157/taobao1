package org.taobao.dao.impl;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.taobao.dao.GoodsDao;
import org.taobao.pojo.Goods;
@Repository
public class GoodsDaoImpl extends BaseDaoImpl<Goods> implements GoodsDao {

/*	@Resource
	private SessionFactory sf;
	
	@Override//ÃÌº”…Ã∆∑
	public void updateGoods(String hql) {
		Session session = sf.getCurrentSession();
		Query query = session.createQuery(hql);
		query.executeUpdate();
	}
*/
	


}
