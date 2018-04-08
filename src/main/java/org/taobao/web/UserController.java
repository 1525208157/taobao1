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
	
	@RequestMapping("/upload1")
	@ResponseBody
	public String upload1(MultipartFile goodsImg,HttpSession session) throws IllegalStateException, IOException {
       //����ļ����Ӻ�׺��
		String filename = goodsImg.getOriginalFilename();  
		//����ļ���׺���ĳ���λ��ǰһ��
        int spot = filename.lastIndexOf(".");
        //��ú�׺��
        String ext = filename.substring(spot);
        //����ļ��ϴ��ĸ�·��
        String path = session.getServletContext().getRealPath("images");
        //��õ�ǰʱ��ĺ���ֵ���ļ���׺��ƴ�ӳ��µ��ļ���
		filename=System.currentTimeMillis()+ext;
		//�ļ��ı���
		File file = new File(path,filename);
		goodsImg.transferTo(file);
		//�ļ��ĵ�ַ�ظ������������ͨ���˵�ַ�����������ø��ϴ���ͼƬ��ʾ����
		String userImg="/images/"+filename;
		//���ļ��������ַ����
        return userImg;
	}
        
	@RequestMapping("check_account")
	@ResponseBody
	public  Sign checkzhanghao(String account){
		String sql="select * from users where account='"+account+"'";
		List<Users> user=ur.selectUser(sql);
		Sign s=new Sign();
		s.setBiaoji("error");
		if(user.isEmpty()){
			s.setBiaoji("ok");
		}
		
		return s;
		
	}
}
