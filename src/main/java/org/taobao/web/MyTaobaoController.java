package org.taobao.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.taobao.pojo.Address;
import org.taobao.pojo.Appraises;
import org.taobao.pojo.CartGoods;
import org.taobao.pojo.Carts;
import org.taobao.pojo.FavoritesGoods;
import org.taobao.pojo.FavoritesShops;
import org.taobao.pojo.Goods;
import org.taobao.pojo.Orders;
import org.taobao.pojo.Shops;
import org.taobao.pojo.Specs;
import org.taobao.pojo.Users;
import org.taobao.service.AddressService;
import org.taobao.service.AppraisesService;
import org.taobao.service.CartGoodsService;
import org.taobao.service.CartsService;
import org.taobao.service.FavoritesGoodService;
import org.taobao.service.FavoritesShopService;
import org.taobao.service.GoodsService;
import org.taobao.service.OrderGoodsService;
import org.taobao.service.OrderService;
import org.taobao.service.ShopsService;
import org.taobao.service.SpecsService;
import org.taobao.service.UserService;

@Controller
@RequestMapping("/myTaobao")
public class MyTaobaoController {
	@Resource
	private AddressService as;
	@Resource
	private UserService us;
	@Resource
	private OrderService os;
	@Resource
	private FavoritesGoodService fgs;
	@Resource
	private FavoritesShopService fss;
	@Resource
	private OrderGoodsService ogs;
	@Resource
	private GoodsService gs;
	@Resource
	private SpecsService ss;
	@Resource
	private ShopsService shopsService;
	@Resource
	private AppraisesService apps;
	@Resource
	private CartsService cs;
	@Resource
	private CartGoodsService cgs;
	
	@RequestMapping("/selectAddress")
	@ResponseBody
	public List<Address> selectAddress(Integer userId) { //根据用户查询收货地址
		String sql = "select * from address where userId = "+userId;
		List<Address> address = as.selectAddress(sql);
		return address;
	}
	
	@RequestMapping("/selectOneAddress")
	@ResponseBody
	public Address selectOneAddress(Integer addressId) { //根据id查询收货地址
		Address address = as.selectOneAddress(addressId);
		return address;
	}
	
	@RequestMapping("/updateIsDefault")
	@ResponseBody
	public String updateIsDefault(Integer addressId,Integer userId) { //设为默认地址
		String sql = "select * from address where userId = "+userId;
		List<Address> addresses = as.selectAddress(sql);
		for (Address ad: addresses) {
			if (ad.getIsDefault() == 1) {
				ad.setIsDefault(0);
				as.saveOrUpdateAddress(ad);
			}
		}
		Address address = as.selectOneAddress(addressId);
		address.setIsDefault(1);
		as.saveOrUpdateAddress(address);
		return "ok";
	}
	
	@RequestMapping("/updateAddress")
	@ResponseBody
	public String updateAddress(Address address) { // 添加/修改收货地址
		as.saveOrUpdateAddress(address);
		return "ok";
	}
	
	@RequestMapping("/deleteAddress")
	@ResponseBody
	public String deleteAddress(Integer addressId) { //删除收货地址
		as.deleteAddress(addressId);
		return "ok";
	}
	
	@RequestMapping("/updatePass")
	@ResponseBody
	public String updatePass(Integer userId,String password) { //修改密码
		Users u = us.selectOne(userId);
		u.setPassword(password);
		us.saveOrUpdate(u);
		return "ok";
	}
	
	@RequestMapping("/selectFavoritesGoods")
	@ResponseBody
	public List<FavoritesGoods> selectFavoritesGoods(Integer userId) { //查询所有关注商品
		String sql = "select * from favoritesGoods where userId = "+userId;
		List<FavoritesGoods> favoritesGoods = fgs.selectFavoritesGoods(sql);
		return favoritesGoods;
	}
	
	@RequestMapping("/insertFavoritesGood")
	@ResponseBody
	public Integer insertFavoritesGood(Integer goodsId,Integer userId,FavoritesGoods fGoods) { //添加关注商品
		List<FavoritesGoods> favoritesGoods = fgs.selectFavoritesGoods("select * from favoritesGoods where goodsId = "+goodsId+" and userId = "+userId);
		Integer n;
		if (favoritesGoods.size() > 0) {
			n = 0;
		} else {
			Goods goods = gs.selectGoods(goodsId);
			Users users = us.selectOne(userId);
			fGoods.setGoods(goods);
			fGoods.setUsers(users);
			fgs.insertFavoritesGood(fGoods);
			n = 1;
		}
		return n;
	}
	
	@RequestMapping("/deleteFavoritesGood")
	@ResponseBody
	public String deleteFavoritesGood(Integer id) { //删除关注商品
		fgs.deleteFavoritesGood(id);
		return "ok";
	}
	
	@RequestMapping("/selectFavoritesShops")
	@ResponseBody
	public List<FavoritesShops> selectFavoritesShops(Integer userId) { //查询所有关注店铺
		String sql = "select * from favoritesShops where userId = "+userId;
		List<FavoritesShops> favoritesShops = fss.selectFavoritesShops(sql);
		return favoritesShops;
	}
	
