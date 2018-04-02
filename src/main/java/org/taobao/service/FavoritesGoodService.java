package org.taobao.service;

import java.util.List;

import org.taobao.pojo.FavoritesGoods;

public interface FavoritesGoodService {
	void insertFavoritesGood(FavoritesGoods fGoods); //添加关注商品
	
	void deleteFavoritesGood(Integer id); //删除关注
	
	List<FavoritesGoods> selectFavoritesGoods(String sql); //查询所有关注商品
	List<Object> getObjet(String sql);
	
}
