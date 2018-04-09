package org.taobao.service;

import java.util.List;

import org.taobao.pojo.CartGoods;

public interface CartGoodsService {
	List<CartGoods> selectCartGoods(String sql); //查询订单商品
	void updateCartGoods(CartGoods cg); //修改
	
}
