package org.taobao.service;

import java.util.List;


import org.taobao.pojo.OrderGoods;

public interface OrderGoodsService {
	
	/*void updateIsDel(String hql); //����ɾ��������Ʒ
*/	List<OrderGoods> queryAll(String sql); //��ѯ����������Ʒ
	
}
