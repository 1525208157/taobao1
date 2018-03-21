package org.taobao.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.taobao.pojo.Goods;
import org.taobao.service.GoodsService;

@Controller
public class GoodsController {
@Resource
private GoodsService gs;
@RequestMapping("/queryAll")
@ResponseBody
public String queryAll(){
	String sql="select * from goods";
	List<Goods> gl=gs.queryAll(sql);
	return "Goods";
}
@RequestMapping("/queryForBrandId")
@ResponseBody
public String queryForBrandId(Integer brandId){
	String sql="select * from goods where1=1";
	if (brandId!=null&&!brandId.equals("")) {
		sql=sql+" and  brandId ="+brandId;
	}
	List<Goods> gl=gs.queryAll(sql);
	return "Goods";
}
@RequestMapping("/querySaleNum")
@ResponseBody
public String querySaleNum(){
	String sql="select * from goods order by saleNum desc;";
	
	List<Goods> gl=gs.queryAll(sql);
	return "Goods";
}
@RequestMapping("/query")
@ResponseBody
public String query(){
	String sql="select * from goods order by saleNum desc;";
	
	List<Goods> gl=gs.queryAll(sql);
	return "Goods";
}
}
