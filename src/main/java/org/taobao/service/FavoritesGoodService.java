package org.taobao.service;

import java.util.List;

import org.taobao.pojo.FavoritesGoods;

public interface FavoritesGoodService {
	void insertFavoritesGood(FavoritesGoods fGoods); //��ӹ�ע��Ʒ
	
	void deleteFavoritesGood(Integer id); //ɾ����ע
	
	List<FavoritesGoods> selectFavoritesGoods(String sql); //��ѯ���й�ע��Ʒ
	List<Object> getObjet(String sql);
	
}
