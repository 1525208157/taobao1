package org.taobao.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.taobao.pojo.Shops;
import org.taobao.service.ShopsService;

@Controller
@RequestMapping("/Shops")
public class ShopsController {

@Resource
private ShopsService ss;
@RequestMapping("/queryAll")
public String queryAll(String shopName,ModelMap map){
	String sql="select * from shops where 1=1";
	if (shopName!=null&&!shopName.equals("")) {
		sql=sql+" and shopName like '%"+shopName+"%';";
	}
	List<Shops> sl=ss.queryAll(sql);
	map.put("sl", sl);
	return "Shops";
}

}