	@RequestMapping("/insertFavoritesShop")
	@ResponseBody
	public Integer insertFavoritesShop(Integer shopId,Integer userId,FavoritesShops fShops) { //添加关注店铺
		List<FavoritesShops> favoritesShops = fss.selectFavoritesShops("select * from favoritesShops where shopId = "+shopId+" and userId = "+userId);
		Integer n;
		if (favoritesShops.size() > 0) {
			n = 0;
		} else {
			Shops shop = shopsService.selectShop(shopId);
			Users users = us.selectOne(userId);
			fShops.setShops(shop);
			fShops.setUsers(users);
			fss.insertFavoritesShop(fShops);
			n = 1;
		}
		return n;
	}
	
	@RequestMapping("/deleteFavoritesShop")
	@ResponseBody
	public String deleteFavoritesShop(Integer id) { //删除关注店铺
		fss.deleteFavoritesShop(id);
		return "ok";
	}
	
	@RequestMapping("/selectOrders")
	@ResponseBody
	public List<Orders> selectOrders(Integer userId,Integer orderStatus) { //按  状态 用户  查询未删除订单
		String sql = "select * from orders where userId = "+userId+" and isDel = 0";
		if (orderStatus > 0) {
			sql = sql + " and orderStatus = "+orderStatus;
		}
		List<Orders> orders = os.selectOrders(sql);
		return orders;
	}
	
	@RequestMapping("/selectIsDelOrders")
	@ResponseBody
	public List<Orders> selectIsDelOrders(Integer userId) { //查询删除订单(订单回收站)
		String sql = "select * from orders where userId = "+userId+" and isDel = 1";
		List<Orders> orders = os.selectOrders(sql);
		return orders;
	}
	
	@RequestMapping("/updateIsDel")
	@ResponseBody
	public String updateIsDel(Integer orderId,Integer isDel) { //修改逻辑删除状态
		Orders order = os.selectOrder(orderId);
		order.setIsDel(isDel);
		os.saveOrUpdate(order);
		return "ok";
	}
	
	@RequestMapping("/updateOrderStatus")
	@ResponseBody
	public String updateOrderStatus(Integer orderId,Integer orderStatus) { //修改订单状态(确认收货)
		Orders order = os.selectOrder(orderId);
		order.setOrderStatus(orderStatus);
		os.saveOrUpdate(order);
		return "ok";
	}
	
	@RequestMapping("/addAppraises")
	@ResponseBody
	public String addAppraises(Integer orderId,Integer orderStatus,Appraises appraises) { //修改订单状态(评价)
		Orders order = os.selectOrder(orderId);
		order.setOrderStatus(orderStatus);
		os.saveOrUpdate(order); //修改订单状态
		Date date = new Date();//获取时间
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		appraises.setAppraisesTime(sf.format(date));
		apps.saveOrUpdateAddress(appraises); //添加评价
		return "ok";
	}
	
	/*@RequestMapping("/deleteOrderGoods")
	@ResponseBody
	public String deleteOrderGoods(int[] arrays) { //批量删除订单商品
		String hql = "";
		for (int i = 0; i < arrays.length; i++) {
			hql = "update OrderGoods set isDel = 0 where ogId = "+arrays[i];
			ogs.updateIsDel(hql);
		}
		return "ok";
	}*/
	
	@RequestMapping("/selectGoods")
	@ResponseBody
	public Goods selectGoods(Integer goodsId) { //按ID查询商品
		Goods goods = gs.selectGoods(goodsId);
		return goods;
	}
	
	@RequestMapping("/selectSpecs")
	@ResponseBody
	public Specs selectSpecs(Integer specsId) { //按ID查询规格
		Specs specs = ss.selectSpecs(specsId);
		return specs;
	}
	
	@RequestMapping("/selectShops")
	@ResponseBody
	public Shops selectShops(Integer shopId) { //按ID查询商品
		Shops shop = shopsService.selectShop(shopId);
		return shop;
	}
	
	//添加至购物车
	@RequestMapping("/insertCarts")
	@ResponseBody
	public String insertCarts(Integer userId,CartGoods cg) {
		String sql = "select * from carts where userId = "+userId;
		List<Carts> carts = cs.selectCarts(sql);
		if (carts.size() == 0) { //
			Carts ca = new Carts();
			ca.setUser(us.selectOne(userId));
			cs.addCart(ca); //新建购物车
		}
		List<Carts> c = cs.selectCarts(sql); //购物车对象
		Integer cartId = c.get(0).getCartId();
		Integer gcId = cg.getgColor().getGcId();
		Integer specsId = cg.getSpecs().getSpecsId();
		System.out.println(cartId+" "+gcId+" "+specsId);
		String s = "select * from cartgoods where gcId = "+gcId+" and specsId = "+specsId+" and cartId = "+cartId;
		List<CartGoods> cartGoods = cgs.selectCartGoods(s);
		if (cartGoods.size() > 0) { //当购物车存在该订单商品，数量加1
			cartGoods.get(0).setCartGoodNum(cartGoods.get(0).getCartGoodNum()+1);
			cgs.updateCartGoods(cartGoods.get(0));
		} else {
			Date now = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			cg.setCgDate(sf.format(now)); //添加当前时间
			List<CartGoods> cc = new ArrayList<>();
			cc.add(cg);
			c.get(0).setCartGoods(cc);
			cgs.updateCartGoods(cg);
		}
		return "ok";
	}
	
}
