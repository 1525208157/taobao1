package org.taobao.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.taobao.dao.CartDao;
import org.taobao.dao.FavoritesGoodDao;
import org.taobao.pojo.FavoritesGoods;
import org.taobao.service.FavoritesGoodService;
@Service
@Transactional
public class FavoritesGoodServiceImpl implements FavoritesGoodService{
	@Resource
	private FavoritesGoodDao fd;
	@Resource
	private CartDao ca;
	
	@Override
	public void insertFavoritesGood(FavoritesGoods fGoods) {
		fd.saveOrUpdate(fGoods);
	}

	@Override
	public void deleteFavoritesGood(Integer id) {
		fd.delete(id);
	}

	@Override
	public List<FavoritesGoods> selectFavoritesGoods(String sql) {
		List<FavoritesGoods> fGoods = fd.selectAll(sql);
		return fGoods;
	}

	@Override
	public List<Object> getObjet(String sql) {//²éÑ¯Ò»¸öobject×Ö¶Î
		List<Object> list=ca.getObject(sql);
		return list;
	}

}
