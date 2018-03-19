package org.taobao.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.taobao.dao.AddressDao;
import org.taobao.pojo.Address;

//收货地址功能实现类
@Repository
public class AddressDaoImpl extends BaseDaoImpl<Address> implements AddressDao{
	@Override
	public List<Address> selectAll(String sql) { //查询所有收货地址
		// TODO Auto-generated method stub
		return super.selectAll(sql);
	}
	
	@Override
	public void saveOrUpdate(Address address) { // 添加/修改 收货地址
		// TODO Auto-generated method stub
		super.saveOrUpdate(address);
	}
	
	@Override
	public void delete(Integer id) { //删除收货地址
		// TODO Auto-generated method stub
		super.delete(id);
	}
	
}
