package org.taobao.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.taobao.dao.ShopsDao;
import org.taobao.pojo.Goods;
import org.taobao.pojo.Shops;
import org.taobao.pojo.Users;
import org.taobao.service.ShopsService;
@Service
@Transactional
public class ShopsServiceImpl implements ShopsService{
@Resource
private ShopsDao sd;
	@Override
	public List<Shops> queryAll(String sql) {
		List<Shops> sl = sd.selectAll(sql);
		return sl;
	}

	@Override
	public Shops selectShop(Integer id) {
		Shops shop = sd.selectOne(id);
		return shop;
	}

	@Override//ÃÌº”µÍ∆Ã√˚≥∆
	public void addShops(Shops o) {
		sd.saveOrUpdate(o);
		
	}

	@Override
	public List<Shops> selectShops(String sql) {
		List<Shops> shops = sd.selectAll(sql);
		return shops;
	}

	

	
	

}
