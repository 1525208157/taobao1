package org.taobao.service;

import java.util.List;

import org.taobao.pojo.CartGoods;
import org.taobao.util.Shopcarts;

public interface CartsService {
	List<Shopcarts> getCarts(String sql);//多表联查得到购物车对象
	void deleteCartGood(Integer cartGoodId);//删除购物车里的东西
    void update(CartGoods good);//修改购物车里的商品数量
    CartGoods select_CartGoood_one(Integer cardGood);//根据编号查找
}
