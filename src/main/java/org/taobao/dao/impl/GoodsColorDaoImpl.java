package org.taobao.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.taobao.dao.GoodColorDao;
import org.taobao.pojo.GoodsColor;

@Repository
@Transactional
public class GoodsColorDaoImpl extends BaseDaoImpl<GoodsColor> implements GoodColorDao {

}
