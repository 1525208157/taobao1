package org.taobao.service;

import java.util.List;

import org.taobao.pojo.Specs;

public interface SpecsService {
	List<Specs> queryAll(String sql);

	Specs selectSpecs(Integer id);

	void saveOrUpdate(Specs specs);

}
