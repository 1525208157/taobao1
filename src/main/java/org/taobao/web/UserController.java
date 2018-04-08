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
	 * �ϴ�ͼƬ�ӻ���ͼƬ
	 */
	@RequestMapping("/insert_user")
	@ResponseBody//MultipartFile mfile
	public String upload(MultipartFile img, Users user,HttpServletRequest request) throws  IOException {
		System.out.println("����������");
       //����ļ����Ӻ�׺��
		String filename = img.getOriginalFilename(); 
		String userImg="/images/touxiang.png";
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
		img.transferTo(file);
		//�ļ��ĵ�ַ�ظ������������ͨ���˵�ַ�����������ø��ϴ���ͼƬ��ʾ����
		 userImg="/images/"+filename;
	    
		//���ļ��������ַ����
		}
		user.setUserImg(userImg);
	    ur.saveOrUpdate(user);
	    
        return "{}";
		
	}

	/**
	 * @param user
	 * @return
	 * ��Ӽ�ע���û�
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
