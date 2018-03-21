package org.taobao.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.taobao.dao.CartDao;
import org.taobao.service.CartsService;
import org.taobao.util.Shopcarts;

@Service
@Transactional
public class CartsServiceImpl implements CartsService {
	@Resource
	private CartDao car;

	@Override
	public List<Shopcarts> getCarts(String sql) {
		 List<Shopcarts> list=car.getCarts(sql);
		return list;
	}

}
