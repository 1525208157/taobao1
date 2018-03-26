package org.taobao.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.taobao.pojo.Goods;
import org.taobao.service.GoodsService;

@Controller
public class GoodsController {
@Resource
private GoodsService gs;

@RequestMapping("/queryAll")

public String queryAll(ModelMap map){
	String sql="select * from goods";
	List<Goods> gl=gs.queryAll(sql);
	map.put("gl", gl);
	return "Goods";
}
@RequestMapping("/queryForBrandId")

public String queryForBrandId(Integer brandId){
	String sql="select * from goods where1=1";
	if (brandId!=null&&!brandId.equals("")) {
		sql=sql+" and  brandId ="+brandId;
	}
	List<Goods> gl=gs.queryAll(sql);
	return "Goods";
}
@RequestMapping("/querySaleNum")

public String querySaleNum(){
	String sql="select * from goods  order by saleNum desc;";
	
	List<Goods> gl=gs.queryAll(sql);
	return "Goods";
}
@RequestMapping("/queryForName")

public String query(String goodName){
	String sql="select * from goods where 1=1";
	if (goodName!=null&&!goodName.equals("")) {
		sql=sql+" and goodName like '%"+goodName+"%'"	;
	}
	List<Goods> gl=gs.queryAll(sql);
	return "Goods";

}
}
