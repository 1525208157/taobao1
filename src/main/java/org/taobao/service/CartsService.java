package org.taobao.service;

import java.util.List;

import org.taobao.util.Shopcarts;

public interface CartsService {
	List<Shopcarts> getCarts(String sql);

}
