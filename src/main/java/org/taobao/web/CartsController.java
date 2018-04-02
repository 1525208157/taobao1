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
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.taobao.pojo.Address;
import org.taobao.pojo.CartGoods;
import org.taobao.pojo.Carts;
import org.taobao.pojo.FavoritesGoods;
import org.taobao.pojo.Goods;
import org.taobao.pojo.GoodsColor;
import org.taobao.pojo.Specs;
import org.taobao.pojo.Users;
import org.taobao.service.AddressService;
import org.taobao.service.CartsService;
import org.taobao.service.FavoritesGoodService;
import org.taobao.util.CartHelp;
import org.taobao.util.Shopcarts;
import org.taobao.util.Sign;


@Controller
@RequestMapping("/carts")
public class CartsController {
	@Resource
	private CartsService ca;
	
	@Resource
	private FavoritesGoodService favgood; 
	
	@Resource
	private AddressService address;
	
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
		    
		      List<Integer> list5=new ArrayList<>();//新建一个放店铺id的集合
		    for (Shopcarts shopcarts : list) {//循环把店铺id放入list5集合中
				 if(!list5.contains(shopcarts.getShopId())){//当list5没有这个id时才允许add进去
					 list5.add(shopcarts.getShopId());
				 }
					
				}
			
		   
		    List<List<Shopcarts>> listAll=new ArrayList<>();//新建一个双层数组
		      
