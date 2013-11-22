package com.kbbitoladmh.pm;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.Cursor;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Projection;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.SortDirection;
import com.kbbitoladmh.pm.util.MessageHelper;

@SuppressWarnings("serial")
public class Patientsearch extends HttpServlet {

	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

		
		if(null == req.getSession().getAttribute("userin")){
			resp.sendRedirect("login.jsp");
			System.out.println("Redirected to login");
		}else{
			if(!(req.getSession().getAttribute("userin").equals(true))){
				resp.sendRedirect("login.jsp");
				System.out.println("Redirected to login");
			}else{
				
				 RequestDispatcher d = getServletContext().getRequestDispatcher("/psearch.jsp");
				 d.forward(req, resp);
				
			}
		}
		
		
		
		
	}
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("do search called");
		MessageHelper mh = new MessageHelper();
		boolean allRequiredPassed = true;
		
		String first = req.getParameter("first");
		String last = req.getParameter("last");
		String emb = req.getParameter("emb");
		
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

		
		
		Query allptsquesry  = new Query("Patient").addSort("first", SortDirection.ASCENDING);
		
		
		
		List<Entity> allpts = (List<Entity>) datastore.prepare(allptsquesry).asList(FetchOptions.Builder.withLimit(100));
		
		
		req.setAttribute("allpts", allpts);
		
		

//		List<Entity> users = datastore.prepare(getuser).asList(FetchOptions.Builder.withLimit(5));
		
		for (Iterator iterator = allpts.iterator(); iterator.hasNext();) {
			Entity entity = (Entity) iterator.next();
			System.out.println(entity.getProperty("first"));
		}

		
//		if(emb.length()==0){
//			mh.addMessage(req, "emb is required");allRequiredPassed = false;
//		}
//		if(last.length()==0){
//			mh.addMessage(req, "firstname is required");allRequiredPassed = false;
//		}
//		if(first.length()==0){
//			mh.addMessage(req, "lastname is required");allRequiredPassed = false;
//		}
		
		
//		 if(allRequiredPassed == false){
//			 RequestDispatcher d = getServletContext().getRequestDispatcher("/padd.jsp");
//			 d.forward(req, resp);
//		   return;   
//		 }
		
//		Entity patient = new Entity("Patient", emb);
//		patient.setProperty("first", first);
//		patient.setProperty("last", last);
//		patient.setProperty("emb", emb);
//		patient.setProperty("ptaddress1", ptaddress1);
//		patient.setProperty("naod", naod);
//
//		
//		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
//		datastore.put(patient);
//		
//		req.getSession().setAttribute("msg", "Pt stored successfuly with key" + patient.getKey());
//
//		
		RequestDispatcher d = getServletContext().getRequestDispatcher("/psearch.jsp");
		 d.forward(req, resp);
		
		
		
	}
	
}

