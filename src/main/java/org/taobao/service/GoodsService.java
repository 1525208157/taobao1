package org.taobao.service;

import java.util.List;
import org.taobao.pojo.Brand;
import org.taobao.pojo.Goods;
import org.taobao.pojo.GoodsColor;
import org.taobao.pojo.GoodsIntroduce;
import org.taobao.pojo.Specs;


public interface GoodsService {
    List<Goods> queryAll(String sql);
    

	void saveOrUpdate(Goods g);//添加商品
	
	void addGoodscolor(GoodsColor gc);//添加颜色
	
    void addBrand(Brand bd);//添加品牌
    
    void addMony(Specs ss);//添加价格
    
    void addGoodsIntroduce(GoodsIntroduce gi);//添加商品介绍
}
