package org.taobao.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.taobao.pojo.Address;
import org.taobao.pojo.FavoritesGoods;
import org.taobao.pojo.FavoritesShops;
import org.taobao.pojo.Goods;
import org.taobao.pojo.Orders;
import org.taobao.pojo.Shops;
import org.taobao.pojo.Specs;
import org.taobao.pojo.Users;
import org.taobao.service.AddressService;
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
	
	@RequestMapping("/selectAddress")
	@ResponseBody
	public List<Address> selectAddress(Integer userId) { //�����û���ѯ�ջ���ַ
		String sql = "select * from address where userId = "+userId;
		List<Address> address = as.selectAddress(sql);
		return address;
	}
	
	@RequestMapping("/selectOneAddress")
	@ResponseBody
	public Address selectOneAddress(Integer addressId) { //����id��ѯ�ջ���ַ
		Address address = as.selectOneAddress(addressId);
		return address;
	}
	
	@RequestMapping("/updateIsDefault")
	@ResponseBody
	public String updateIsDefault(Integer addressId,Integer userId) { //��ΪĬ�ϵ�ַ
		userId = 1;
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
	public String updateAddress(Address address) { // ���/�޸��ջ���ַ
		as.saveOrUpdateAddress(address);
		return "ok";
	}
	
	@RequestMapping("/deleteAddress")
	@ResponseBody
	public String deleteAddress(Integer addressId) { //ɾ���ջ���ַ
		as.deleteAddress(addressId);
		return "ok";
	}
	
	@RequestMapping("/updatePass")
	@ResponseBody
	public String updatePass(Integer userId,String password) { //�޸�����
		Users u = us.selectOne(userId);
		u.setPassword(password);
		us.saveOrUpdate(u);
		return "ok";
	}
	
	@RequestMapping("/selectFavoritesGoods")
	@ResponseBody
	public List<FavoritesGoods> selectFavoritesGoods(Integer userId) { //��ѯ���й�ע��Ʒ
		String sql = "select * from favoritesGoods where userId = "+userId;
		List<FavoritesGoods> favoritesGoods = fgs.selectFavoritesGoods(sql);
		return favoritesGoods;
	}
	
	@RequestMapping("/insertFavoritesGood")
	@ResponseBody
	public Integer insertFavoritesGood(Integer goodsId,Integer userId,FavoritesGoods fGoods) { //��ӹ�ע��Ʒ
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
	public String deleteFavoritesGood(Integer id) { //ɾ����ע��Ʒ
		fgs.deleteFavoritesGood(id);
		return "ok";
	}
	
	@RequestMapping("/selectFavoritesShops")
	@ResponseBody
	public List<FavoritesShops> selectFavoritesShops(Integer userId) { //��ѯ���й�ע����
		String sql = "select * from favoritesShops where userId = "+userId;
		List<FavoritesShops> favoritesShops = fss.selectFavoritesShops(sql);
		return favoritesShops;
	}
	
	@RequestMapping("/insertFavoritesShop")
	@ResponseBody
	public Integer insertFavoritesShop(Integer shopId,Integer userId,FavoritesShops fShops) { //��ӹ�ע����
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
	public String deleteFavoritesShop(Integer id) { //ɾ����ע����
		fss.deleteFavoritesShop(id);
		return "ok";
	}
	
	@RequestMapping("/selectOrders")
	@ResponseBody
	public List<Orders> selectOrders(Integer userId,Integer orderStatus) { //��  ״̬ �û�  ��ѯδɾ������
		String sql = "select * from orders where userId = "+userId+" and isDel = 0";
		if (orderStatus > 0) {
			sql = sql + " and orderStatus = "+orderStatus;
		}
		List<Orders> orders = os.selectOrders(sql);
		return orders;
	}
	
	@RequestMapping("/selectIsDelOrders")
	@ResponseBody
	public List<Orders> selectIsDelOrders(Integer userId) { //��ѯɾ������(��������վ)
		String sql = "select * from orders where userId = "+userId+" and isDel = 1";
		List<Orders> orders = os.selectOrders(sql);
		return orders;
	}
	
	@RequestMapping("/updateIsDel")
	@ResponseBody
	public String updateIsDel(Integer orderId,Integer isDel) { //�޸��߼�ɾ��״̬
		Orders order = os.selectOrder(orderId);
		order.setIsDel(isDel);
		os.saveOrUpdate(order);
		return "ok";
	}
	
	/*@RequestMapping("/deleteOrderGoods")
	@ResponseBody
	public String deleteOrderGoods(int[] arrays) { //����ɾ��������Ʒ
		String hql = "";
		for (int i = 0; i < arrays.length; i++) {
			hql = "update OrderGoods set isDel = 0 where ogId = "+arrays[i];
			ogs.updateIsDel(hql);
		}
		return "ok";
	}*/
	
	
	@RequestMapping("/selectUser")
	@ResponseBody
	public String selectUser(String account,String password,HttpServletRequest request) { //�޸�����
		HttpSession session = request.getSession();
		String sql = "select * from users where account = "+account+" and password = "+password;
		List<Users> users = us.selectUser(sql);
		String str = "";
		if (users != null && users.size() != 0) {
			str = "ok";
			session.setAttribute("users", users.get(0));
		} else {
			str = "error";
		}
		return str;
	}
	
	@RequestMapping("/selectGoods")
	@ResponseBody
	public Goods selectGoods(Integer goodsId) { //��ID��ѯ��Ʒ
		Goods goods = gs.selectGoods(goodsId);
		return goods;
	}
	
	@RequestMapping("/selectSpecs")
	@ResponseBody
	public Specs selectSpecs(Integer specsId) { //��ID��ѯ���
		Specs specs = ss.selectSpecs(specsId);
		return specs;
	}
	
	@RequestMapping("/selectShops")
	@ResponseBody
	public Shops selectShops(Integer shopId) { //��ID��ѯ��Ʒ
		Shops shop = shopsService.selectShop(shopId);
		return shop;
	}
	
}
