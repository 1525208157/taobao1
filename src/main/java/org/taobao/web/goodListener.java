package org.taobao.web;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Application Lifecycle Listener implementation class goodListener
 *
 */
public class goodListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public goodListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
    	System.out.println("������������......");
		/*//���application���� request.getSession().getServletContext();����õ�ServletContext()
		ServletContext application = sce.getServletContext();
		//�洢�����û��˺ŵļ���
		List<String> online = new ArrayList<>();
		//�洢���п����˺�����ļ���
		Map<String, String> users = new Hashtable<>();
		users.put("tom","111");//�û���������
		users.put("jack","222");
		users.put("kelly","333");
		users.put("red","444");
		users.put("blue","555");
		users.put("green","666");
		users.put("����","777");

		//����2�����ϴ���application��
		application.setAttribute("users", users);
		application.setAttribute("online", online);*/
    	/*ServletContext,��һ��ȫ�ֵĴ�����Ϣ�Ŀռ䣬��������ʼ����ʹ��ڣ��������رգ�����ͷš�
    	request��һ���û����ж����session��һ���û�һ������servletContext�������û�����һ����
    	���ԣ�Ϊ�˽�ʡ�ռ䣬���Ч�ʣ�ServletContext�У�Ҫ�ű���ġ���Ҫ�ġ������û���Ҫ������߳���
    	�ǰ�ȫ��һЩ��Ϣ��*/
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
    	System.out.println("�������ر���......");
    }
	
}
