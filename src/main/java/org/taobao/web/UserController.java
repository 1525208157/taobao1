package org.taobao.web;

import java.util.List;

import javax.annotation.Resource;import org.springframework.lang.UsesJava7;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.taobao.pojo.Users;
import org.taobao.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private UserService ur;
	
	@RequestMapping("/insertUser")
	@ResponseBody
	public String insertUser(Users user) {
		ur.saveOrUpdate(user);
		return "ok";
	}
	
	@RequestMapping("/selectUser")
	@ResponseBody
	public String selectUser(String account,String password) {
		String sql = "select * from users where account ="+account+" and password = "+password;
		String str = "";
		List<Users> users = ur.selectUser(sql);
		if (users.size() > 0) {
			str = "ok";
		} else {
			str = "error";
		}
		return str;
	}
	
}
