package org.taobao.web;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.taobao.pojo.Users;
import org.taobao.service.UserService;

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
	@RequestMapping("/upload")
	@ResponseBody
	public String upload(MultipartFile img,HttpSession session) throws IllegalStateException, IOException {
       //获得文件名加后缀名
		String filename = img.getOriginalFilename();  
		//获得文件后缀名的出现位置前一个
        int spot = filename.lastIndexOf(".");
        //获得后缀名
        String ext = filename.substring(spot);
        //获得文件上传的父路径
        String path = session.getServletContext().getRealPath("images");
        //获得当前时间的毫秒值和文件后缀名拼接成新的文件名
		filename=System.currentTimeMillis()+ext;
		//文件的保存
		File file = new File(path,filename);
		img.transferTo(file);
		//文件的地址回复给浏览器让其通过此地址请求服务器获得刚上传的图片显示出来
		String userImg="/images/"+filename;
		//将文件的请求地址返回
        return userImg;
		
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
}
