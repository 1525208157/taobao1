package org.taobao.dao;

import org.taobao.pojo.OrderGoods;

public interface OrderGoodsDao extends BaseDao<OrderGoods>{
	void updateIsDel(String sql); //批量更新
}
