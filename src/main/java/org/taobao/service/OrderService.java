package org.taobao.service;

import java.util.List;

import org.taobao.pojo.OrderGoods;
import org.taobao.pojo.Orders;


public interface OrderService { 
	List<Orders> selectOrders(String sql);
	List<OrderGoods> selectOrderGoods(String sql);
	void saveOrUpdate(Orders o); //Ìí¼Ó/ÐÞ¸Ä
	
}
