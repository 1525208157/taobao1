package org.taobao.web;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;
import org.hibernate.sql.Select;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.taobao.pojo.Users;
import org.taobao.service.UserService;
import org.taobao.util.Sign;
import org.taobao.util.UserHelp;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private UserService ur;

	

	/**
	 * @param img
	 * @param session
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 * 上传图片加回显图片
	 */
	@RequestMapping("/insert_user")
	@ResponseBody//MultipartFile mfile
	public String upload(MultipartFile img, Users user,HttpServletRequest request) throws  IOException {
		System.out.println("到这里来了");
       //获得文件名加后缀名
		String filename = img.getOriginalFilename(); 
		String userImg="/images/touxiang.png";
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
		img.transferTo(file);
		//文件的地址回复给浏览器让其通过此地址请求服务器获得刚上传的图片显示出来
		 userImg="/images/"+filename;
	    
		//将文件的请求地址返回
		}
		user.setUserImg(userImg);
	    ur.saveOrUpdate(user);
	    
        return "{}";
		
	}

	/**
	 * @param user
	 * @return
	 * 添加即注册用户
	 */
	@RequestMapping("/register")
	public String register(Users user) {
		ur.saveOrUpdate(user);
		return "ok";
	}
	
	@RequestMapping("check_account")
	@ResponseBody
	public  UserHelp checkzhanghao(String account){
		String sql="select * from users where account='"+account+"'";
		List<Users> user=ur.selectUser(sql);
		Sign s=new Sign();
		UserHelp use=new UserHelp();
		
		if(user.isEmpty()){
			s.setBiaoji("ok");
		}else {
			s.setBiaoji("error");
			use.setUsers(user.get(0));
			
		}
		use.setSign(s);
		
		return use;
		
	}
	
	
	@RequestMapping("/check_user")
	@ResponseBody
	public UserHelp check_user(Users user){
		String sql="select * from users where account='"+user.getAccount()+"' and problem='"
	            +user.getProblem()+"' and answer='"+user.getAnswer()+"'";
		 List<Users> use=ur.selectUser(sql);
		 Sign s=new Sign();
			UserHelp u=new UserHelp();
			
			if(use.isEmpty()){
				s.setBiaoji("ok");
			}else {
				s.setBiaoji("error");
				u.setUsers(use.get(0));
				
			}
			u.setSign(s);
			
			return u;
		
	}
	
	
	@RequestMapping("/find_update_uses")
	@ResponseBody
	public String find_update_uses(Users user){
		String sql="select * from users where account='"+user.getAccount()+"'";
		List<Users> use=ur.selectUser(sql);
		use.get(0).setPassword(user.getPassword());
		ur.saveOrUpdate(use.get(0));
		return "{}";
		
	}
	
	@RequestMapping("/login")
	@ResponseBody
	public Sign login(Users user,HttpServletRequest request){
		HttpSession session=request.getSession();
		String sql="select * from users where  account='"+user.getAccount()+"'  and  password='"+user.getPassword()+"'";
		List<Users> use=ur.selectUser(sql);
		Sign si=new Sign();
		if(use.isEmpty()){
			si.setBiaoji("error");
		}else {
			session.setAttribute("user", use.get(0));
			si.setBiaoji("ok");
		}
		return si;
		
	}
	
	
	
}
