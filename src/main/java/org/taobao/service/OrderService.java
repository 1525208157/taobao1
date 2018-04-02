package org.taobao.service;

import java.util.List;

import org.taobao.pojo.OrderGoods;
import org.taobao.pojo.Orders;


public interface OrderService { 
	List<Orders> selectOrders(String sql); //查询所有订单
	void saveOrUpdate(Orders o); //添加/修改
	Orders selectOrder(Integer id); //根据Id查询对象
}
