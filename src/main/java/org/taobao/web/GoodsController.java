package org.taobao.web;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;
import org.apache.tomcat.jni.Mmap;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.taobao.pojo.Address;
import org.taobao.pojo.Appraises;
import org.taobao.pojo.FavoritesGoods;
import org.taobao.pojo.Brand;
import org.taobao.pojo.Goods;
import org.taobao.pojo.GoodsColor;
import org.taobao.pojo.GoodsIntroduce;
import org.taobao.pojo.Orders;
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
@RequestMapping("/queryForName")

public String queryForName(String goodName ,ModelMap map){
	String sql="select * from goods where 1=1";
	if (goodName!=null&&!goodName.equals("")) {
		sql=sql+" and goodName like '%"+goodName+"%'"	;
	}
	List<Goods> gl=gs.queryAll(sql);
	map.put("gl", gl);
	String hql="select * from brand";
	List<Brand> bl=bs.queryAll(hql);
	map.put("bl", bl);
	return "Goods";
}
@RequestMapping("/queryAsc")

public String queryAsc(ModelMap map){
	String sql="select g.* from goods g,specs s where s.goodsId=g.goodsId order by s.smoney asc;";	
	List<Goods> gl=gs.queryAll(sql);
	map.put("gl", gl);
	String hql="select * from brand";
	List<Brand> bl=bs.queryAll(hql);
	map.put("bl", bl);
	return "Goods";
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

@RequestMapping("/addGoods")//添加商品
public String insertFavoritesGood(Brand brand,Goods goods, GoodsIntroduce goodsIntroduce,Specs specs,GoodsColor goodsColor) { 

	goods.setGoodsIntroduce(goodsIntroduce);
	brand.getGoods().add(goods);//级联添加品牌
	goods.getSpecs().add(specs);//级联添加
	goods.getGoodsColor().add(goodsColor);//级联添加
	
	Date now = new Date();//添加系统时间
	DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String now1=df.format(now);
	goods.setSaleTime(now1);
	
	
	gs.saveOrUpdate(goods);
	gs.addBrand(brand);
	gs.addMony(specs);
	gs.addGoodsIntroduce(goodsIntroduce);
	gs.addGoodscolor(goodsColor);
	return "redirect:/Sellers.jsp";
}

}
