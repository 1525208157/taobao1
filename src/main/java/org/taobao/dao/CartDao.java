package org.taobao.dao;

import java.util.List;
import java.util.Map;

import org.taobao.pojo.Carts;
import org.taobao.util.Shopcarts;

//���ﳵ���ܽӿ�
public interface CartDao extends BaseDao<Shopcarts> {
	List<Shopcarts> getCarts(String sql);//�õ����ﳵ���Լ���װ�Ķ���
	List<Object> getObject(String sql);//�Լ���װ��object����
	

}
