package org.taobao.service;

import java.util.List;

import org.taobao.pojo.FavoritesShops;

public interface FavoritesShopService {
	void insertFavoritesShop(FavoritesShops fShops); //��ӹ�ע����
	
	void deleteFavoritesShop(Integer id); //���ٹ�ע����
	
	List<FavoritesShops> selectFavoritesShops(String sql); //�鿴���й�ע����
}
