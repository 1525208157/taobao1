package org.taobao.service;

import java.util.List;

import org.taobao.pojo.OrderGoods;
import org.taobao.pojo.Orders;


public interface OrderService { 
	List<Orders> selectOrders(String sql); //��ѯ���ж���
	void saveOrUpdate(Orders o); //���/�޸�
	Orders selectOrder(Integer id); //����Id��ѯ����
}
