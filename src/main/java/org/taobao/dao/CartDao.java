package org.taobao.dao;

import java.util.List;

import org.taobao.pojo.Carts;
import org.taobao.util.Shopcarts;

//购物车功能接口
public interface CartDao extends BaseDao<Shopcarts> {
	List<Shopcarts> getCarts(String sql);
	List<Object> getObject(String sql);

}
