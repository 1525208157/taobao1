package org.taobao.web;

import java.util.List;

import javax.annotation.Resource;

import org.apache.tomcat.jni.Mmap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.taobao.pojo.Address;
import org.taobao.pojo.FavoritesGoods;
import org.taobao.pojo.Brand;
import org.taobao.pojo.Goods;
import org.taobao.pojo.Shops;

import org.taobao.pojo.Specs;
import org.taobao.service.BrandService;
import org.taobao.service.GoodsService;
import org.taobao.service.ShopsService;
import org.taobao.service.SpecsService;

@Controller

@RequestMapping("/Goods")

public class GoodsController {
@Resource
private GoodsService gs;
@Resource
private BrandService bs;
@Resource
private SpecsService ss;
@Resource
private ShopsService sh;

@RequestMapping("/queryAll")
public String queryAll(ModelMap map,String goodsName){
	String sql="select * from goods where 1=1";
	if (goodsName!=null&&!goodsName.equals("")) {
		sql=sql+" and goodsName like '%"+goodsName+"%'";
	}
	List<Goods> gl=gs.queryAll(sql);
	map.put("gl", gl);
	String hql="select * from brand";
	List<Brand> bl=bs.queryAll(hql);
	map.put("bl", bl);
	return "Goods";
}
@RequestMapping("/queryForBrandId")

public String queryForBrandId(Integer brandId,ModelMap map){
	String sql="select * from goods where 1=1";
	if (brandId!=null&&!brandId.equals("")) {
		sql=sql+" and  brandId ="+brandId;
	}
	List<Goods> gl=gs.queryAll(sql);
	map.put("gl", gl);
	String hql="select * from brand";
	List<Brand> bl=bs.queryAll(hql);
	map.put("bl", bl);
	return "Goods";
}
@RequestMapping("/querySaleNum")

public String querySaleNum(ModelMap map){
	String sql="select * from goods  order by saleNum desc;";
	List<Goods> gl=gs.queryAll(sql);
	map.put("gl", gl);
	String hql="select * from brand";
	List<Brand> bl=bs.queryAll(hql);
	map.put("bl", bl);
	return "Goods";
}
@RequestMapping("/index")
@ResponseBody
public List<Goods> index(){
	String sql="select * from goods  order by saleNum desc;";
	List<Goods> gl=gs.queryAll(sql);
	return gl;
}
@RequestMapping("/queryAsc")
public List<Goods> queryAsc(ModelMap map){
	String sql="select g.* from goods g,specs s where s.goodsId=g.goodsId order by s.smoney asc;";	
	List<Goods> gl=gs.queryAll(sql);	
	map.put("gl", gl);
	String hql="select * from brand";
	List<Brand> bl=bs.queryAll(hql);
	map.put("bl", bl);
	return gl;
}
@RequestMapping("/queryDesc")

public String queryDesc(ModelMap map){
	String sql="select g.* from goods g,specs s where s.goodsId=g.goodsId order by s.smoney desc;";	
	List<Goods> gl=gs.queryAll(sql);
	map.put("gl", gl);
	String hql="select * from brand";
	List<Brand> bl=bs.queryAll(hql);
	map.put("bl", bl);
	return "Goods";
}


@RequestMapping("/abc")
@ResponseBody
public List<Goods> queryAll(){
	String sql="select * from goods";
	List<Goods> goods=gs.queryAll(sql);
	return goods;
}

@RequestMapping("/insertGoods")
public String insertFavoritesGood(Shops ss) { //ÃÌº”…Ã∆∑
	gs.saveOrUpdate(ss);
	return "redirect:/tianjia.jsp";
}

}
