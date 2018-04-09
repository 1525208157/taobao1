package org.taobao.service;

import java.util.List;

import org.taobao.pojo.CartGoods;
import org.taobao.pojo.Carts;
import org.taobao.pojo.GoodsColor;
import org.taobao.pojo.Specs;
import org.taobao.util.Shopcarts;

public interface CartsService {
	List<Shopcarts> getCarts(String sql);//�������õ����ﳵ����
	void deleteCartGood(Integer cartGoodId);//ɾ�����ﳵ��Ķ���
    void update(CartGoods good);//�޸Ĺ��ﳵ�����Ʒ����
    CartGoods select_CartGoood_one(Integer cardGood);//���ݱ�Ų��ҹ��ﳵ����Ʒ
    List<GoodsColor> select_goodColor(String sql);//������Ʒ��id������Ʒ����ɫ
    List<Specs> select_specs(String sql);//������Ʒ��id��ѯ��Ʒ�Ĺ���ڴ�
	List<CartGoods> select_cartgoods(String sql);//����������ѯ���ﳵ����Ʒ��������Ҫ���ڸı乺�ﳵ���ײ�ʱ
	void saveorupdate(CartGoods good);//�����޸Ĺ��ﳵ����ͺ�
	List<Carts> selectCarts(String sql); //��ѯ���ﳵ
	void addCart(Carts cart); //�½����ﳵ
	
}
