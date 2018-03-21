package org.taobao.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.taobao.dao.FavoritesShopDao;
import org.taobao.pojo.FavoritesShops;
import org.taobao.service.FavoritesShopService;

public class FavoritesShopServiceImpl implements FavoritesShopService{
	@Resource
	private FavoritesShopDao fs;
	
	@Override
	public void insertFavoritesShop(FavoritesShops fShops) {
		fs.saveOrUpdate(fShops);
	}

	@Override
	public void deleteFavoritesShop(Integer id) {
		fs.delete(id);
	}

	@Override
	public List<FavoritesShops> selectFavoritesShops(String sql) {
		List<FavoritesShops> fShops = fs.selectAll(sql);
		return fShops;
	}

}