		       for(int i=0;i<list5.size();i++){
		    	   List<Shopcarts> list3=new ArrayList<>();//外层循环创建店铺的集合
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
		    			  list3.add(catrs);//将商品放入该店铺里
		    		   }  
		    	   }
		    	   listAll.add(list3);//每次的外层循环把店铺集合放入双层集合中
		    	   
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
	   List<FavoritesGoods> fagood1=favgood.selectFavoritesGoods(sql);//前台传过来的商品id 查询关注商品数据库里的有没有这个对象
	    Sign si=new Sign();
	    if(fagood1.isEmpty()){//查出来的如果为空的话就可以添加关注了
	    FavoritesGoods fagood=new FavoritesGoods();
	    fagood.setUsers(user);
	    fagood.setGoods(good);
	    favgood.insertFavoritesGood(fagood);
	    si.setBiaoji("ok");
	    }else{
	    	si.setBiaoji("error");
	    }
		return
				
			si;
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
	
	@RequestMapping("/slectBycartgoodId_to_color_to_specs")
	@ResponseBody
	public  CartHelp select_cartGood_type(Integer cartgoodId){//修改购物车里的手机型号之前的查询操作，要返回一个自己封装的对象
		String sql="select go.goodsId from cartgoods ca,specs sp,goods go where ca.specsId=sp.specsId and "
				   +"sp.goodsId=go.goodsId and cartGoodId="+cartgoodId;
		Integer a=(Integer) favgood.getObjet(sql).get(0);
	   
		String sql1="select * from goodscolor where goodsId="+a;
	    List<GoodsColor> list=ca.select_goodColor(sql1);//查询该手机的颜色对象
	   
	    String sql2="select * from specs where goodsId="+a;
	    List<Specs> list1=ca.select_specs(sql2);//查询手机的内存对象
	    CartGoods cgds=ca.select_CartGoood_one(cartgoodId);//查询购物车的商品id
	    
	   
	    CartHelp cc=new CartHelp();//封装自己写的对象返回到前台
	    cc.setCartGoods(cgds);
	    cc.setColorlist(list);
	    cc.setSpecelist(list1);
	    
	    return cc;
		
	}
	
	@RequestMapping("/update_cartgoods")
	@ResponseBody
	 public String update_cartgoods(HttpServletRequest request,CartGoods good){//修改购物车里的商品型号
		   
			HttpSession see=request.getSession();
			 Users user=(Users) see.getAttribute("user");
			if(user==null){
				user=new Users();
				user.setUserId(1);
			}
			
			String sql="select ca.* from carts c ,cartgoods ca where c.cartId=ca.cartId and c.userId='"
					+ user.getUserId()+"' and ca.specsId='"
					+good.getSpecs().getSpecsId()+"' and ca.gcId='"
					+good.getgColor().getGcId()+"'";
			
			List<CartGoods> cag=ca.select_cartgoods(sql);
			//根据前台传过来的手机型号及颜色，查询否有该对象，
			
			CartGoods bb=ca.select_CartGoood_one(good.getCartGoodId());//根据id查询数据库里的购物车商品
			
			
			//这里的判断是，如果根据前台传过来的手机型号及颜色，查询有一个对象，并且该对象的id不等于从数据库查询的原始购物车商品id时，这时只需把原来的
			//删掉就行了，因为购物车里一个用户不可能一个商品同一个型号的手机有两件，反之修改原来的购物车里的手机即可
			if(!cag.isEmpty()&&cag.get(0).getCartGoodId()!=good.getCartGoodId()){
			   ca.deleteCartGood(good.getCartGoodId());
			}else {
			 Specs s=new Specs();
			 GoodsColor g=new GoodsColor();
			 s.setSpecsId(good.getSpecs().getSpecsId());
			 g.setGcId(good.getgColor().getGcId());
			 
			 bb.setgColor(g);
			 bb.setSpecs(s);//利用hibernate的持久化的特点这里就不用再save了 本来这用这个但这里是在web层，不能用持久化
			ca.saveorupdate(bb);
			}
			return "{}";
		   
	 }
	
	@RequestMapping("/mycart_jieshuan")//如果这里不是ajax传数组参时，是url传数组参时这里要加[]
	public String maycart_jieshuan(@RequestParam(value="cartGoodIds[]",required=false) List<Integer> idList,ModelMap model,HttpServletRequest request){
		HttpSession see=request.getSession();
		 Users user=(Users) see.getAttribute("user");
		if(user==null){
			user=new Users();
			user.setUserId(1);
		}
		
		String sql="select s.shopId,s.shopName, ca.cartGoodId,sp.specsId,sp.specsName,gc.gcName,sp.smoney,g.goodsId,g.goodsImg,g.goodsName ,"
				+"ca.cartGoodNum,ca.cgDate from carts c,cartgoods ca, specs  sp,goods g,shops s, goodscolor gc where "
			    +"c.cartId=ca.cartId and ca.specsId=sp.specsId and sp.goodsId=g.goodsId and g.shopId=s.shopId and ca.gcId=gc.gcId "
			    + " and c.userId="+user.getUserId()+" and ca.cartGoodId in(";
	       for(int i=0;i<idList.size();i++){
	    	   if(i!=idList.size()-1){
	    		   sql=sql+idList.get(i)+",";
	    	   }else {
				  sql=sql+idList.get(i);
			}
	       }
	       sql=sql+") order by ca.cgDate desc";//查询语句的字符串拼接
	       List<Shopcarts> list=ca.getCarts(sql);
	       List<Integer> list5=new ArrayList<>();//新建一个放店铺id的集合
		    for (Shopcarts shopcarts : list) {//循环把店铺id放入list5集合中
				 if(!list5.contains(shopcarts.getShopId())){//当list5没有这个id时才允许add进去
					 list5.add(shopcarts.getShopId());
				 }		
				}
		    List<List<Shopcarts>> listAll=new ArrayList<>();//新建一个双层数组
		      
		       for(int i=0;i<list5.size();i++){
		    	   List<Shopcarts> list3=new ArrayList<>();//外层循环创建店铺的集合
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
		    			  list3.add(catrs);//将商品放入该店铺里
		    		   }  
		    	   }
		    	   listAll.add(list3);//每次的外层循环把店铺集合放入双层集合中   
		       }
	       
		      String hql="select addressId,isDefault,userAddress,userName,userPhone from address where userId="+user.getUserId()+" order by isDefault desc" ;
		      List<Address> li=address.selectAddress(hql);
		      model.put("cart_jieshuan", listAll);
		      model.put("address", li);
		   
		      
		      
		  
		       
	  
		
		
		return "mycart_jieshuan";
	}
	
	@RequestMapping("/cheshi")
	@ResponseBody
	public String cheshi(){
		System.out.println("zenmmdmdmm");
		return "{}";//没有写重定就是转发
	}
	
 
	

}

