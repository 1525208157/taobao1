package org.taobao.service;

import java.util.List;

import org.taobao.pojo.Goods;
import org.taobao.pojo.Orders;
import org.taobao.pojo.Shops;

public interface ShopsService {
	List<Shops> queryAll(String sql);
	void saveOrUpdate(Shops o);//Ìí¼Ó
	Shops selectShop(Integer id);
}
