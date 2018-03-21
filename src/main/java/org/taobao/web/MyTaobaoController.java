package org.taobao.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.taobao.pojo.Address;
import org.taobao.pojo.Orders;
import org.taobao.pojo.Users;
import org.taobao.service.AddressService;
import org.taobao.service.OrderService;
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
	
	@RequestMapping("/selectAddress")
	@ResponseBody
	public List<Address> selectAddress(Integer userId) { //�����û���ѯ�ջ���ַ
		String sql = "select * from address where userId = "+userId;
		List<Address> address = as.selectAll(sql);
		return address;
	}
	
	@RequestMapping("/updatePassword")
	@ResponseBody
	public String updatePassword(Users u) { //�޸��û����� ͷ�� �ǳ�
		us.saveOrUpdate(u);
		return "ok";
	}
	
	@RequestMapping("/selectOrders")
	@ResponseBody
	public List<Orders> selectOrders() {
		String sql = "select * from orders";
		List<Orders> orders = os.selectOrders(sql);
		return orders;
	}
	
}
