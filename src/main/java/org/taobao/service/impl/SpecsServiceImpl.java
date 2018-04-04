package org.taobao.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.taobao.dao.SpecsDao;
import org.taobao.pojo.Specs;
import org.taobao.service.SpecsService;
@Transactional
@Service
public class SpecsServiceImpl implements SpecsService{
@Resource
private SpecsDao sd;
	@Override
	public List<Specs> queryAll(String sql) {
		List<Specs> sl=sd.selectAll(sql);
		return sl;
	}
	
	@Override
	public Specs selectSpecs(Integer id) {
		Specs specs = sd.selectOne(id);
		return specs;
	}

}
