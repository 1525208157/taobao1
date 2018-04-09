package org.taobao.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.taobao.dao.AppraisesDao;
import org.taobao.pojo.Appraises;
import org.taobao.service.AppraisesService;

@Service
@Transactional
public class AppraisesServiceImpl implements AppraisesService {
	@Resource
	private AppraisesDao ad;
	
	@Override
	public void saveOrUpdateAddress(Appraises appraises) {
		ad.saveOrUpdate(appraises);
	}

}
