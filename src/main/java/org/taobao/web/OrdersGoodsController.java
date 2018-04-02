package org.taobao.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.taobao.pojo.OrderGoods;
import org.taobao.service.OrderGoodsService;
import org.taobao.service.OrderService;

@Controller
@RequestMapping("/odersGoods")
public class OrdersGoodsController {
	
	@Resource
	private OrderGoodsService os;
	
	@RequestMapping("/selectordergoods")
	@ResponseBody
	public List<OrderGoods> selectOrderGoods(){
		String sql = "select * from ordergoods";
		List<OrderGoods> orderGoods = os.queryAll(sql);
		return orderGoods;
	}
	
	
	
}
