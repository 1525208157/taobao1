package org.taobao.service;

import java.util.List;

import org.taobao.pojo.CartGoods;
import org.taobao.util.Shopcarts;

public interface CartsService {
	List<Shopcarts> getCarts(String sql);//�������õ����ﳵ����
	void deleteCartGood(Integer cartGoodId);//ɾ�����ﳵ��Ķ���
    void update(CartGoods good);//�޸Ĺ��ﳵ�����Ʒ����
    CartGoods select_CartGoood_one(Integer cardGood);//���ݱ�Ų���
}
