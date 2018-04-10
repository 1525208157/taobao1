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

@RequestMapping("/addShops")//�����Ʒ
public String addShops(MultipartFile Imgs,Shops shops,HttpServletRequest request) throws IOException{
	//����ļ����Ӻ�׺��
	String filename = Imgs.getOriginalFilename(); 
	String shopImg="/images/touxiang.png";
	if(!filename.equals("")&&filename!=null){
	//����ļ���׺���ĳ���λ��ǰһ��
    int spot = filename.lastIndexOf(".");
    //��ú�׺��
    String ext = filename.substring(spot);
    HttpSession session=request.getSession();
//����ļ��ϴ��ĸ�·��
   String path = session.getServletContext().getRealPath("images");
   System.out.println("path:"+path);
    //��õ�ǰʱ��ĺ���ֵ���ļ���׺��ƴ�ӳ��µ��ļ���
	filename=System.currentTimeMillis()+ext;
	//�ļ��ı���
	File file = new File(path,filename);
	Imgs.transferTo(file);
	//�ļ��ĵ�ַ�ظ������������ͨ���˵�ַ�����������ø��ϴ���ͼƬ��ʾ����
	 shopImg="/images/"+filename;
    
	//���ļ��������ַ����
	}
	shops.setShopImg(shopImg);
	
	ss.addShops(shops);//��ӵ�������
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
