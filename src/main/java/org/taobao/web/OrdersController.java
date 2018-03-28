package org.taobao.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.taobao.pojo.Orders;
import org.taobao.service.OrderService;

@Controller
@RequestMapping("/orders")
public class OrdersController {

	@Resource
	private OrderService os;
	
	
	@RequestMapping("/selectOrders")
	@ResponseBody
	 public List<Orders> selectOrders(){
		 String sql ="select * from orders";
		 List<Orders> orders  = os.selectOrders(sql);
		 return orders;
	 }
	 
	 
	 
}
