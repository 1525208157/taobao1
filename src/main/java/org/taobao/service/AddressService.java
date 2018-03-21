package org.taobao.service;

import java.util.List;

import org.taobao.pojo.Address;
import org.taobao.pojo.Users;

public interface AddressService {
	List<Address> selectAll(String sql);
	void saveOrUpdate(Address address);
	void deleteAddress(Integer id);
	
}
