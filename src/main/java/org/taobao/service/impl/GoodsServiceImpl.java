package org.taobao.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.taobao.dao.BrandDao;
import org.taobao.dao.GoodColorDao;
import org.taobao.dao.GoodsDao;
import org.taobao.dao.GoodsIntroduceDao;
import org.taobao.dao.SpecsDao;
import org.taobao.pojo.Brand;
import org.taobao.pojo.Goods;
import org.taobao.pojo.GoodsColor;
import org.taobao.pojo.GoodsIntroduce;
import org.taobao.pojo.Specs;
import org.taobao.service.GoodsService;
@Service
@Transactional
public class GoodsServiceImpl implements GoodsService {
@Resource
private GoodsDao gd;

@Resource
private GoodColorDao gc;

@Resource
private BrandDao bd;

@Resource
private SpecsDao ss;

@Resource
private GoodsIntroduceDao gi;
	@Override
	public List<Goods> queryAll(String sql) {
	List<Goods> gl=gd.selectAll(sql);
		return gl;
	}
	
	@Override
	public void saveOrUpdate(Goods goods) {
		gd.saveOrUpdate(goods);
	}

	@Override//添加颜色
	public void addGoodscolor(GoodsColor goodsColor) {
		gc.saveOrUpdate(goodsColor);
		
	}

	@Override//添加手机品牌
	public void addBrand(Brand brand) {
		bd.saveOrUpdate(brand);

	}

	@Override
	public Goods selectGoods(Integer id) {
		Goods goods = gd.selectOne(id);
		return goods;
	}
	
	@Override//添加手机价格
	public void addMony(Specs specs) {
		ss.saveOrUpdate(specs);;
	}

	@Override//添加商品介绍
	public void addGoodsIntroduce(GoodsIntroduce goodsIntroduce) {
		gi.saveOrUpdate(goodsIntroduce);
	}
	
}
