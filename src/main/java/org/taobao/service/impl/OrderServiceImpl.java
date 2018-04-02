package org.taobao.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.tomcat.jni.OS;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.taobao.dao.OrderDao;
import org.taobao.pojo.OrderGoods;
import org.taobao.pojo.Orders;
import org.taobao.service.OrderService;

@Service
@Transactional
public class OrderServiceImpl implements OrderService{
	@Resource
	private OrderDao od;
	
	@Override
	public List<Orders> selectOrders(String sql) {
		List<Orders> orders = od.selectAll(sql);
		return orders;
	}

	@Override
	public void saveOrUpdate(Orders o) {
		od.saveOrUpdate(o);
	}

	@Override
	public Orders selectOrder(Integer id) {
		Orders order = od.selectOne(id);
		return order;
	}

}
