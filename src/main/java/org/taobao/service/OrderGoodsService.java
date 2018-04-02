package org.taobao.service;

import java.util.List;


import org.taobao.pojo.OrderGoods;

public interface OrderGoodsService {
	
	/*void updateIsDel(String hql); //批量删除订单商品
*/	List<OrderGoods> queryAll(String sql); //查询已卖出的商品
	
}
