package org.taobao.web;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.taobao.pojo.Shops;
import org.taobao.pojo.Users;
import org.taobao.service.ShopsService;
import org.taobao.util.AddShop;
import org.taobao.util.Sign;
import org.taobao.util.UserHelp;

@Controller
@RequestMapping("/shops")
public class ShopsController {
	
@Resource
private ShopsService ss;
@RequestMapping("/queryAll")
public String queryAll(String shopName,ModelMap map){
	String sql="select * from shops where 1=1";
	if (shopName!=null&&!shopName.equals("")) {
		sql=sql+" and shopName like '%"+shopName+"%';";
	}
	List<Shops> sl=ss.queryAll(sql);
	map.put("sl", sl);
	return "Shops";
}


@RequestMapping("/queryShops")
@ResponseBody
public List<Shops> queryShops(){
	String sql = "select * from shops";
	List<Shops> shops = ss.queryAll(sql);
	return shops;
}

@RequestMapping("/addShops")//添加商品
public String addShops(MultipartFile Imgs,Shops shops,HttpServletRequest request) throws IOException{
	//获得文件名加后缀名
	String filename = Imgs.getOriginalFilename(); 
	String shopImg="/images/touxiang.png";
	if(!filename.equals("")&&filename!=null){
	//获得文件后缀名的出现位置前一个
    int spot = filename.lastIndexOf(".");
    //获得后缀名
    String ext = filename.substring(spot);
    HttpSession session=request.getSession();
//获得文件上传的父路径
   String path = session.getServletContext().getRealPath("images");
   System.out.println("path:"+path);
    //获得当前时间的毫秒值和文件后缀名拼接成新的文件名
	filename=System.currentTimeMillis()+ext;
	//文件的保存
	File file = new File(path,filename);
	Imgs.transferTo(file);
	//文件的地址回复给浏览器让其通过此地址请求服务器获得刚上传的图片显示出来
	 shopImg="/images/"+filename;
    
	//将文件的请求地址返回
	}
	shops.setShopImg(shopImg);
	
	ss.addShops(shops);//添加店铺名称
	 return "redirect:/ok.jsp";
}

@RequestMapping("add1")
@ResponseBody
public AddShop fun1(String shopName){
	String sql ="select * from shops where shopName='"+shopName+"'";
	List<Shops> shops=ss.selectShops(sql);
	Sign s = new Sign();
	AddShop adds = new AddShop();
	if(shops.isEmpty()){
		s.setBiaoji("ok");
	} else {
		s.setBiaoji("error");
		adds.setShops(shops.get(0));
	}
	adds.setSign(s);
	
	return adds;

}
}
