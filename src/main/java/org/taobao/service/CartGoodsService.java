package org.taobao.service;

import java.util.List;

import org.taobao.pojo.CartGoods;

public interface CartGoodsService {
	List<CartGoods> selectCartGoods(String sql); //��ѯ������Ʒ
	void updateCartGoods(CartGoods cg); //�޸�
	
}
