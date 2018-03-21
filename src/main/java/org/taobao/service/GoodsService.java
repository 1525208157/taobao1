package org.taobao.service;

import java.util.List;

import org.taobao.pojo.Goods;

public interface GoodsService {
    List<Goods> queryAll(String sql);
    
}
