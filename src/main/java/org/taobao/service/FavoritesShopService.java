package org.taobao.service;

import java.util.List;

import org.taobao.pojo.FavoritesShops;

public interface FavoritesShopService {
	void insertFavoritesShop(FavoritesShops fShops); //添加关注店铺
	
	void deleteFavoritesShop(Integer id); //不再关注店铺
	
	List<FavoritesShops> selectFavoritesShops(String sql); //查看所有关注店铺
}
