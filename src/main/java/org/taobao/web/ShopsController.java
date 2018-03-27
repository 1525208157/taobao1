package org.taobao.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.taobao.pojo.Shops;
import org.taobao.service.ShopsService;

@Controller
public class ShopsController {

@Resource
private ShopsService ss;
public List<Shops> queryAll(String shopName){
	String sql="select * from shops where 1=1;";
	if (shopName!=null&&!shopName.equals("")) {
		sql=sql+" and shopName like '%"+shopName+"%'";
	}
	sql=sql+" order by ";
	List<Shops> sl=ss.queryAll(sql);
	return sl;
}

}
