package org.taobao.service;

import java.util.List;

import org.taobao.pojo.CartGoods;
import org.taobao.pojo.Carts;
import org.taobao.pojo.GoodsColor;
import org.taobao.pojo.Specs;
import org.taobao.util.Shopcarts;

public interface CartsService {
	List<Shopcarts> getCarts(String sql);//多表联查得到购物车对象
	void deleteCartGood(Integer cartGoodId);//删除购物车里的东西
    void update(CartGoods good);//修改购物车里的商品数量
    CartGoods select_CartGoood_one(Integer cardGood);//根据编号查找购物车里商品
    List<GoodsColor> select_goodColor(String sql);//根据商品的id查找商品的颜色
    List<Specs> select_specs(String sql);//根据商品的id查询商品的规格，内存
	List<CartGoods> select_cartgoods(String sql);//根据条件查询购物车的商品，这里主要用于改变购物车的套餐时
	void saveorupdate(CartGoods good);//用于修改购物车里的型号
	List<Carts> selectCarts(String sql); //查询购物车
	void addCart(Carts cart); //新建购物车
	
}
