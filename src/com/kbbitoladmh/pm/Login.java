package com.kbbitoladmh.pm;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.kbbitoladmh.pm.util.MessageHelper;

@SuppressWarnings("serial")
public class Login extends HttpServlet {
	private static final Logger log = Logger.getLogger(Login.class.getName());

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
			resp.sendRedirect("login.jsp");
//		super.doGet(req, resp);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MessageHelper mh = new MessageHelper();
	
		
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
//		System.out.println(username);
//		System.out.println(password);
		
		
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		
	
		
		
		Query getuser = new Query("Users").addFilter("username", FilterOperator.EQUAL , username.toLowerCase());
		
		List<Entity> users = datastore.prepare(getuser).asList(FetchOptions.Builder.withLimit(5));
		
		Entity la = new Entity("Loginatempt");
		
		if(users.size()>0){
//			System.out.println("user FOUND");
			Entity loginuser = users.get(0);
			if(loginuser.getProperty("password").equals(password)){
//				System.out.println("Password correct");
				
				req.getSession().setAttribute("User", loginuser);
				req.getSession().setAttribute("userin", true);
				req.getSession().setAttribute("username", loginuser.getProperty("username"));
				
				la.setProperty("user", username);la.setProperty("suc", "true");la.setProperty("date", new Date());
				if(!("admin".equals(username)))
					log.info("logged in " +username);
				
				resp.sendRedirect("psearch.jsp");
				
				
			}else{
				la.setProperty("user", username);la.setProperty("suc", "false");la.setProperty("com", "wrongpass");la.setProperty("date", new Date());
				mh.addErrorMessage(req, "Погрешна Лозинка ! ");
//				System.out.println("Password InCORRECT");
				resp.sendRedirect("login.jsp");
				
			}
		}else{
			la.setProperty("user", username);la.setProperty("suc", "false");la.setProperty("com", "wronuser");la.setProperty("date", new Date());
			mh.addErrorMessage(req, "Погрешно Корисничко Име ! ");
//			System.out.println("user NOT found");
			resp.sendRedirect("login.jsp");
			

		}
		
		if(!("admin".equals(username)))
			datastore.put(la);
		
		//getuser = 
		
		//datastore.
		
		
	}
	
}
