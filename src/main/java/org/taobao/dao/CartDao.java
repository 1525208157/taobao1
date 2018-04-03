package org.taobao.dao;

import java.util.List;
import java.util.Map;

import org.taobao.pojo.Carts;
import org.taobao.util.Shopcarts;

//购物车功能接口
public interface CartDao extends BaseDao<Shopcarts> {
	List<Shopcarts> getCarts(String sql);//得到购物车的自己封装的对象
	List<Object> getObject(String sql);//自己封装的object对象
	

}
