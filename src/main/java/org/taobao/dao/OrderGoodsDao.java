package org.taobao.dao;

import org.taobao.pojo.OrderGoods;

public interface OrderGoodsDao extends BaseDao<OrderGoods>{ //������Ʒ���ܽӿ�
	void updateIsDel(String sql); //��������
}
