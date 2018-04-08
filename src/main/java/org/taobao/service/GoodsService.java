package org.taobao.service;

import java.util.List;
import org.taobao.pojo.Brand;
import org.taobao.pojo.Goods;
import org.taobao.pojo.GoodsColor;
import org.taobao.pojo.GoodsIntroduce;
import org.taobao.pojo.Specs;


public interface GoodsService {
    List<Goods> queryAll(String sql);
    

	void saveOrUpdate(Goods g);//�����Ʒ
	
	void addGoodscolor(GoodsColor gc);//�����ɫ
	
    void addBrand(Brand bd);//���Ʒ��
    
    void addMony(Specs ss);//��Ӽ۸�
    
    void addGoodsIntroduce(GoodsIntroduce gi);//�����Ʒ����
}
