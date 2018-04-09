package org.taobao.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.taobao.dao.CartGoodsDao;
import org.taobao.pojo.CartGoods;
import org.taobao.service.CartGoodsService;

@Service
@Transactional
public class CartGoodsServiceImpl implements CartGoodsService{
	@Resource
	private CartGoodsDao cgd;
	
	@Override
	public List<CartGoods> selectCartGoods(String sql) {
		List<CartGoods> cartGoods = cgd.selectAll(sql);
		return cartGoods;
	}

	@Override
	public void updateCartGoods(CartGoods cg) {
		cgd.saveOrUpdate(cg);
	}

}
