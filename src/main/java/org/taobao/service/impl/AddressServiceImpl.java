package org.taobao.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.taobao.dao.AddressDao;
import org.taobao.pojo.Address;
import org.taobao.service.AddressService;

@Service
@Transactional
public class AddressServiceImpl implements AddressService{
	@Resource
	private AddressDao ad;
	
	@Override
	public List<Address> selectAddress(String sql) {
		List<Address> address = ad.selectAll(sql);
		return address;
	}

	@Override
	public void saveOrUpdateAddress(Address address) {
		ad.saveOrUpdate(address);
	}

	@Override
	public void deleteAddress(Integer id) {
		ad.delete(id);
	}

	@Override
	public Address selectOneAddress(Integer id) {
		Address address = ad.selectOne(id);
		return address;
	}
	
}
