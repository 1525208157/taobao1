package org.taobao.dao.impl;

import java.util.List;

import org.taobao.dao.ShopsDao;
import org.taobao.pojo.Shops;

public class ShopsDaoImpl extends BaseDaoImpl<Shops> implements ShopsDao{
@Override
public List<Shops> selectAll(String sql) {
	return super.selectAll(sql);
}
}
