package org.taobao.dao;

import org.taobao.pojo.Shops;

//店铺功能接口
public interface ShopsDao extends BaseDao<Shops>{
	Integer selectScore();
}
