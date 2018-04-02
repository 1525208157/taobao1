package org.taobao.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.taobao.dao.GoodsDao;
import org.taobao.pojo.Goods;
import org.taobao.pojo.Shops;
import org.taobao.service.GoodsService;
@Service
@Transactional
public class GoodsServiceImpl implements GoodsService{
@Resource
private GoodsDao gd;
	@Override
	public List<Goods> queryAll(String sql) {
	List<Goods> gl=gd.selectAll(sql);
		return gl;
	}
	@Override
	public void saveOrUpdate(Shops ss) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void saveOrUpdate(Goods g) {
		// TODO Auto-generated method stub
		
	}
	
	
}
