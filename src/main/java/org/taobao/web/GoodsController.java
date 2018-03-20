package org.taobao.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.taobao.pojo.Goods;
import org.taobao.service.GoodsService;

@Controller
public class GoodsController {
@Resource
private GoodsService gs;
@RequestMapping("/queryAll")
@ResponseBody
public String queryAll(){
	String sql="select * from goods where 1=1";
	List<Goods> gl=gs.queryAll(sql);
	return "Goods";
}
}
