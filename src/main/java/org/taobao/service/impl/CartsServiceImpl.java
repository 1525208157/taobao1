package org.taobao.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.taobao.dao.CartDao;
import org.taobao.dao.CartGood;
import org.taobao.pojo.CartGoods;
import org.taobao.service.CartsService;
import org.taobao.util.Shopcarts;

@Service
@Transactional
public class CartsServiceImpl implements CartsService {
	@Resource
	private CartDao car;
	
	@Resource
	private CartGood cragood;
	

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

}
