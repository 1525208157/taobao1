package org.taobao.web;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sound.midi.MidiChannel;

import org.apache.catalina.User;
import org.aspectj.weaver.Shadow;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.taobao.pojo.Carts;
import org.taobao.pojo.FavoritesGoods;
import org.taobao.pojo.Goods;
import org.taobao.pojo.Users;
import org.taobao.service.CartsService;
import org.taobao.service.FavoritesGoodService;
import org.taobao.util.Shopcarts;
import org.taobao.util.Sign;
import org.w3c.dom.ls.LSInput;

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
		String sql="select s.shopId,s.shopName,sp.specsId,sp.specsName,gc.gcName,sp.smoney,g.goodsId,g.goodsImg,g.goodsName ,"
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
		    			  list3.add(catrs);
		    		   }  
		    	   }
		    	   listAll.add(list3);
		    	   
		       }
		       
		
		 return listAll; 
	}
	
	
	@RequestMapping("/setFavoritesGood")
	@ResponseBody
	public Sign setFavoritesGood(HttpServletRequest request,Goods good){//单次添加关注
		HttpSession see=request.getSession();
		Users user=(Users) see.getAttribute("user");
	   
	    String sql="select * from favoritesgoods where userId="+user.getUserId()+" and goodsId="+good.getGoodsId();
	    FavoritesGoods fagood1=favgood.selectFavoritesGoods(sql).get(0);
	    Sign si=new Sign();
	    if(fagood1==null){
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
	
	

}
