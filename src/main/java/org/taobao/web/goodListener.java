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
    	System.out.println("服务器开启中......");
		/*//获得application对象 request.getSession().getServletContext();请求得到ServletContext()
		ServletContext application = sce.getServletContext();
		//存储在线用户账号的集合
		List<String> online = new ArrayList<>();
		//存储所有可用账号密码的集合
		Map<String, String> users = new Hashtable<>();
		users.put("tom","111");//用户名和密码
		users.put("jack","222");
		users.put("kelly","333");
		users.put("red","444");
		users.put("blue","555");
		users.put("green","666");
		users.put("张三","777");

		//将这2个集合存入application中
		application.setAttribute("users", users);
		application.setAttribute("online", online);*/
    	/*ServletContext,是一个全局的储存信息的空间，服务器开始，其就存在，服务器关闭，其才释放。
    	request，一个用户可有多个；session，一个用户一个；而servletContext，所有用户共用一个。
    	所以，为了节省空间，提高效率，ServletContext中，要放必须的、重要的、所有用户需要共享的线程又
    	是安全的一些信息。*/
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
    	System.out.println("服务器关闭中......");
    }
	
}
