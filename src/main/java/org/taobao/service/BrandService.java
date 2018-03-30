package org.taobao.service;

import java.util.List;

import org.taobao.pojo.Brand;
import org.taobao.pojo.Goods;

public interface BrandService {
List<Brand> queryAll(String sql);
}
