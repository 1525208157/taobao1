package org.taobao.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.taobao.dao.OrderGoodsDao;
import org.taobao.service.OrderGoodsService;

@Service
@Transactional
public class OrderGoodsServiceImpl implements OrderGoodsService{
	@Resource
	private OrderGoodsDao og;

	@Override
	public void updateIsDel(String hql) {
		og.updateIsDel(hql);
	}
	
}
