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
	 * �ϴ�ͼƬ�ӻ���ͼƬ
	 */
	@RequestMapping("/upload")
	@ResponseBody
	public String upload(MultipartFile img,HttpSession session) throws IllegalStateException, IOException {
       //����ļ����Ӻ�׺��
		String filename = img.getOriginalFilename();  
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
		img.transferTo(file);
		//�ļ��ĵ�ַ�ظ������������ͨ���˵�ַ�����������ø��ϴ���ͼƬ��ʾ����
		String userImg="/images/"+filename;
		//���ļ��������ַ����
        return userImg;
		
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
}
