package org.taobao.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.taobao.dao.AddressDao;
import org.taobao.pojo.Address;

//�ջ���ַ����ʵ����
@Repository
public class AddressDaoImpl extends BaseDaoImpl<Address> implements AddressDao{
	@Override
	public List<Address> selectAll(String sql) { //��ѯ�����ջ���ַ
		// TODO Auto-generated method stub
		return super.selectAll(sql);
	}
	
	@Override
	public void saveOrUpdate(Address address) { // ���/�޸� �ջ���ַ
		// TODO Auto-generated method stub
		super.saveOrUpdate(address);
	}
	
	@Override
	public void delete(Integer id) { //ɾ���ջ���ַ
		// TODO Auto-generated method stub
		super.delete(id);
	}
	
}
