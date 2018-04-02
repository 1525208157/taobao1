package org.taobao.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.taobao.dao.CartDao;
import org.taobao.dao.CartGood;
import org.taobao.dao.CartGoodsDao;
import org.taobao.dao.GoodColorDao;
import org.taobao.dao.SpecsDao;
import org.taobao.pojo.CartGoods;
import org.taobao.pojo.GoodsColor;
import org.taobao.pojo.Specs;
import org.taobao.service.CartsService;
import org.taobao.util.Shopcarts;

@Service
@Transactional
public class CartsServiceImpl implements CartsService {
	@Resource
	private CartDao car;
	
	@Resource
	private CartGood cragood;
	
	@Resource
	private GoodColorDao goodcolor;
	
	@Resource
	private SpecsDao spdao;
	
	@Resource
    private CartGoodsDao cs;
	@Override
	public List<Shopcarts> getCarts(String sql) {
		 List<Shopcarts> list=car.getCarts(sql);
		return list;
	}

	@Override
	public void deleteCartGood(Integer cartGoodId) {
		cragood.delete(cartGoodId);
		
		
	}

	@Override
	public void update(CartGoods good) {
		cragood.saveOrUpdate(good);
		
	}

	@Override
	public CartGoods select_CartGoood_one(Integer cardGood) {
		CartGoods car=cragood.selectOne(cardGood);
		return car;
	}

	@Override
	public List<GoodsColor> select_goodColor(String sql) {
		List<GoodsColor> cc=goodcolor.selectAll(sql);
		return cc;
	}

	@Override
	public List<Specs> select_specs(String sql) {
		List<Specs> list=spdao.selectAll(sql);
		return list;
	}

	@Override
	public List<CartGoods> select_cartgoods(String sql) {//用查询一语句里面查询cartgoods
		List<CartGoods> cc=cs.selectAll(sql);
		return cc;
	}

	@Override
	public void saveorupdate(CartGoods good) {
		cs.saveOrUpdate(good);
		
	}


}
