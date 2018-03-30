package org.taobao.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.taobao.dao.BrandDao;
import org.taobao.pojo.Brand;
import org.taobao.service.BrandService;

@Service
@Transactional
public class BrandServiceImpl implements BrandService{
@Resource
private BrandDao bd;
	@Override
	public List<Brand> queryAll(String sql) {
	List<Brand> bl=bd.selectAll(sql);
		return bl;
	}

}
