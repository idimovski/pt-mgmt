package com.kbbitoladmh.pm;

import java.io.IOException;
import java.util.List;

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

@SuppressWarnings("serial")
public class Login extends HttpServlet {

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
			resp.sendRedirect("login.jsp");
//		super.doGet(req, resp);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		System.out.println(username);
		System.out.println(password);
		
		
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		
	
		
		
		Query getuser = new Query("Users").addFilter("username", FilterOperator.EQUAL , username.toLowerCase());
		
		List<Entity> users = datastore.prepare(getuser).asList(FetchOptions.Builder.withLimit(5));
		
		if(users.size()>0){
			System.out.println("user FOUND");
			Entity loginuser = users.get(0);
			if(loginuser.getProperty("password").equals(password)){
				System.out.println("Password correct");
				
				req.getSession().setAttribute("User", loginuser);
				req.getSession().setAttribute("userin", true);
				req.getSession().setAttribute("username", loginuser.getProperty("username"));
				
				resp.sendRedirect("psearch.jsp");
				
				
			}else{
				System.out.println("Password InCORRECT");
				resp.sendRedirect("login.jsp");
			}
		}else{
			System.out.println("user NOT found");
			resp.sendRedirect("login.jsp");

		}
		
		//getuser = 
		
		//datastore.
		
		
	}
	
}
