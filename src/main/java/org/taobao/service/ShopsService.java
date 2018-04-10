package org.taobao.service;

import java.util.List;

import org.taobao.pojo.Goods;
import org.taobao.pojo.Orders;
import org.taobao.pojo.Shops;

public interface ShopsService {
	List<Shops> queryAll(String sql);

	void addShops(Shops o);//添加
	Shops selectShop(Integer id);

	List<Shops> selectShops(String sql);//查询有没有店铺
}
