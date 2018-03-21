package org.taobao.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.taobao.dao.FavoritesGoodDao;
import org.taobao.pojo.FavoritesGoods;
import org.taobao.service.FavoritesGoodService;

public class FavoritesGoodServiceImpl implements FavoritesGoodService{
	@Resource
	private FavoritesGoodDao fd;
	
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

}
