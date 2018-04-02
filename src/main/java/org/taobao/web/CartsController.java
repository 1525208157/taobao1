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
		    
		      List<Integer> list5=new ArrayList<>();//�½�һ���ŵ���id�ļ���
		    for (Shopcarts shopcarts : list) {//ѭ���ѵ���id����list5������
				 if(!list5.contains(shopcarts.getShopId())){//��list5û�����idʱ������add��ȥ
					 list5.add(shopcarts.getShopId());
				 }
					
				}
			
		   
		    List<List<Shopcarts>> listAll=new ArrayList<>();//�½�һ��˫������
		      
		       for(int i=0;i<list5.size();i++){
		    	   List<Shopcarts> list3=new ArrayList<>();//���ѭ���������̵ļ���
		    	   for(int j=0;j<list.size();j++){
		    		   Shopcarts catrs=null;
		    		   if(list5.get(i)==list.get(j).getShopId()){
		    			   catrs=new Shopcarts();
		    			   catrs.setShopId(list.get(j).getShopId());//����id
		    			   catrs.setShopName(list.get(j).getShopName());//��������
		    			   catrs.setSpecsId(list.get(j).getSpecsId());//�ֻ����id
		    			   catrs.setGcName(list.get(j).getGcName());//�ֻ���ɫ
		    			   catrs.setSmoney(list.get(j).getSmoney());//�ֻ�����
		    			   catrs.setGoodsId(list.get(j).getGoodsId());//�ֻ� id
		    			   catrs.setCartGoodNum(list.get(j).getCartGoodNum());//�ֻ�����
		    			   catrs.setCgDate(list.get(j).getCgDate());//������Ʒʱ��
		    			   catrs.setGoodsName(list.get(j).getGoodsName());//�ֻ�����
		    			   catrs.setSpecsName(list.get(j).getSpecsName());//�ͺ�����
		    			   catrs.setCartGoodId(list.get(j).getCartGoodId());//������Ʒid
		    			  list3.add(catrs);//����Ʒ����õ�����
		    		   }  
		    	   }
		    	   listAll.add(list3);//ÿ�ε����ѭ���ѵ��̼��Ϸ���˫�㼯����
		    	   
		       }
		       
		
		 return listAll; 
	}
	
	
	@RequestMapping("/setFavoritesGood")//������ӹ�ע
	@ResponseBody
	public Sign setFavoritesGood(HttpServletRequest request,Goods good){
	
		
		HttpSession see=request.getSession();
		 Users user=(Users) see.getAttribute("user");
		if(user==null){
			user=new Users();
			user.setUserId(1);
		}
		
	   
	    String sql="select * from favoritesgoods where userId="+user.getUserId()+" and goodsId="+good.getGoodsId();
	   List<FavoritesGoods> fagood1=favgood.selectFavoritesGoods(sql);//ǰ̨����������Ʒid ��ѯ��ע��Ʒ���ݿ������û���������
	    Sign si=new Sign();
	    if(fagood1.isEmpty()){//����������Ϊ�յĻ��Ϳ�����ӹ�ע��
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
	public String deleteFavoritesGood(Integer cartGoodId){//����ɾ��
		System.out.println("ɾ����Ʒ");
		 ca.deleteCartGood(cartGoodId);
		 return "mycart";
	}
	
	@RequestMapping("/setFavoritesGoods")//������ӹ�ע
	@ResponseBody//
	public Sign setFavoritesGoods(HttpServletRequest request,@RequestParam(value="cartGoodIds[]",required=false) List<Integer> idList){//������ӹ�ע
		System.out.println("��ӹ�ע");
		HttpSession see=request.getSession();
	    
		 Users user=(Users) see.getAttribute("user");
		if(user==null){
			user=new Users();
			user.setUserId(1);
		}
		 
		Sign si=new Sign();
		if(idList!=null){//�����ں�̨�ж��ǲ��ǿ��� ֱ��дidList.size()!=0��������д������ǿ�ʱidlist���ǿգ� ��Ȼǰ̨new��һ������
		List<Integer> li=new ArrayList<>();
		for (int i=0;i<idList.size();i++) {//ͨ��ѭ�����ﳵid��������Ʒid��������Ʒid����ӽ�����
			System.out.println("ѡ�е�id:"+idList.get(i));
			String hql="select go.goodsId from cartgoods ca,specs sp,goods go where ca.specsId=sp.specsId and "
					   +"sp.goodsId=go.goodsId and cartGoodId="+idList.get(i);
			Integer a=(Integer) favgood.getObjet(hql).get(0);
			li.add(a);	
		}
		
		for (Integer integer : li) {//ѭ������ ����Ʒ��ӽ���ע
	    String sql="select * from favoritesgoods where userId="+user.getUserId()+" and goodsId="+integer;//ѭ����ѯ��ע����Ʒ����û�и���Ʒ
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
			System.out.println("ѡ���Ϊ��");
		si.setBiaoji("checkednull");
	}
		return si;
	}
	
	@RequestMapping("/deleteCartGoods")
	@ResponseBody
	public String deleteFavoritesGoods(@RequestParam(value="cartGoodIds[]",required=false) List<Integer> idList){//����ɾ�����ﳵ�����Ʒ
		//System.out.println("ɾ����Ʒ");
		//����ֱ����ǰ̨�ж��ǲ��ǿ���
		for (Integer integer : idList) {
			System.out.println("����ɾ����"+integer);
		}
		for (Integer integer : idList) {
			ca.deleteCartGood(integer);
		}
		 
		 return "{}";
	}
	
	@RequestMapping("/jia_cartGoodNum")
	@ResponseBody
	public Sign jia_cartGoodNum(CartGoods good){//���ﳵ��������ӵ�Ч��
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
	public Sign jian_cartGoodNum(CartGoods good){//���ﳵ��������ӵ�Ч��
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
	public  CartHelp select_cartGood_type(Integer cartgoodId){//�޸Ĺ��ﳵ����ֻ��ͺ�֮ǰ�Ĳ�ѯ������Ҫ����һ���Լ���װ�Ķ���
		String sql="select go.goodsId from cartgoods ca,specs sp,goods go where ca.specsId=sp.specsId and "
				   +"sp.goodsId=go.goodsId and cartGoodId="+cartgoodId;
		Integer a=(Integer) favgood.getObjet(sql).get(0);
	   
		String sql1="select * from goodscolor where goodsId="+a;
	    List<GoodsColor> list=ca.select_goodColor(sql1);//��ѯ���ֻ�����ɫ����
	   
	    String sql2="select * from specs where goodsId="+a;
	    List<Specs> list1=ca.select_specs(sql2);//��ѯ�ֻ����ڴ����
	    CartGoods cgds=ca.select_CartGoood_one(cartgoodId);//��ѯ���ﳵ����Ʒid
	    
	   
	    CartHelp cc=new CartHelp();//��װ�Լ�д�Ķ��󷵻ص�ǰ̨
	    cc.setCartGoods(cgds);
	    cc.setColorlist(list);
	    cc.setSpecelist(list1);
	    
	    return cc;
		
	}
	
	@RequestMapping("/update_cartgoods")
	@ResponseBody
	 public String update_cartgoods(HttpServletRequest request,CartGoods good){//�޸Ĺ��ﳵ�����Ʒ�ͺ�
		   
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
			//����ǰ̨���������ֻ��ͺż���ɫ����ѯ���иö���
			
			CartGoods bb=ca.select_CartGoood_one(good.getCartGoodId());//����id��ѯ���ݿ���Ĺ��ﳵ��Ʒ
			
			
			//������ж��ǣ��������ǰ̨���������ֻ��ͺż���ɫ����ѯ��һ�����󣬲��Ҹö����id�����ڴ����ݿ��ѯ��ԭʼ���ﳵ��Ʒidʱ����ʱֻ���ԭ����
			//ɾ�������ˣ���Ϊ���ﳵ��һ���û�������һ����Ʒͬһ���ͺŵ��ֻ�����������֮�޸�ԭ���Ĺ��ﳵ����ֻ�����
			if(!cag.isEmpty()&&cag.get(0).getCartGoodId()!=good.getCartGoodId()){
			   ca.deleteCartGood(good.getCartGoodId());
			}else {
			 Specs s=new Specs();
			 GoodsColor g=new GoodsColor();
			 s.setSpecsId(good.getSpecs().getSpecsId());
			 g.setGcId(good.getgColor().getGcId());
			 
			 bb.setgColor(g);
			 bb.setSpecs(s);//����hibernate�ĳ־û����ص�����Ͳ�����save�� ���������������������web�㣬�����ó־û�
			ca.saveorupdate(bb);
			}
			return "{}";
		   
	 }
	
	@RequestMapping("/mycart_jieshuan")//������ﲻ��ajax�������ʱ����url�������ʱ����Ҫ��[]
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
	       sql=sql+") order by ca.cgDate desc";//��ѯ�����ַ���ƴ��
	       List<Shopcarts> list=ca.getCarts(sql);
	       List<Integer> list5=new ArrayList<>();//�½�һ���ŵ���id�ļ���
		    for (Shopcarts shopcarts : list) {//ѭ���ѵ���id����list5������
				 if(!list5.contains(shopcarts.getShopId())){//��list5û�����idʱ������add��ȥ
					 list5.add(shopcarts.getShopId());
				 }		
				}
		    List<List<Shopcarts>> listAll=new ArrayList<>();//�½�һ��˫������
		      
		       for(int i=0;i<list5.size();i++){
		    	   List<Shopcarts> list3=new ArrayList<>();//���ѭ���������̵ļ���
		    	   for(int j=0;j<list.size();j++){
		    		   Shopcarts catrs=null;
		    		   if(list5.get(i)==list.get(j).getShopId()){
		    			   catrs=new Shopcarts();
		    			   catrs.setShopId(list.get(j).getShopId());//����id
		    			   catrs.setShopName(list.get(j).getShopName());//��������
		    			   catrs.setSpecsId(list.get(j).getSpecsId());//�ֻ����id
		    			   catrs.setGcName(list.get(j).getGcName());//�ֻ���ɫ
		    			   catrs.setSmoney(list.get(j).getSmoney());//�ֻ�����
		    			   catrs.setGoodsId(list.get(j).getGoodsId());//�ֻ� id
		    			   catrs.setCartGoodNum(list.get(j).getCartGoodNum());//�ֻ�����
		    			   catrs.setCgDate(list.get(j).getCgDate());//������Ʒʱ��
		    			   catrs.setGoodsName(list.get(j).getGoodsName());//�ֻ�����
		    			   catrs.setSpecsName(list.get(j).getSpecsName());//�ͺ�����
		    			   catrs.setCartGoodId(list.get(j).getCartGoodId());//������Ʒid
		    			  list3.add(catrs);//����Ʒ����õ�����
		    		   }  
		    	   }
		    	   listAll.add(list3);//ÿ�ε����ѭ���ѵ��̼��Ϸ���˫�㼯����   
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
		return "{}";//û��д�ض�����ת��
	}
	
 
	

}

