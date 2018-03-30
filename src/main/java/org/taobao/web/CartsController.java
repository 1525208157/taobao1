package org.taobao.web;

import java.util.ArrayList;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.apache.catalina.User;
import org.aspectj.weaver.Shadow;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.taobao.pojo.CartGoods;
import org.taobao.pojo.Carts;
import org.taobao.pojo.FavoritesGoods;
import org.taobao.pojo.Goods;
import org.taobao.pojo.Users;
import org.taobao.service.CartsService;
import org.taobao.service.FavoritesGoodService;

import org.taobao.util.Shopcarts;
import org.taobao.util.Sign;


@Controller
@RequestMapping("/carts")
public class CartsController {
	@Resource
	private CartsService ca;
	
	@Resource
	private FavoritesGoodService favgood; 
	
	@RequestMapping("/showCarts")
	public String showCarts(){
		return "mycart";
	}
	
	
	@RequestMapping("/goodAll")
	@ResponseBody
	public List<List<Shopcarts>> getCartsGoods(Integer userId){
		String sql="select s.shopId,s.shopName, ca.cartGoodId,sp.specsId,sp.specsName,gc.gcName,sp.smoney,g.goodsId,g.goodsImg,g.goodsName ,"
					+"ca.cartGoodNum,ca.cgDate from carts c,cartgoods ca, specs  sp,goods g,shops s, goodscolor gc where "
				    +"c.cartId=ca.cartId and ca.specsId=sp.specsId and sp.goodsId=g.goodsId and g.shopId=s.shopId and ca.gcId=gc.gcId "
				    + " and c.userId="+userId+" order by ca.cgDate desc";
		       List<Shopcarts> list=ca.getCarts(sql);
		     
		      List<Integer> list5=new ArrayList<>();
		    for (Shopcarts shopcarts : list) {
				 if(!list5.contains(shopcarts.getShopId())){
					 list5.add(shopcarts.getShopId());
				 }
					
				}
			
		    List<List<Shopcarts>> listAll=new ArrayList<>();
		      
		       for(int i=0;i<list5.size();i++){
		    	   List<Shopcarts> list3=new ArrayList<>();
		    	   for(int j=0;j<list.size();j++){
		    		   Shopcarts catrs=null;
		    		   if(list5.get(i)==list.get(j).getShopId()){
		    			   catrs=new Shopcarts();
		    			   catrs.setShopId(list.get(j).getShopId());//店铺id
		    			   catrs.setShopName(list.get(j).getShopName());//店铺名称
		    			   catrs.setSpecsId(list.get(j).getSpecsId());//手机规格id
		    			   catrs.setGcName(list.get(j).getGcName());//手机颜色
		    			   catrs.setSmoney(list.get(j).getSmoney());//手机单价
		    			   catrs.setGoodsId(list.get(j).getGoodsId());//手机 id
		    			   catrs.setCartGoodNum(list.get(j).getCartGoodNum());//手机数量
		    			   catrs.setCgDate(list.get(j).getCgDate());//购物商品时间
		    			   catrs.setGoodsName(list.get(j).getGoodsName());//手机名称
		    			   catrs.setSpecsName(list.get(j).getSpecsName());//型号名称
		    			   catrs.setCartGoodId(list.get(j).getCartGoodId());//购物商品id
		    			  list3.add(catrs);
		    		   }  
		    	   }
		    	   listAll.add(list3);
		    	   
		       }
		       
		
		 return listAll; 
	}
	
	
	@RequestMapping("/setFavoritesGood")//单次添加关注
	@ResponseBody
	public Sign setFavoritesGood(HttpServletRequest request,Goods good){
	
		
		HttpSession see=request.getSession();
		 Users user=(Users) see.getAttribute("user");
		if(user==null){
			user=new Users();
			user.setUserId(1);
		}
		
	   
	    String sql="select * from favoritesgoods where userId="+user.getUserId()+" and goodsId="+good.getGoodsId();
	   List<FavoritesGoods> fagood1=favgood.selectFavoritesGoods(sql);
	    Sign si=new Sign();
	    if(fagood1.isEmpty()){
	    FavoritesGoods fagood=new FavoritesGoods();
	    fagood.setUsers(user);
	    fagood.setGoods(good);
	    favgood.insertFavoritesGood(fagood);
	    si.setBiaoji("ok");
	    }else{
	    	si.setBiaoji("error");
	    }
		return si;
		
	}
	
