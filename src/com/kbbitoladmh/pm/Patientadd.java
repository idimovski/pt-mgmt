package com.kbbitoladmh.pm;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Transaction;
import com.kbbitoladmh.pm.util.MessageHelper;

@SuppressWarnings("serial")
public class Patientadd extends HttpServlet {

	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
//		req.getSession().removeAttribute("userin");
		
		
//		req.getSession().setAttribute("msg", "Please Log in");
		
		if(null == req.getSession().getAttribute("userin")){
			resp.sendRedirect("login.jsp");
			System.out.println("Redirected to login");
		}else{
			if(!(req.getSession().getAttribute("userin").equals(true))){
				resp.sendRedirect("login.jsp");
				System.out.println("Redirected to login");
			}else{
				
				 RequestDispatcher d = getServletContext().getRequestDispatcher("/padd.jsp");
				 d.forward(req, resp);
				
			}
		}
		
		
		
		
	}
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("do post called");
		MessageHelper mh = new MessageHelper();
		boolean allRequiredPassed = true;
		
		String first = req.getParameter("first");
		String last = req.getParameter("last");
		String emb = req.getParameter("emb");
		String ptaddress1 = req.getParameter("ptaddress1");
		String naod = req.getParameter("naod");
		
		Entity patient = new Entity("Patient");
		patient.setProperty("first", first);
		patient.setProperty("last", last);
		patient.setProperty("emb", emb);
		patient.setProperty("ptaddress1", ptaddress1);
		patient.setProperty("naod", naod);
		
		
		req.setAttribute("pte", patient);

		
		if(emb.length()==0){
			mh.addMessage(req, "emb is required");allRequiredPassed = false;
		}
		if(last.length()==0){
			mh.addMessage(req, "firstname is required");allRequiredPassed = false;
		}
		if(first.length()==0){
			mh.addMessage(req, "lastname is required");allRequiredPassed = false;
		}
		
		
		
		
		
		 if(allRequiredPassed == false){
			 RequestDispatcher d = getServletContext().getRequestDispatcher("/padd.jsp");
			 d.forward(req, resp);
		   return;   
		 }
		
		
		patient = new Entity("Patient", emb);
		patient.setProperty("first", first);
		patient.setProperty("last", last);
		patient.setProperty("emb", emb);
		patient.setProperty("ptaddress1", ptaddress1);
		patient.setProperty("naod", naod);

		
		
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		
		Transaction tr = datastore.beginTransaction();
		
		datastore.put(tr,patient);
		
		tr.commit();
		
//		add all
		
//		List<Entity> l = new ArrayList<>();
//		for (int i = 1; i < 100000; i++) {
//			Entity patient1 = new Entity("Patient", i);
//			patient.setProperty("first", first);
//			patient.setProperty("last", last);
//			patient.setProperty("emb", emb);
//			patient.setProperty("ptaddress1", ptaddress1);
//			patient.setProperty("naod", naod);
//			l.add(patient1);
//			
//		}
//		System.out.println("put start");
//		datastore.put(l);
//		System.out.println("put end");
		
		
		
//		delete all
//		Query getpatient = new Query("Patient");
//		List<Entity> allPs = datastore.prepare(getpatient).asList(FetchOptions.Builder.withLimit(100000));
//		System.out.println(allPs.size());
//	
//		List<Key> listKeys = new ArrayList<>();
//		for (Iterator iterator = allPs.iterator(); iterator.hasNext();) {
//			Entity entity = (Entity) iterator.next();
//			
//			
//			System.out.println("deleted " + entity.getKey());;
//			listKeys.add(entity.getKey());
//			
//		}
//		datastore.delete(listKeys);
//		datastore.getCurrentTransaction().commit();
		
		
		//req.getSession().setAttribute("msg", "Pt stored successfuly with key" + patient.getKey());

		
		RequestDispatcher d = getServletContext().getRequestDispatcher("/padd.jsp");
		 
		 d.forward(req, resp);
		
		
		
	}
	
}


