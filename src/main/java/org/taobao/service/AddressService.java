package org.taobao.service;

import java.util.List;

import org.taobao.pojo.Address;
import org.taobao.pojo.Users;

public interface AddressService {
	List<Address> selectAddress(String sql);
	void saveOrUpdateAddress(Address address);
	void deleteAddress(Integer id);
	Address selectOneAddress(Integer id);
	
}
