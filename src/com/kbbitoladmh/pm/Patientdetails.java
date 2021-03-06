package com.kbbitoladmh.pm;

import java.io.IOException;
import java.security.KeyFactory;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.apphosting.datastore.EntityV4.Key;

@SuppressWarnings("serial")
public class Patientdetails extends HttpServlet {

	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		 System.out.println("do get get pt");
		

		
		if(null == req.getSession().getAttribute("userin")){
			resp.sendRedirect("login.jsp");
//			System.out.println("Redirected to login");
		}else{
			if(!(req.getSession().getAttribute("userin").equals(true))){
				resp.sendRedirect("login.jsp");
//				System.out.println("Redirected to login");
			}else{
				
				String key =req.getParameter("ptid");
				Entity e =loadpt(key);
				req.setAttribute("pte", e);
				RequestDispatcher d = getServletContext().getRequestDispatcher("/padd.jsp");
				d.forward(req, resp);
				
			}
		}
		
		
		
		
		
		
		
	}
	
	
	private Entity loadpt(String stringKey) {
		DatastoreService store = DatastoreServiceFactory.getDatastoreService();

		Query getptbyid = new Query("Patient").addFilter("redenbr", FilterOperator.EQUAL, stringKey);

	
		Entity e = store.prepare(getptbyid).asSingleEntity();
		
		
		return e;
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		System.out.println("do post get pt");
//		MessageHelper mh = new MessageHelper();
//		boolean allRequiredPassed = true;
//		
//		String first = req.getParameter("first");
//		String last = req.getParameter("last");
//		String emb = req.getParameter("emb");
//		
//		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
//
//		
//		
//		Query allptsquesry  = new Query("Patient").addSort("first", SortDirection.ASCENDING);
//		
//		
//		
//		List<Entity> allpts = (List<Entity>) datastore.prepare(allptsquesry).asList(FetchOptions.Builder.withLimit(100));
//		
//		
//		req.setAttribute("allpts", allpts);
//		
//		
//
////		List<Entity> users = datastore.prepare(getuser).asList(FetchOptions.Builder.withLimit(5));
//		
//		for (Iterator iterator = allpts.iterator(); iterator.hasNext();) {
//			Entity entity = (Entity) iterator.next();
//			System.out.println(entity.getProperty("first"));
//		}
//
//		
////		if(emb.length()==0){
////			mh.addMessage(req, "emb is required");allRequiredPassed = false;
////		}
////		if(last.length()==0){
////			mh.addMessage(req, "firstname is required");allRequiredPassed = false;
////		}
////		if(first.length()==0){
////			mh.addMessage(req, "lastname is required");allRequiredPassed = false;
////		}
//		
//		
////		 if(allRequiredPassed == false){
////			 RequestDispatcher d = getServletContext().getRequestDispatcher("/padd.jsp");
////			 d.forward(req, resp);
////		   return;   
////		 }
//		
////		Entity patient = new Entity("Patient", emb);
////		patient.setProperty("first", first);
////		patient.setProperty("last", last);
////		patient.setProperty("emb", emb);
////		patient.setProperty("ptaddress1", ptaddress1);
////		patient.setProperty("naod", naod);
////
////		
////		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
////		datastore.put(patient);
////		
////		req.getSession().setAttribute("msg", "Pt stored successfuly with key" + patient.getKey());
////
////		
//		RequestDispatcher d = getServletContext().getRequestDispatcher("/psearch.jsp");
//		 d.forward(req, resp);
		
		
		
	}
	
}

