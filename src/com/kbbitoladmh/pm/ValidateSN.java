package com.kbbitoladmh.pm;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.FilterOperator;

@SuppressWarnings("serial")
public class ValidateSN extends HttpServlet {

	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		System.out.println("do get validate");
		String emb = "";
		emb = req.getParameter("emb").trim();
		System.out.println("emb " + emb);
		String response = "Notfound";
		
		if(emb.length()>0){
			DatastoreService store = DatastoreServiceFactory.getDatastoreService();
	
			Query getptbyid = new Query("Patient").addFilter("emb", FilterOperator.EQUAL, emb);
			
			Entity e = store.prepare(getptbyid).asSingleEntity();
			
			if (null != e){
				System.out.println("found");
				response = "found";
			}else{
				response = "Notfound";
			}
			
		}
		
		
		resp.getWriter().write(response);
		

	
		
		
		
	}
	

	
}

