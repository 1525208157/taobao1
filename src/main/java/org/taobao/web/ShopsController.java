package org.taobao.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.taobao.pojo.Goods;
import org.taobao.pojo.Shops;
import org.taobao.service.GoodsService;
import org.taobao.service.ShopsService;

@Controller
@RequestMapping("/goods")
public class ShopsController {
	
	
	@Resource
	private  ShopsService ss;
	
	@RequestMapping("/queryshops")
	@ResponseBody
	public List<Shops> queryAll(){
		String sql="select * from shops";
		List<Shops> gl=ss.queryAll(sql);
		return gl;
	}
}
