package org.taobao.dao;

import org.taobao.pojo.OrderGoods;

public interface OrderGoodsDao extends BaseDao<OrderGoods>{ //订单商品功能接口
	void updateIsDel(String sql); //批量更新
}
