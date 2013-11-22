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
public class Logout extends HttpServlet {

	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		req.getSession().removeAttribute("userin");
		req.getSession().removeAttribute("User");
		req.getSession().removeAttribute("username");
		
		
		req.getSession().setAttribute("msg", "Се одјавивте!");
		
		
		resp.sendRedirect("login.jsp");
	}
	
}
