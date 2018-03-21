package org.taobao.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.taobao.service.CartsService;
import org.taobao.util.Shopcarts;

@Controller
@RequestMapping("/carts")
public class CartsController {
	@Resource
	private CartsService ca;
	
	@RequestMapping("/goodAll")
	public String getCartsGoods(String userId){
		String sql="select  s.shopId,s.shopName,sp.specsId,sp.specsName,gc.gcName,sp.smoney,g.goodsId,g.goodsImg,g.goodsName ,"
					+"ca.cartGoodNum,ca.cgDate from carts c,cartgoods ca, specs  sp,goods g,shops s, goodscolor gc where "
				    +"c.cartId=ca.cartId and ca.specsId=sp.specsId and sp.goodsId=g.goodsId and g.shopId=s.shopId and ca.gcId=gc.gcId "
				    + " and c.userId="+userId;
		List<Shopcarts> list=ca.getCarts(sql);
		 return "emp"; 
	}

}