	@RequestMapping("/deleteCartGood")
	public String deleteFavoritesGood(Integer cartGoodId){//单个删除
		System.out.println("删除商品");
		 ca.deleteCartGood(cartGoodId);
		 return "mycart";
	}
	
	@RequestMapping("/setFavoritesGoods")//批量添加关注
	@ResponseBody//
	public Sign setFavoritesGoods(HttpServletRequest request,@RequestParam(value="cartGoodIds[]",required=false) List<Integer> idList){//批量添加关注
		System.out.println("添加关注");
		HttpSession see=request.getSession();
	    
		 Users user=(Users) see.getAttribute("user");
		if(user==null){
			user=new Users();
			user.setUserId(1);
		}
		 
		Sign si=new Sign();
		if(idList!=null){//这里在后台判断是不是空了 直接写idList.size()!=0不能这样写，如果是空时idlist就是空， 虽然前台new了一个集合
		List<Integer> li=new ArrayList<>();
		for (int i=0;i<idList.size();i++) {//通过循环购物车id，查找商品id，并将商品id，添加进集合
			System.out.println("选中的id:"+idList.get(i));
			String hql="select go.goodsId from cartgoods ca,specs sp,goods go where ca.specsId=sp.specsId and "
					   +"sp.goodsId=go.goodsId and cartGoodId="+idList.get(i);
			Integer a=(Integer) favgood.getObjet(hql).get(0);
			li.add(a);	
		}
		
		for (Integer integer : li) {//循环数组 把商品添加进关注
	    String sql="select * from favoritesgoods where userId="+user.getUserId()+" and goodsId="+integer;//循环查询关注的商品里有没有该商品
	    List<FavoritesGoods> fagood1=favgood.selectFavoritesGoods(sql);
	   
	    if(fagood1.isEmpty()){
	    FavoritesGoods fagood=new FavoritesGoods();
	    fagood.setUsers(user);
	    Goods good=new Goods();
	    good.setGoodsId(integer);
	    fagood.setGoods(good);
	    favgood.insertFavoritesGood(fagood);
	   
	    }
	
	}
		 si.setBiaoji("ok");
		}else {
			System.out.println("选择的为空");
		si.setBiaoji("checkednull");
	}
		return si;
	}
	
	@RequestMapping("/deleteCartGoods")
	@ResponseBody
	public String deleteFavoritesGoods(@RequestParam(value="cartGoodIds[]",required=false) List<Integer> idList){//批量删除购物车里的上品
		//System.out.println("删除商品");
		//这里直接在前台判断是不是空了
		for (Integer integer : idList) {
			System.out.println("批量删除："+integer);
		}
		for (Integer integer : idList) {
			ca.deleteCartGood(integer);
		}
		 
		 return "{}";
	}
	
	@RequestMapping("/jia_cartGoodNum")
	@ResponseBody
	public Sign jia_cartGoodNum(CartGoods good){//购物车里的数量加的效果
	System.out.println("ddd:"+good.getCartGoodId());
	   CartGoods c=ca.select_CartGoood_one(good.getCartGoodId());
	   c.setCartGoodNum(c.getCartGoodNum()+1);
	    
	    ca.update(c);
	    Sign bn=new Sign();
	    bn.setBiaoji(String.valueOf(c.getCartGoodNum()));
	    return bn;
	
		
	}
	
	@RequestMapping("/jian_cartGoodNum")
	@ResponseBody
	public Sign jian_cartGoodNum(CartGoods good){//购物车里的数量加的效果
	System.out.println("ddd:"+good.getCartGoodId());
	   CartGoods c=ca.select_CartGoood_one(good.getCartGoodId());
	   c.setCartGoodNum(c.getCartGoodNum()-1);
	    
	    ca.update(c);
	    Sign bn=new Sign();
	    bn.setBiaoji(String.valueOf(c.getCartGoodNum()));
	    return bn;
	
		
	}
	
	
	
	}
 