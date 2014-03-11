package com.kbbitoladmh.pm;

import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
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
import com.google.appengine.api.datastore.Query.SortDirection;
import com.kbbitoladmh.pm.util.MessageHelper;

@SuppressWarnings("serial")
public class Patientsearch extends HttpServlet {
private static final Logger log = Logger.getLogger(Patientsearch.class.getName());

	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

		
		if(null == req.getSession().getAttribute("userin")){
			resp.sendRedirect("login.jsp");
//			System.out.println("Redirected to login");
		}else{
			if(!(req.getSession().getAttribute("userin").equals(true))){
				resp.sendRedirect("login.jsp");
//				System.out.println("Redirected to login");
			}else{
				
				 RequestDispatcher d = getServletContext().getRequestDispatcher("/psearch.jsp");
				 d.forward(req, resp);
				
			}
		}
		
		
		
		
	}
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		System.out.println("do search called");
		String username = (String) req.getSession().getAttribute("username");
		if(!("admin".equals(username)))
			log.info( "search called " );
		
		MessageHelper mh = new MessageHelper();
		boolean allRequiredPassed = true;
		
		String first = req.getParameter("ime");
		String last = req.getParameter("prezime");
		String emb = req.getParameter("emb");
		String redenbroj = req.getParameter("redenbr");
		
		if(!("admin".equals(username)))
			log.info( "search called " +username+ " [" + first  + "] [" +  last + "] [" + emb + "] ["+ redenbroj+ "]" );
		
		
		
		Entity e = new Entity("Patient");
		
		e.setProperty("ime", first);
		e.setProperty("prezime", last);
		e.setProperty("emb", emb);
		e.setProperty("redenbr", redenbroj);
		
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

		
		
		Query allptsquesry  = new Query("Patient").addSort("ime", SortDirection.ASCENDING);
		
		if(!("".equals(first))) allptsquesry.addFilter("imeCL",FilterOperator.EQUAL,first.toLowerCase());
		if(!("".equals(last))) allptsquesry.addFilter("prezimeCL",FilterOperator.EQUAL,last.toLowerCase());
		if(!("".equals(emb))) allptsquesry.addFilter("emb",FilterOperator.EQUAL,emb);
		if(!("".equals(redenbroj))) allptsquesry.addFilter("redenbr",FilterOperator.EQUAL,redenbroj);
		
		
		
		//Query getptbyid = new Query("Patient").addFilter("emb", FilterOperator.EQUAL, emb);
		
		
		
		List<Entity> allpts = (List<Entity>) datastore.prepare(allptsquesry).asList(FetchOptions.Builder.withLimit(50));
		
		
		req.setAttribute("allpts", allpts);
		req.setAttribute("p", e);
		
	

		RequestDispatcher d = getServletContext().getRequestDispatcher("/psearch.jsp");
		 d.forward(req, resp);
		
		
		
	}
	
}

