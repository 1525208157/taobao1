package org.taobao.service;

import java.util.List;

import org.taobao.pojo.Goods;
import org.taobao.pojo.Shops;


public interface GoodsService {
    List<Goods> queryAll(String sql);
    
    Goods selectGoods(Integer id);

	void saveOrUpdate(Goods g);
	
    
}
