package org.taobao.dao.impl;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.taobao.dao.OrderGoodsDao;
import org.taobao.pojo.OrderGoods;

//订单商品功能实现类
@Repository
public class OrderGoodsDaoImpl extends BaseDaoImpl<OrderGoods> implements OrderGoodsDao{
	@Resource
	private SessionFactory sf;
	
	@Override
	public void updateIsDel(String hql) {
		Session session = sf.getCurrentSession();
		Query query = session.createQuery(hql);
		query.executeUpdate();
	}

}
